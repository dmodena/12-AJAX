var loadContent, requestURL, startAjax;

$(function() {
  $('#bc').on('click', function(event) {
    return loadContent("bc");
  });
  return $('#mb').on('click', function(event) {
    return loadContent("mb");
  });
});

loadContent = function(option) {
  if (option === "bc") {
    requestURL("BCweather.xml");
  } else if (option === "mb") {
    requestURL("ManitobaWeather.xml");
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
    ajax = new XMLHttpRequest;
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
