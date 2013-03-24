hellos = [
    "Hei %",
    "God dag, %!",
]

mornings = [
    "God morgen %",
    "God morgen til deg også, %",
    "God dag, %",
    "Morn %"
]

evenings = [
  "God kveld, %",
  "God aften, %"
]

nights = [
  "God natt, %",
  "Natta %!"
]

module.exports = (robot) ->
  robot.hear /(hallo|hei|god (dag|ettermiddag))/i, (msg) ->
    respondFrom(msg, hellos)

  robot.hear /god morgen|morn/i, (msg) ->
    respondFrom(msg, mornings)

  robot.hear /god (aften|kveld)/i, (msg) ->
    respondFrom(msg, evenings)

  robot.hear /god natt|natta/i, (msg) ->
    respondFrom(msg, nights)

  respondFrom = (msg, list) ->
    if msg.message.text.indexOf(robot.name) != -1
      hello = msg.random list
      msg.send hello.replace "%", msg.message.user.name
