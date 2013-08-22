# Description:
#   Tells channel users about hubot
#

module.exports = (robot) ->
  robot.respond /who are you\??/i, (msg) ->
    msg.send "https://github.com/JamieMagee/hubot"

  robot.hear /(who is|who's) hubot/i, (msg) ->
    msg.send "https://github.com/JamieMagee/hubot"

  robot.hear /(hack.*hubot|hubot.*script|script.*hubot)/i, (msg) ->
    msg.reply "https://github.com/JamieMagee/hubot"
