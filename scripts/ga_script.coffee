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
  robot.respond /besøk/i, (msg) ->
    config = {
      "user": process.env.ANALYTICS_USER,
      "password": process.env.ANALYTICS_PASSWORD
    }

    dimensions = ['ga:date']
    metrics = ['ga:visits']
    gac = new ga.GA(config)

    url = "http://beta.holderdeord.no"
    start_date = Date.yesterday().toYMD("-")
    end_date = Date.today().toYMD("-")

    gac.login (err, token) ->
      if !err
        options = {
          'ids': 'ga:58919562',
          'start-date': start_date,
          'end-date': end_date,
          'dimensions': dimensions.join(','),
          'metrics': metrics.join(','),
          'sort': 'ga:date'
        }
      else
        console.log err

      gac.get(options, (err, entries) ->
        if !err
          msg.send "holderdeord.no fikk #{entries[0].metrics[0]['ga:visits']} besøk i går og #{entries[1].metrics[0]['ga:visits']} i dag."
        else
          console.log err
      )