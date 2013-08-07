# Description:
#   Welcomes user into the room
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   Ceri Richmond

module.exports = (robot) ->
  greetings = [
    "Ahoy",
    "G'day",
    "Greetings",
    "Hello",
    "Hello there",
    "Hey",
    "Hi",
    "Hi there",
    "How are you",
    "How you doing",
    "How's it going",
    "Howdy",
    "Salutations",
    "Welcome",
    "What's up",
    "Yo",
    "Sup",
    "How art thou"
  ]
  robot.enter (msg) ->
    user = msg.message.user.name.toLowerCase()
    if user != 'hubot'
      msg.send "#{msg.random(greetings)} #{msg.message.user.name}"
