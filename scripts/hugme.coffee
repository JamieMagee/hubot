# Description:
#   Hugme is the most important thing in your life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot hug me - Receive a hug

module.exports = (robot) ->
  robot.respond /^hug (.*)$/i, (msg) ->
    user = msg.message.user.name.toLowerCase()
    if msg.match[1].toLowerCase() in ['me', 'myself']
      msg.send "*hugs #{user}*"
    else if msg.match[1].toLowerCase() in ['you', 'yourself']
      msg.send "*hugs hubot*"
    else
      msg.send "*hugs #{msg.match[1]}*"
