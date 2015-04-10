var bcFile, city, loadContent, mbFile;

$(function() {
  $('#bc').on('click', function(event) {
    loadContent("BCweather.xml");
    return false;
  });
  return $('#mb').on('click', function(event) {
    loadContent("ManitobaWeather.xml");
    return false;
  });
});

loadContent = function(filename) {
  return $('#container').load(filename);
};

bcFile = $.ajax({
  url: 'BCweather.xml',
  success: city
});

mbFile = $.ajax({
  url: 'ManitobaWeather.xml',
  success: city
});

city = function() {
  var $city;
  return $city = $('city', data);
};
