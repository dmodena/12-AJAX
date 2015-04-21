var createList;

createList = function(ajax) {
  var cities, city, cityOutput, humidities, humidity, i, len, name, names, optionText, pressure, pressures, temperature, temperatures, thisOption, visibilities, visibility, wind, winds, xmlDoc;
  cityOutput = document.getElementById("city");
  xmlDoc = ajax.responseXML;
  cities = xmlDoc.getElementsByTagName("city");
  for (i = 0, len = cities.length; i < len; i++) {
    city = cities[i];
    names = city.getElementsByTagName("name");
    temperatures = city.getElementsByTagName("temperature");
    winds = city.getElementsByTagName("wind");
    humidities = city.getElementsByTagName("humidity");
    pressures = city.getElementsByTagName("pressure");
    visibilities = city.getElementsByTagName("visibility");
    name = names[0];
    temperature = temperatures[0];
    wind = winds[0];
    humidity = humidities[0];
    pressure = pressures[0];
    visibility = visibilities[0];
    optionText = document.createTextNode(name.childNodes[0].textContent);
    thisOption = document.createElement("option");
    thisOption.appendChild(optionText);
    cityOutput.appendChild(thisOption);
  }
};
