# Function example
amount_billable = (hours, rate, tax_rate = 1.05) -> hours * rate * tax_rate

# Array example
sub_grid = [
  5, 3, 0
  6, 0, 0
  0, 9, 8
]

# Ranges
months = [1..12]
March_to_may = [2..4]
months[2..4] = ["March", "April", "May"]
countdown = [15..0]

# Splats
allocatePoints = (first, second, rest...) ->
  addPointsToUser first, 5
  addPointsToUser second, 3
  # Regular FOR loop
    # for user in rest
    #   addPointsToUser user, 1
  # Comprehension
  addPointsToUser user, 1 for user in rest
addPointsToUser = (user, points) ->
  console.log "#{user} was assigned #{points} points"
users = [
  "Andrew"
  "Josh"
  "Laureen"
  "Maureen"
]
allocatePoints users...

# Simple FOR loops
multiples = (num * 2) for num in [1..10]

# ? operator
last_login ?= "unknown"
message = "Your last login was from: #{last_login}"

# Classes
class Animal
  constructor: (name) ->
    @name = name
  makeNoise: (noise) ->
    console.log "#{@name} makes noise #{noise}"
class Dog extends Animal
  makeNoise: ->
    super "bark"
class Cat extends Animal
  makeNoise: ->
    super "nyan"
dog = new Dog "Bingo"
cat = new Cat "Pop Tart Cat"
dog.makeNoise()
cat.makeNoise()
