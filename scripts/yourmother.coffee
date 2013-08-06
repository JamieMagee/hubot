# Description:
#   Makes your mother jokes
#
# Dependencies:
#   None
#
# Configuration:
#   None
module.exports = (robot) ->
  robot.hear /(is|it's) (.*)$/i, (msg) ->
    user = msg.message.user.name.toLowerCase()
    if user == 'rwge'
      msg.reply "no"
    else
      msg.send "your mother is #{msg.match[2]}"
