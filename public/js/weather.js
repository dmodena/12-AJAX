var bcFile, mbFile, onLoad, requestURL, selectChange, startAjax;

bcFile = "BCweather.xml";

mbFile = "ManitobaWeather.xml";

onLoad = function() {
  var province;
  province = document.getElementById("province");
  province.addEventListener("change", selectChange);
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
};

requestURL = function(url) {
  var ajax, status;
  status = document.getElementById("status");
  ajax = startAjax();
  if (ajax !== null) {
    ajax.onreadystatechange = function() {
      if (ajax.readyState === 4 && ajax.status === 200) {
        createList(ajax);
      } else {
        status.innerHTML = "Loading content.";
      }
    };
    ajax.open("GET", url);
    ajax.send();
  } else {
    status.innerHTML = "Failed getting content.";
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

document.addEventListener("DOMContentLoaded", onLoad, false);
