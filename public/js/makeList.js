var createList;

createList = function(ajax) {
  var city, cityOutput, humidity, i, j, len, name, optionText, pressure, temperature, thisOption, visibility, wind, xmlDoc;
  cityOutput = document.getElementById("city");
  xmlDoc = ajax.responseXML;
  city = xmlDoc.getElementsByTagName("city");
  for (j = 0, len = city.length; j < len; j++) {
    i = city[j];
    name = city[i].getElementsByTagName("name"[0]);
    temperature = city[i].getElementsByTagName("temperature"[0]);
    wind = city[i].getElementsByTagName("wind"[0]);
    humidity = city[i].getElementsByTagName("humidity"[0]);
    pressure = city[i].getElementsByTagName("pressure"[0]);
    visibility = city[i].getElementsByTagName("visibility"[0]);
    optionText = document.createTextNode(name.childNodes[0].textContent);
    thisOption = document.createElement("option");
    thisOption.appendChild(optionText);
    city.appendChild(thisOption);
  }
  return null;
};
