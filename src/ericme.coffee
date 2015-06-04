# Description:
#   Eric dispalys emotions is the most important thing in life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot eric me - Receive an eric picture
#   hubot eric bomb N - get N pugs

module.exports = (robot) ->
  

  robot.respond /pug me/i, (msg) ->
    msg.http("http://pugme.herokuapp.com/random")
      .get() (err, res, body) ->
        msg.send JSON.parse(body).pug

  robot.respond /pug bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    msg.http("http://pugme.herokuapp.com/bomb?count=" + count)
      .get() (err, res, body) ->
        msg.send pug for pug in JSON.parse(body).pugs

