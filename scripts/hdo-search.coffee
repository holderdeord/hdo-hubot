# Description:
#   None
#
# Configuration:
#   None
#
# Commands:
#   Søk hos holder de ord
#
# Author:
#   jarib

module.exports = (robot) ->
  robot.respond /hdo (.*)/i, (msg) ->
    msg.http("http://www.holderdeord.no/search/autocomplete.json")
      .query({
        query: msg.match[1]
      })
      .get() (err, res, body) ->
        if (err)
          console.log res.statusCode, body
          return

        response = JSON.parse(body)

        if response.issue
          response.issue.forEach (issue) ->
              msg.send "#{issue.title}: #{issue.url}"

        if response.representative
          response.representative.forEach (rep) ->
              msg.send "#{rep.full_name} (#{rep.party_name}): #{rep.url}"







