var bcFile, cityChange, cityStandard, cleanChildren, mbFile, onLoad, provinceChange, requestURL, startAjax;

bcFile = "BCweather.xml";

mbFile = "ManitobaWeather.xml";

onLoad = function() {
  var city, province;
  province = document.getElementById("province");
  city = document.getElementById("city");
  province.addEventListener("change", provinceChange);
  city.addEventListener("change", cityChange);
};

provinceChange = function() {
  var bc, city, cityLabel, cityOutput, cnone, mb, pnone, province;
  province = document.getElementById("province");
  city = document.getElementById("city");
  cityLabel = document.getElementById("cityLabel");
  pnone = document.getElementById("pnone");
  cnone = document.getElementById("cnone");
  bc = document.getElementById("bc");
  mb = document.getElementById("mb");
  cityOutput = document.getElementById("container");
  cleanChildren(cityOutput);
  if (province.value === "none") {
    cleanChildren(city);
    cityStandard(city);
    cityLabel.setAttribute("class", "disabled");
    city.setAttribute("disabled", "disabled");
  } else if (province.value === "bc") {
    cityLabel.removeAttribute("class");
    city.removeAttribute("disabled");
    requestURL(bcFile, false);
  } else if (province.value === "mb") {
    cityLabel.removeAttribute;
    city.removeAttribute("disabled");
    requestURL(mbFile, false);
  }
};

cityChange = function() {
  var bc, city, cityOutput, cnone, mb, pnone, province;
  province = document.getElementById("province");
  city = document.getElementById("city");
  pnone = document.getElementById("pnone");
  cnone = document.getElementById("cnone");
  bc = document.getElementById("bc");
  mb = document.getElementById("mb");
  cityOutput = document.getElementById("container");
  if (city.value !== "none") {
    if (province.value === "bc") {
      requestURL(bcFile, true);
    } else if (province.value === "mb") {
      requestURL(mbFile, true);
    }
  } else {
    cleanChildren(cityOutput);
  }
};

requestURL = function(url, c) {
  var ajax, status;
  status = document.getElementById("status");
  ajax = startAjax();
  if (ajax !== null) {
    ajax.onreadystatechange = function() {
      if (ajax.readyState === 4 && ajax.status === 200) {
        status.innerHTML = "OK";
        if (c !== true) {
          createList(ajax);
        } else {
          displayCity(ajax);
        }
      } else {
        status.innerHTML = "Loading";
      }
    };
    ajax.open("GET", url);
    ajax.send();
  } else {
    status.innerHTML = "Failed";
  }
};

startAjax = function() {
  var ajax, e;
  if (window.XMLHttpRequest) {
    ajax = new XMLHttpRequest();
  } else if (window.ActiveXObject) {
    try {
      ajax = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (_error) {
      e = _error;
      ajax = new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
  return ajax;
};

cleanChildren = function(container) {
  while (container.hasChildNodes()) {
    container.removeChild(container.lastChild);
  }
};

cityStandard = function(city) {
  var noOption, noOptionText;
  noOptionText = document.createTextNode("Please Select");
  noOption = document.createElement("option");
  noOption.setAttribute("id", "cnone");
  noOption.setAttribute("value", "none");
  noOption.appendChild(noOptionText);
  return city.appendChild(noOption);
};

document.addEventListener("DOMContentLoaded", onLoad, false);
