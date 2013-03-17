# Description:
#   None
#
# Configuration:
#   HDO_ELECTION_DATE
#   HDO_CAMPAIGN_DATE
#
# Commands:
#   hubot hvor mange dager til valget
#
# Author:
#   jarib

module.exports = (robot) ->
  robot.respond /(?:hvor mange )?dager til (valget|kampanj(e|en|estart)|rfa)/i, (msg) ->
    match = msg.match[1]

    if match == "valget"
      msg.send distanceUntil(process.env.HDO_ELECTION_DATE) + " til Valg 2013!"
    else
      msg.send distanceUntil(process.env.HDO_CAMPAIGN_DATE) + " til RfA!"

  distanceUntil = (end) ->
    sec = 1000
    min = sec * 60
    hour = min * 60
    day = hour * 24

    now = new Date()
    distance = new Date(end) - now

    daysLeft = Math.floor(distance / day)
    hoursLeft = Math.floor((distance % day) / hour)
    minutesLeft = Math.floor((distance % hour) / min)
    secondsLeft = Math.floor((distance % min) / sec)

    "#{daysLeft} dager #{hoursLeft} timer #{minutesLeft} minutter og #{secondsLeft} sekunder"
