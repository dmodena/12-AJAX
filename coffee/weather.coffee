# Defining file names
bcFile = "BCweather.xml"
mbFile = "ManitobaWeather.xml"

# Function to be fired when document is loaded
onLoad = ->
  province = document.getElementById "province"
  province.addEventListener "change", selectChange
  return

# Checks for selected province input
selectChange = ->
  province = document.getElementById "province"
  city = document.getElementById "city"
  cityLabel = document.getElementById "cityLabel"
  pnone = document.getElementById "pnone"
  cnone = document.getElementById "cnone"
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
  return

# Return content based on option
requestURL = (url) ->
  status = document.getElementById "status"
  ajax = startAjax()
  if ajax isnt null
    ajax.onreadystatechange = ->
      if (ajax.readyState is 4 and ajax.status is 200)
        createList ajax
        return
      else
        status.innerHTML = "Loading content."
        return
    ajax.open "GET", url
    ajax.send()
  else
    status.innerHTML = "Failed getting content."
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

# Adding Event Listener when DOM is loaded
document.addEventListener "DOMContentLoaded", onLoad, false
