# Description:
#   None
#
# Configuration:
#   HDO_ELECTION_DATE
#
# Commands:
#   hubot hvor mange dager til valget
#
# Author:
#   jarib

module.exports = (robot) ->
  robot.hear /((?:hvor mange )?dager|hvor lenge) (?:er det )?til valg(et)?|når er valget/i, (msg) ->
    election = new Date(process.env.HDO_ELECTION_DATE)
    msg.send distanceUntil(election) + " til Valg " + election.getFullYear();

  distanceUntil = (end) ->
    sec = 1000
    min = sec * 60
    hour = min * 60
    day = hour * 24
    year = day * 365

    now = new Date()
    distance = end - now

    yearsLeft = Math.floor(distance / year)
    daysLeft = Math.floor(distance % year / day)
    hoursLeft = Math.floor((distance % day) / hour)
    minutesLeft = Math.floor((distance % hour) / min)
    secondsLeft = Math.floor((distance % min) / sec)

    response = "#{daysLeft} dager #{hoursLeft} timer #{minutesLeft} minutter og #{secondsLeft} sekunder"

    if yearsLeft > 0
      response = "#{yearsLeft} år #{response}"

    response






