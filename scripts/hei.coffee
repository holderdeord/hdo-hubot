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

hip = [
  'Yo, %',
  'Zup, %'
]

module.exports = (robot) ->
  winkUsers = (process.env.HDO_WINK_USERS || '').split(',');

  robot.hear /(hallo|hei|god (dag|ettermiddag))/i, (msg) ->
    respondFrom(msg, hellos)

  robot.hear /god morgen|morn/i, (msg) ->
    respondFrom(msg, mornings)

  robot.hear /god (aften|kveld)/i, (msg) ->
    respondFrom(msg, evenings)

  robot.hear /god natt|natta/i, (msg) ->
    respondFrom(msg, nights)

  robot.hear /form(en)?,? @?sverdrup/i, (msg) ->
    msg.send "Storform"

  robot.hear /zup|sup|wassup|yo/i, (msg) ->
    respondFrom(msg, hip)

  respondFrom = (msg, list) ->
    if msg.message.text.indexOf(robot.name) != -1
      hello = msg.random list
      reply = hello.replace "%", msg.message.user.name

      if winkUsers.indexOf(msg.message.user.name) != -1
        reply = "#{reply} ;)"

      msg.send reply
