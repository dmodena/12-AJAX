displayCity = (ajax) ->
  # Getting value of selected city
  cityOutput = document.getElementById "container"
  citySelect = document.getElementById "city"
  chosenCity = citySelect.value

  # Cleaning city output
  cleanChildren cityOutput

  # Getting document as XML
  xmlDoc = ajax.responseXML

  # Saving elements in variables
  cities = xmlDoc.getElementsByTagName "city"

  # Finding chosen element
  for city in cities
    # Creating collections
    names = city.getElementsByTagName "name"
    temperatures = city.getElementsByTagName "temperature"
    winds = city.getElementsByTagName "wind"
    humidities = city.getElementsByTagName "humidity"
    pressures = city.getElementsByTagName "pressure"
    visibilities = city.getElementsByTagName "visibility"

    # Copying content in variables
    name = names[0]
    temperature = temperatures[0]
    wind = winds[0]
    humidity = humidities[0]
    pressure = pressures[0]
    visibility = visibilities[0]

    # If element is found
    if name.childNodes[0].textContent is chosenCity
      tempP = document.createElement "p"
      windP = document.createElement "p"
      humiP = document.createElement "p"
      presP = document.createElement "p"
      visiP = document.createElement "p"

      # Creating output
      textN = "Temperature: " + temperature.childNodes[0].textContent
      tempP.innerHTML = textN
      textN = "Wind: " + wind.childNodes[0].textContent
      windP.innerHTML = textN
      textN = "Humidity: " + humidity.childNodes[0].textContent
      humiP.innerHTML = textN
      textN = "Pressure: " + pressure.childNodes[0].textContent
      presP.innerHTML = textN
      textN = "Visibility: " + visibility.childNodes[0].textContent
      visiP.innerHTML = textN

  # Adding output
  cityOutput.appendChild tempP
  cityOutput.appendChild windP
  cityOutput.appendChild humiP
  cityOutput.appendChild presP
  cityOutput.appendChild visiP
  return
