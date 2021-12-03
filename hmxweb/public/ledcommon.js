let nothing = null;

 function updateQueueResponseHandler(e)
{
    if (this.readyState == 4) // Response received
    {
        if (this.status == 200) // OK
        {
            var response = JSON.parse(this.responseText);
            //console.log(response);
            processPlayQueue(response);
            window.setTimeout(updateQueue, 2000);
        }
    }
}

 function updateCurrentPlayResponseHandler(e)
{
    if (this.readyState == 4) // Response received
    {
        if (this.status == 200) // OK
        {
            //console.log(this.responseText);
            var response = JSON.parse(this.responseText);
            //console.log(response);
            processNowPlaying(response);
            window.setTimeout(updateCurrentPlay, 2000);
        }
    }
}

 function showForTime(elem, info, time)
{
    elem.innerHTML = info
    window.setTimeout(function() {
        if (elem.innerHTML == info) // not overwritten
        {
            elem.innerHTML = "";
        }
    }, time);
}

 function updateQueue() {
  var xhr = new XMLHttpRequest();
  xhr.open('GET', "/API/1.0/playqueue", true);
  xhr.onreadystatechange = updateQueueResponseHandler;
  xhr.send();
}

 function updateCurrentPlay()
{
  var xhr = new XMLHttpRequest();
  xhr.open('GET', "/API/1.0/nowplaying", true);
  xhr.onreadystatechange = updateCurrentPlayResponseHandler;
  xhr.send();
}

 function asyncPage(url, handler)
{
  var xhr = new XMLHttpRequest();
  xhr.open('GET', url, true);
  xhr.onreadystatechange = handler;
  xhr.send();
}

function zipScripts()
{
    var i;
    var zip = new JSZip();
    for (i = 0; i < window.localStorage.length; i++)
    {
        var key = window.localStorage.key(i);
        if (key.startsWith("script:"))
        {
            var title=key.substr(7);
            //console.log(title);
            var script = window.localStorage.getItem("script:" + title);
            if (title == "") title = "unnamed";
            if (script != "")
                zip.file(title+".js", script)
        }
    }
    for (i = 0; i < window.localStorage.length; i++)
    {
        var key = window.localStorage.key(i);
        if (key.startsWith("blocklyscript:"))
        {
            var title=key.substr(14);
            //console.log(title);
            var script = window.localStorage.getItem("blocklyscript:" + title);
            if (title == "") title = "unnamed";
            if (script != "")
                zip.file(title+".blockly", script)
        }
    }

    zip.generateAsync({type:"blob"}).then(function(content) {
        //var author = window.localStorage.getItem("jsworkingauthor");
        saveAs(content, "ChristmasCoderScripts.zip");
    });
}


function splitNameExt(s)
{
    let sp = s.split('.');
    if (sp.length == 1) return [sp[0], null];
    let ext = sp.pop();
    return [sp.join('.'), ext];
}

async function restoreScripts(files)
{
    for (let i=0;i<files.length;i++)
    {
        let f = files[i];
        // console.log(f);
        if (f.type == "application/zip")
        {
            let zip = await JSZip.loadAsync(f);
            zip.forEach(async function (relativePath, zipEntry) {
                // console.log(zipEntry.name);
                let [ title, ext ] = splitNameExt(zipEntry.name);
                let script = await zipEntry.async("string");
                if (ext == "js")
                {
                    window.localStorage.setItem("script:" + title, script);
                }
                if (ext == "blockly")
                {
                    window.localStorage.setItem("blocklyscript:" + title, script);
                }
            });
        }
        else
        {
            let [ title, ext ] = splitNameExt(f.name);
            let script = await f.text();
            if (ext == "js")
            {
                window.localStorage.setItem("script:" + title, script);
            }
            if (ext == "blockly")
            {
                window.localStorage.setItem("blocklyscript:" + title, script);
            }
        }
    }
}

 function sendScript(scr,aut,tit, feedbackPlace)
{
    var processScriptResult = function(e) {
        if (xhr.readyState == 4) // Response received
        {
            if (xhr.status == 200) // OK
            {
                var response = JSON.parse(xhr.responseText);
                feedbackPlace.innerHTML = "<font color='green'>Script uploaded!</font>";
                // Our upload will have changed things
                updateQueue();
                updateCurrentPlay();
            }
            else
            {
                feedbackPlace.innerHTML = "<font color='red'> Script upload failed with error:" + JSON.parse(xhr.responseText) + "</font>";
            }
        }
    };

    feedbackPlace.innerHTML = "Uploading script...";
    var xhr = new XMLHttpRequest();
    xhr.open('POST', "/API/1.0/postscript", true);
    xhr.onreadystatechange = processScriptResult;
    xhr.setRequestHeader("Content-type", "application/json");
    var obj = {author: aut, script : scr,title: tit}
    //console.log("SENDING:" + aut + tit + scr);
    var thedata = JSON.stringify(obj);
    console.log("SENDING:" + thedata);
    xhr.send(thedata);
}

