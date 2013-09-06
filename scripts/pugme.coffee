# Description:
#   Pugme is the most important thing in your life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot pug me - Receive a pug

module.exports = (robot) ->

  robot.respond /pug (.*)/i, (msg) ->
    msg.http("http://pugme.herokuapp.com/random")
      .get() (err, res, body) ->
        user = msg.message.user.name.toLowerCase()
        if msg.match[1].toLowerCase() in ['me', 'myself']
          msg.send user + ": " + JSON.parse(body).pug
        else if msg.match[1].toLowerCase() in ['you', 'yourself']
          msg.send "hubot:" + JSON.parse(body).pug
        else
          msg.send "#{msg.match[1]}: " + JSON.parse(body).pug
        
  robot.respond /pug bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    msg.http("http://pugme.herokuapp.com/bomb?count=" + count)
      .get() (err, res, body) ->
        user = msg.message.user.name
        robot.adapter.command 'PRIVMSG', user, pug for pug in JSON.parse(body).pugs

  robot.respond /how many pugs are there/i, (msg) ->
    msg.http("http://pugme.herokuapp.com/count")
      .get() (err, res, body) ->
        msg.send "There are #{JSON.parse(body).pug_count} pugs."

