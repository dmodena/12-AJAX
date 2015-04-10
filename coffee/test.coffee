$ ->
  $('#test').on "click", (event) ->
    message "Hello"

message = (message) -> alert(message)
