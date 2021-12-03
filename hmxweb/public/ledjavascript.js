
function processPlayQueue(q)
{
    var elem = document.getElementById("playQ");

    var s = "";
    for (var i = 0; i < q.length; i++)
    {
        if (i!= 0) s += " | ";
        s += q[i].title + " by " + q[i].author;
    }
    elem.textContent = s;
}

currentPlay = "";
function processNowPlaying(data) {
  var np = document.getElementById("nowplaying");
  if (typeof data.title != "undefined") {
    if (currentPlay != data.title + " by " + data.author) {
      currentPlay = data.title + " by " + data.author;
      np.innerHTML = "<big><strong>" + data.title + " by " + data.author +
                     "</strong></big>";
    }
  } else
    np.innerHTML = "nothing";
}



function cacheCurrentScript()
{
    var script = editor.getValue();
    if (script)
    {
        window.localStorage.setItem("jsworkingscript", script);
        window.localStorage.setItem("jscursorpos", editor.getCursor());
        window.localStorage.setItem("jsworkingauthor", document.getElementById('author').value);
        window.localStorage.setItem("jsworkingtitle", document.getElementById('scriptTitle').value);
    }
}

function restoreScriptCache()
{
    var script = window.localStorage.getItem("jsworkingscript");
    var author = window.localStorage.getItem("jsworkingauthor");
    var title = window.localStorage.getItem("jsworkingtitle");
    var cursorPos = window.localStorage.getItem("jscursorpos");
    if (script)
    {
        editor.setValue(script);
        editor.clearSelection();
        if (cursorPos) editor.setCursor(cursorPos);
        document.getElementById('scriptTitle').value = title;
        document.getElementById('author').value = author;
    }
}

function saveScript(title, script, feedback)
{
    if (title && script)
    {
      window.localStorage.setItem("script:" + title, script);
      linkExistingScripts();
      showForTime(feedback, "<span class=\"fbGood\">Script '" + title + "' saved </span>", 5000);
  }
    else
    {
        showForTime(feedback, "<span class=\"fbBad\">To save a script, you must provide a title</span>", 5000);
    }
}

function deleteScript(title, script)
{
    if (title)
    {
      window.localStorage.removeItem("script:" + title);
      linkExistingScripts();
  }
}

function newScript()
{
    editor.setValue("");
    editor.clearSelection();
    document.getElementById('scriptTitle').value = "";
}

function loadScript(title)
{
  var script = window.localStorage.getItem("script:" + title, script);
    editor.setValue(script);
    editor.clearSelection();
  document.getElementById('scriptTitle').value = title;
}

function loadCannedScript(title)
{
    console.log("load canned: " + title);
    var script;
    asyncPage("/API/1.0/script/" + title + ".js", function(e) {
        if (this.readyState == 4) // Response received
        {
            if (this.status == 200) // OK
            {
                var response = this.responseText;
                editor.setValue(response);
                editor.clearSelection();
                document.getElementById('scriptTitle').value = title;
            }
        }
    });
}

function linkExampleScripts()
{
    document.getElementById('exampleScripts').innerHTML = '<a href="" onclick="loadCannedScript(\'help\'); return false;">help</a>';
}

function linkExistingScripts()
{
    var i;
    choices = "";
    for (i = 0; i < window.localStorage.length; i++)
    {
        var key = window.localStorage.key(i);
        if (key.startsWith("script:"))
        {
            var title=key.substr(7);
            //console.log(title);
            if (title == "") title = "unnamed";
            if (choices != "") choices += "  |   ";
            choices += '<a href="" onclick="loadScript(\'' + title + "'); return false;\">" + title + "</a> ";
        }
        //console.log(choices);
        document.getElementById('availableScripts').innerHTML = choices;
    }
}

const restoreButton = document.getElementById("restoreButton");
const restoreFileElem = document.getElementById("restoreFile");

restoreButton.addEventListener("click", function (e) {
    if (restoreFileElem)
    {
        restoreFileElem.click();
    }
}, false);

async function restoreHandler()
{
    await restoreScripts(this.files);
    linkExistingScripts();
}

restoreFileElem.addEventListener("change", restoreHandler, false);

window.onunload = cacheCurrentScript;
window.setTimeout(restoreScriptCache, 0);
window.setTimeout(linkExistingScripts, 0);
window.setTimeout(linkExampleScripts, 0);
window.setTimeout(updateQueue, 0);
window.setTimeout(updateCurrentPlay, 0);
