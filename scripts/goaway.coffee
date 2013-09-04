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
bots = [
  "bowser",
  "clvr",
  "curve",
  "daisy",
  "diddykong",
  "drybones",
  "guppy",
  "hugbot",
  "kingboo",
  "matio",
  "planes",
  "route",
  "swearbot",
  "trains",
  "wario",
  "wolfram"  
  ]
  
module.exports = (robot) ->
  robot.respond /go away/i, (msg) ->
    user = msg.message.user.name.toLowerCase()
    if user not in bots
      room = msg.message.user.room
      msg.reply "OK. I'll come back in a minute."
      setTimeout (->
        robot.adapter.bot.join room
      ), 60000
      robot.adapter.bot.part room
    else
      msg.reply "No"
