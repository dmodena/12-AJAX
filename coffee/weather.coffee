# Defining file names
bcFile = "BCweather.xml"
mbFile = "ManitobaWeather.xml"

# Function to be fired when document is loaded
onLoad = ->
  province = document.getElementById "province"
  province.addEventListener "change", selectChange
  null

# Checks for selected province input
selectChange = ->
  province = document.getElementById "province"
  city = document.getElementById "city"
  cityLabel = document.getElementById "cityLabel"
  none = document.getElementById "none"
  bc = document.getElementById "bc"
  mb = document.getElementById "mb"

  if province.value is "none"
    cityLabel.setAttribute "class", "disabled"
    city.setAttribute "disabled", "disabled"
  else if province.value is "bc"
    cityLabel.removeAttribute "class"
    city.removeAttribute "disabled"
    requestURL bcFile
  else if province.value is "mb"
    cityLabel.removeAttribute
    city.removeAttribute "disabled"
    requestURL mbFile
  null

# Return content based on option
requestURL = (url) ->
  ajax = startAjax()
  if ajax isnt null
    ajax.onreadystatechange = ->
      if (ajax.readyState is 4 and ajax.status is 200)
        createList ajax
      null
    ajax.open "GET", url
    ajax.send
  null

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

# Adding Event Listener when DOM is loaded
document.addEventListener "DOMContentLoaded", onLoad, false
