# Description: 
#   Change Hubot's nick on IRC
#
# Commands:
#   hubot nick <nick>
#
# Author:
#   JamieMagee

module.exports = (robot) ->
  robot.respond /nick (.*)/i, (msg) ->
    robot.adapter.command 'NICK', msg.match[1]
