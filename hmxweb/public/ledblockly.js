
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

var currentPlay = "";
function processNowPlaying(data)
{
    var np = document.getElementById("nowplaying");
    if (typeof data.title != "undefined")
    {
        if (currentPlay != data.title + " by " + data.author)
        {
            currentPlay = data.title + " by " + data.author;
            np.innerHTML = "<big><strong>" + data.title + " by " + data.author +
                "</strong></big>";
        }
    }
    else
        np.innerHTML = "nothing";
}


function bsaveScript(title, feedback)
{
    if (title)
    {
        var xml = Blockly.Xml.workspaceToDom(workspace);
        window.localStorage.setItem("blocklyscript:" + title, Blockly.Xml.domToText(xml));
        blinkExistingScripts();
        feedback.innerHTML = "<font color='green'>Script saved </font>";
    }
    else
    {
        feedback.innerHTML = "<font color='red'>To save a script, you must provide a title</font>";
    }
}

function bdeleteScript(title, script)
{
    if (title)
    {
        window.localStorage.removeItem("blocklyscript:" + title);
        blinkExistingScripts();
    }
}

function bnewScript()
{
    workspace.clear();
    document.getElementById('scriptTitle').value = "";
}

function bloadScript(title)
{
    var script = window.localStorage.getItem("blocklyscript:" + title, script);
    var xml = Blockly.Xml.textToDom(script);
    workspace.clear();
    Blockly.Xml.domToWorkspace(xml, workspace);
    document.getElementById('scriptTitle').value = title;
}

function blinkExistingScripts()
{
    var i;
    choices = "";
    for (i = 0; i < window.localStorage.length; i++)
    {
        var key = window.localStorage.key(i);
        if (key.startsWith("blocklyscript:"))
        {
            var title=key.substr(14);
            if (title == "") title = "unnamed";
            if (choices != "") choices += "  |   ";
            choices += '<a href="" onclick="bloadScript(\'' + title + "'); return false;\">" + title + "</a>  ";
        }
        //console.log(choices);
        document.getElementById('availableScripts').innerHTML = choices;
  }
}

function blinkExampleScripts()
{
    document.getElementById('exampleScripts').innerHTML = '<a href="" onclick="loadCannedScript(\'starter\'); return false;">starter</a>';
}

function loadCannedScript(title)
{
    console.log("load canned blockly script: " + title);
    var script;
    asyncPage("/API/1.0/script/" + title + ".blockly", function(e) {
        if (this.readyState == 4) // Response received
        {
            if (this.status == 200) // OK
            {
                var response = this.responseText;
                var xml = Blockly.Xml.textToDom(response);
                workspace.clear();
                Blockly.Xml.domToWorkspace(xml, workspace);
                document.getElementById('scriptTitle').value = title;
            }
        }
    });
}


function cacheCurrent()
{
     window.localStorage.setItem("blocklyworkingauthor", document.getElementById('author').value);
     window.localStorage.setItem("blocklyworkingtitle", document.getElementById('scriptTitle').value);
}

function restoreCurrent()
{
    var author = window.localStorage.getItem("blocklyworkingauthor");
    var title = window.localStorage.getItem("blocklyworkingtitle");
    document.getElementById('scriptTitle').value = title;
    document.getElementById('author').value = author;
}

function blocklyWorkspaceUpdateFunction(event)
{
  var code = Blockly.JavaScript.workspaceToCode(workspace);
  document.getElementById('blocklyCode').value = code;
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
    blinkExistingScripts();
}

workspace.addChangeListener(blocklyWorkspaceUpdateFunction);

restoreFileElem.addEventListener("change", restoreHandler, false);

// remember the user's workspace in their localstorage
BlocklyStorage.backupOnUnload();
window.onunload = cacheCurrent;
window.setTimeout(BlocklyStorage.restoreBlocks, 0);
window.setTimeout(blinkExistingScripts, 0);
window.setTimeout(blinkExampleScripts, 0);
window.setTimeout(restoreCurrent, 0);
window.setTimeout(updateQueue, 0);
window.setTimeout(updateCurrentPlay, 0);
