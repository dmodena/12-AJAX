$ ->
  $('#bc').on 'click', (event) ->
    loadContent "BCweather.xml"
    false
  $('#mb').on 'click', (event) ->
    loadContent "ManitobaWeather.xml"
    false

loadContent = (filename) ->
  $('#container').load(filename)

# Ajax call to British Columbia file
bcFile = $.ajax({
    url: 'BCweather.xml',
    success: city
  })

# Ajax call to Manitoba file
mbFile = $.ajax({
    url: 'ManitobaWeather.xml',
    success: city
  })

# Loading the 'city' elements of the file
city = ->
  $city = $('city', data)
