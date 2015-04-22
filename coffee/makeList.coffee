createList = (ajax) ->
  # Getting output combobox
  cityOutput = document.getElementById "city"

  # Cleaning city output
  cleanChildren cityOutput

  # Inserting standard option
  cityStandard cityOutput

  # Getting document as XML
  xmlDoc = ajax.responseXML

  # Saving elements in variables
  cities = xmlDoc.getElementsByTagName "city"

  # Looping through xml elements
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

    # Adding city elements to city select
    optionText = document.createTextNode name.childNodes[0].textContent
    thisOption = document.createElement "option"
    thisOption.appendChild optionText
    cityOutput.appendChild thisOption
  return
