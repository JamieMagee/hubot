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
  robot.respond /hug (.*)$/i, (msg) ->
    msg.send "*hugs #{msg.match[1]}*"
