var express = require('express');
var router = express.Router();
var path = require('path');

/* how you'd use pug templates */
//router.get('/', function(req, res, next) {
//  res.render('index', { title: 'Express' });
//});

var currentScript = {};
var scripts = new Array();

var olderScripts = {};

function random(amt) { return Math.floor((Math.random() * amt)); }

router.get('/debug', function(req, res, next) {
    res.redirect("/API/debug");
});
router.get('/API/debug', function(req, res, next) {
    res.sendFile(path.resolve(__dirname + "/../public/debug.html"));
});


router.get('/API', function(req, res, next) {
    res.redirect("/API/1.0");
});
router.get('/API/1.0', function(req, res, next) {
    res.sendFile(path.resolve(__dirname + "/../public/api.html"));
});

router.get('/API/1.0/nowplaying', function(req, res, next) {
    console.log("now playing request\n");
    res.send(currentScript);
});

router.get('/API/1.0/playqueue', function(req, res, next) {
    console.log("play queue request\n");
    res.send(scripts);
});

router.get('/API/1.0/script/:script', function(req, res, next) {
    var s = req.params.script;
    s.replace("/",""); // don't let them change dir
    console.log("access " + __dirname + "/ledscripts/" + s);
    res.sendFile(__dirname + "/ledscripts/" + s);
});

router.get('/API/1.0/queuesize', function(req, res, next) {
    console.log("play queue size request\n");
    res.send(String(scripts.length));
});

router.get('/API/debug/clearold', function(req, res, next) {
    console.log("clear old queue\n");
    olderScripts = {};
    res.send("ok");
});

router.get('/API/debug/clearq', function(req, res, next) {
    console.log("clear current queue\n");
    scripts = new Array();
    res.send("ok");
});

router.get('/API/debug/listscripts', function(req, res, next) {
    console.log("listscripts %j\n", olderScripts );
    
    //res.send(JSON.stringify(olderScripts,null,2));
    res.send(olderScripts);
});


router.get('/API/1.0/playscript', function(req, res, next) {
    console.log("play SCRIPT request\n");
    //res.send('setManyLights(20,300,"dd00dd"); updateLights(); delay(5000);');
    if (scripts.length)
    {
        var s = scripts.shift();
        currentScript = s;
        console.log("Sending: " + s.title + ": "+ s.author + "\n" + s.script);
        res.send("r_______________" + s.script);
    }
    else  // No current script, choose a prior one at random
    {
        var available = Object.keys(olderScripts);
        if (available.length)
        {
            var idx = random(available.length);
            var s = currentScript = olderScripts[available[idx]];
            console.log("Sending: " + s.title + ": "+ s.author + "\n" + s.script);
            res.send("________________" + s.script);
        }
        else
        {
            console.log("no scripts");
            res.status(204).send('no scripts');
        }
    }
});

router.post('/API/1.0/postscript', function(req, res, next) {
    console.log("post script\n" + JSON.stringify(req.body));
    // already done: var req = JSON.parse(req.body);
    s = { script: req.body.script, author: req.body.author, title: req.body.title}
    scripts.push(s);
    olderScripts[s.title + ":" + s.author] = s;  // remember this script in case we run out
    res.send({message:'thanks!'});
});

module.exports = router;
