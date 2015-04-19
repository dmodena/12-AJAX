createList = (ajax) ->
  # Getting output combobox
  cityOutput = document.getElementById "city"

  # Getting document as XML
  xmlDoc = ajax.responseXML

  # Saving elements in variables
  city = xmlDoc.getElementsByTagName "city"

  # Looping through xml elements
  for i in city
    # Copying content in variables
    name = city[i].getElementsByTagName "name"[0]
    temperature = city[i].getElementsByTagName "temperature"[0]
    wind = city[i].getElementsByTagName "wind"[0]
    humidity = city[i].getElementsByTagName "humidity"[0]
    pressure = city[i].getElementsByTagName "pressure"[0]
    visibility = city[i].getElementsByTagName "visibility"[0]

    # Adding city elements to city select
    optionText = document.createTextNode name.childNodes[0].textContent
    thisOption = document.createElement "option"
    thisOption.appendChild optionText
    city.appendChild thisOption
  null
