const express = require('express');
const app = express();
const bodyParser = require("body-parser");
const moment = require('moment');
const d3 = require("d3");

app.use(express.static('client'));
app.use(bodyParser.urlencoded({ extended: true }));
//app.use(bodyParser.json());

app.get('/export', (req, res, next) => {
  res.send('hi there, this is a get');
})

app.post('/export', (req, res, next) => {
  const filename = 'Locate ' + moment().format('YYYY-MM-DD-HH-mm-ss') + '.csv';
  res.setHeader('Content-disposition', 'attachment; filename="' + filename);
  res.setHeader('Content-type', 'text/plain');
  
  var log = JSON.parse(req.body.data);
  var logCsv = d3.csvFormat(log);

  res.send(logCsv);
  
//  res.send('hi there, this is a post');

})

//const router = express.Router();
//app.use('/api', router);
//
//router.get('/', (req, res, next) => {
//  res.send('heyyyy, you made an api call!');
//});

const port = process.env.PORT || 3000;

const server = app.listen(port, function () {
  console.log('Server running at http://127.0.0.1:' + port + '/');
});