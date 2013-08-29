# Description:
#   None
#
# Author:
#   jarib

cheerio = require('cheerio')

module.exports = (robot) ->
  robot.hear /(https?:\/\/.*stortinget\.no\/\S+)/i, (msg) ->
    url = msg.match[1]
    console.log(url)

    msg.http(url)
      .get() (err, res, body) ->
          $ = cheerio.load(body)
          title = $('meta[name="DC.Title"]').attr('content')
          desc = $('meta[name="DC.Description"]').attr('content')

          msg.reply(title + ': ' + desc)
