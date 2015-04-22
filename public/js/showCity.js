var displayCity;

displayCity = function(ajax) {
  var chosenCity, cities, city, cityOutput, citySelect, humiP, humidities, humidity, i, len, name, names, presP, pressure, pressures, tempP, temperature, temperatures, textN, visiP, visibilities, visibility, wind, windP, winds, xmlDoc;
  cityOutput = document.getElementById("container");
  citySelect = document.getElementById("city");
  chosenCity = citySelect.value;
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
    if (name.childNodes[0].textContent === chosenCity) {
      tempP = document.createElement("p");
      windP = document.createElement("p");
      humiP = document.createElement("p");
      presP = document.createElement("p");
      visiP = document.createElement("p");
      textN = "Temperature: " + temperature.childNodes[0].textContent;
      tempP.innerHTML = textN;
      textN = "Wind: " + wind.childNodes[0].textContent;
      windP.innerHTML = textN;
      textN = "Humidity: " + humidity.childNodes[0].textContent;
      humiP.innerHTML = textN;
      textN = "Pressure: " + pressure.childNodes[0].textContent;
      presP.innerHTML = textN;
      textN = "Visibility: " + visibility.childNodes[0].textContent;
      visiP.innerHTML = textN;
    }
  }
  cityOutput.appendChild(tempP);
  cityOutput.appendChild(windP);
  cityOutput.appendChild(humiP);
  cityOutput.appendChild(presP);
  cityOutput.appendChild(visiP);
};
