$ ->
  $('#bc').on 'click', (event) ->
    loadContent "bc"
  $('#mb').on 'click', (event) ->
    loadContent "mb"

# Loads different content based on user input selection
loadContent = (option) ->
  if option is "bc"
    requestURL "BCweather.xml"
  else if option is "mb"
    requestURL "ManitobaWeather.xml"
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
    ajax = new XMLHttpRequest
  else if window.ActiveXObject
    try
      ajax = new ActiveXObject "Msxml2.XMLHTTP"
    catch e
      ajax = new ActiveXObject "Microsoft.XMLHTTP"
  ajax
