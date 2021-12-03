var curr

window.setTimeout(updateQueue, 0);
window.setTimeout(updateCurrentPlay, 0);

function processPlayQueue(q) {
    var table = document.getElementById("playQ");
    for (var i=0; i < table.rows.length; i++) table.deleteRow(i);
    for (var i = 0; i < q.length; i++)
    {
        var row = table.insertRow(i);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        cell1.innerHTML = "\"" + q[i].title + "\"";
        cell2.innerHTML = q[i].author;
    }
}

currentPlay = "";
function processNowPlaying(data) {
  var np = document.getElementById("nowplaying");
  if (typeof data.title != "undefined") {
    if (currentPlay != data.title + " by " + data.author) {
      currentPlay = data.title + " by " + data.author;
      np.innerHTML = "<big><strong>" + data.title + " by " + data.author +
                     "</strong></big>";
      simulateScript(data.script);
    }
  } else
    np.innerHTML = "nothing";
}
