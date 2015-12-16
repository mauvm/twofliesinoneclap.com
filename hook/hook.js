var connect = require('connect')
var http = require('http')
var path = require('path')
var exec = require('child_process').exec

var app = connect()
var port = process.env.HOOK_PORT || 9001

app.use(function (req, res) {
	exec('git pull', { cwd: path.resolve(__dirname, '..') }, function(err, stdout, stderr) {
		if (err) console.error(err)
		if (stderr) console.error(stderr)
		console.log(stdout)
	})
	res.end('')
})

console.log("Listening for pull hook on port", port)
http.createServer(app).listen(port)
