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

module.exports = (robot) ->
  robot.hear /(hallo|hei|god (dag|ettermiddag|kveld)|<3)/i, (msg) ->
    if msg.message.text.indexOf(robot.name) != -1
      hello = msg.random hellos
      msg.send hello.replace "%", msg.message.user.name

  robot.hear /god morgen|morn/i, (msg) ->
    if msg.message.text.indexOf(robot.name) != -1
      hello = msg.random mornings
      msg.send hello.replace "%", msg.message.user.name

