# Get Page stats from google analytics
#
# Configuration:
#   ANALYTICS_USER
#   ANALYTICS_PASSWORD
#

require('date-utils')

ga = require('googleanalytics')
util = require('util')


module.exports = (robot) ->
  robot.respond /ga (\w+)/i, (msg) ->
    metric = 'ga:' + msg.match[1]
    dimensions = ['ga:date']
    metrics = [metric]

    gac = new ga.GA({
      "user": process.env.ANALYTICS_USER,
      "password": process.env.ANALYTICS_PASSWORD
    })

    gac.login (err, token) ->
      if !err
        options = {
          'ids': 'ga:58919562',
          'start-date': Date.yesterday().toYMD("-"),
          'end-date': Date.today().toYMD("-"),
          'dimensions': dimensions.join(','),
          'metrics': metrics.join(','),
          'sort': 'ga:date'
        }
      else
        console.log err
        return

      gac.get(options, (err, entries) ->
        if !err
          msg.send "holderdeord.no got #{entries[0].metrics[0][metric]} #{metric} yesterday and #{entries[1].metrics[0][metric]} today."
        else
          console.log err
      )