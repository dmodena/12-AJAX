var message;

$(function() {
  return $('#test').on("click", function(event) {
    return message("Hello");
  });
});

message = function(message) {
  return alert(message);
};
