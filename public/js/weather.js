var bcFile, mbFile, onLoad, requestURL, selectChange, startAjax;

bcFile = "BCweather.xml";

mbFile = "ManitobaWeather.xml";

onLoad = function() {
  var province;
  province = document.getElementById("province");
  province.addEventListener("change", selectChange);
  return null;
};

selectChange = function() {
  var bc, city, cityLabel, mb, none, province;
  province = document.getElementById("province");
  city = document.getElementById("city");
  cityLabel = document.getElementById("cityLabel");
  none = document.getElementById("none");
  bc = document.getElementById("bc");
  mb = document.getElementById("mb");
  if (province.value === "none") {
    cityLabel.setAttribute("class", "disabled");
    city.setAttribute("disabled", "disabled");
  } else if (province.value === "bc") {
    cityLabel.removeAttribute("class");
    city.removeAttribute("disabled");
    requestURL(bcFile);
  } else if (province.value === "mb") {
    cityLabel.removeAttribute;
    city.removeAttribute("disabled");
    requestURL(mbFile);
  }
  return null;
};

requestURL = function(url) {
  var ajax;
  ajax = startAjax();
  if (ajax !== null) {
    ajax.onreadystatechange = function() {
      if (ajax.readyState === 4 && ajax.status === 200) {
        createList(ajax);
      }
      return null;
    };
    ajax.open("GET", url);
    ajax.send;
  }
  return null;
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

document.addEventListener("DOMContentLoaded", onLoad, false);
