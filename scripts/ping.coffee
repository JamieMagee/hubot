# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot ping - Reply with pong
#   hubot echo <text> - Reply back with <text>
#   hubot time - Reply with current time

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
  robot.respond /PING$/i, (msg) ->
    msg.send "PONG"

  robot.respond /ECHO (.*)$/i, (msg) ->
    msg.send msg.match[1]

  robot.respond /TIME$/i, (msg) ->
    msg.send "Server time is: #{new Date()}"

  robot.respond /DIE$/i, (msg) ->
    user = msg.message.user.name.toLowerCase()
    if user not in bots
      msg.send "Goodbye, cruel world."
      process.exit 0
    else
      msg.reply "No"  
    
  robot.respond /please.*reboot.*/i, (msg) ->
    user = msg.message.user.name.toLowerCase()
    if user not in bots
      msg.reply "Why certainly, it would be my pleasure. Back in a jiffy, everyone!"
      robot.shutdown()
      process.exit 0
    else
      msg.reply "No"

