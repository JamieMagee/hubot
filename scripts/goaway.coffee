# Description:
#   Make the bot leave the channel for a while
#
# Dependencies:
#   hubot-irc
#
# Commands:
#   hubot go away - Make the bot leave this room
#
# Author:
#   jamie

module.exports = (robot) ->
  robot.respond /go away/i, (msg) ->
    room = msg.message.user.room
    msg.reply "OK. I'll come back in a minute."
    setTimeout (->
      robot.adapter.bot.join room
    ), 60000
    robot.adapter.bot.part room
