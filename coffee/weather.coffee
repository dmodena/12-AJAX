# Defining file names
bcFile = "BCweather.xml"
mbFile = "ManitobaWeather.xml"



# Function to be fired when document is loaded
onLoad = ->
  province = document.getElementById "province"
  city = document.getElementById "city"
  province.addEventListener "change", provinceChange
  city.addEventListener "change", cityChange
  return

# Checks for selected province input
provinceChange = ->
  province = document.getElementById "province"
  city = document.getElementById "city"
  cityLabel = document.getElementById "cityLabel"
  pnone = document.getElementById "pnone"
  cnone = document.getElementById "cnone"
  bc = document.getElementById "bc"
  mb = document.getElementById "mb"
  if province.value is "none"
    cleanChildren city
    cityStandard city
    cityLabel.setAttribute "class", "disabled"
    city.setAttribute "disabled", "disabled"
  else if province.value is "bc"
    cityLabel.removeAttribute "class"
    city.removeAttribute "disabled"
    requestURL bcFile, false
  else if province.value is "mb"
    cityLabel.removeAttribute
    city.removeAttribute "disabled"
    requestURL mbFile, false
  return

# Checks for selected city input
cityChange = ->
  province = document.getElementById "province"
  city = document.getElementById "city"
  pnone = document.getElementById "pnone"
  cnone = document.getElementById "cnone"
  bc = document.getElementById "bc"
  mb = document.getElementById "mb"
  unless city.value is "none"
    if province.value is "bc"
      requestURL bcFile, true
    else if province.value is "mb"
      requestURL mbFile, true
  return

# Return content based on option
requestURL = (url, c) ->
  status = document.getElementById "status"
  ajax = startAjax()
  if ajax isnt null
    ajax.onreadystatechange = ->
      if (ajax.readyState is 4 and ajax.status is 200)
        status.innerHTML = "OK"
        unless c is on
          createList ajax
        else
          displayCity ajax
        return
      else
        status.innerHTML = "Loading"
        return
    ajax.open "GET", url
    ajax.send()
  else
    status.innerHTML = "Failed"
  return

# Starts Ajax object
startAjax = ->
  if window.XMLHttpRequest
    ajax = new XMLHttpRequest()
  else if window.ActiveXObject
    try
      ajax = new ActiveXObject "Msxml2.XMLHTTP"
    catch e
      ajax = new ActiveXObject "Microsoft.XMLHTTP"
  ajax

# Clean children elements
cleanChildren = (container) ->
  while container.hasChildNodes()
    container.removeChild container.lastChild
  return

# Adds a standard option on city element
cityStandard = (city) ->
  noOptionText = document.createTextNode "Please Select"
  noOption = document.createElement "option"
  noOption.setAttribute "id", "cnone"
  noOption.setAttribute "value", "none"
  noOption.appendChild noOptionText
  city.appendChild noOption

# Adding Event Listener when DOM is loaded
document.addEventListener "DOMContentLoaded", onLoad, false
