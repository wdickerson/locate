var curAcc = -1234,
    curLat = -1234,
    curLon = -1234,
    curCompass = -1234,
    curAlpha = -1234,
    curBeta = -1234,
    curGamma = -1234,
    log = [];

var recButton = document.getElementById('rec-button');
var dataInput = document.getElementById('data-input');
var compassInput = document.getElementById('compass-input');
var alphaInput = document.getElementById('alpha-input');
var betaInput = document.getElementById('beta-input');
var gammaInput = document.getElementById('gamma-input');
var latInput = document.getElementById('lat-input');
var lonInput = document.getElementById('lon-input');
var accInput = document.getElementById('acc-input');

recButton.addEventListener('click', recClick);
function recClick() {
  console.log('you clicked record');
  log.push({
    time: (new Date()).toISOString(),
    lat: curLat,
    lon: curLon,
    accuracy: curAcc,
    compass: curCompass,
    alpha: curAlpha,
    beta: curBeta,
    gamma: curGamma
  });
  console.log(log.length);
  console.log(log);
  dataInput.value = JSON.stringify(log);
  //dataInput.value = log;
}


if (navigator.geolocation) {
  console.log("position AVAILABLE");
  navigator.geolocation.watchPosition(updateGps, showError, {enableHighAccuracy:true, maximumAge:Infinity, timeout:100000} );
} else {
  alert('Uh oh, your device doesn\'t support location.');
}

function updateGps(position) {
  console.log("wait gps fired");
  if(position.coords.accuracy<=30) {
    console.log('high accuracy');
  }

  curAcc = position.coords.accuracy;
  curLat = position.coords.latitude;
  curLon = position.coords.longitude;
  
  latInput.value = curLat;
  lonInput.value = curLon;
  accInput.value = curAcc;
}

function showError(error) {
  alert(error.code + ': ' + error.message);
    console.log("there was an error");
    console.log("error = "+error.code);
}

window.addEventListener("deviceorientation", onOrientation);
function onOrientation(e){
  // alpha=x beta=y gamma=z
  // target oY = 45;
  // target oZ = 0; (it goes negative)
  // oY gives you front and back. <45 means rolling away.
  // oZ gives you left and right. <0 means rolling away.
  // left and away need decrment, toward and right need increment
  if (!e) return false;
  console.log(e);
  

  if (e.webkitCompassHeading) {
    curCompass = event.webkitCompassHeading;  
  }
  curAlpha = Math.round(e.alpha * 10) / 10;
  curBeta = Math.round(e.beta * 10) / 10;
  curGamma = Math.round(e.gamma * 10) / 10;
  
  compassInput.value = curCompass;
  alphaInput.value = curAlpha;
  betaInput.value = curBeta;
  gammaInput.value = curGamma;
}

//onOrientation();