# Description:
#   receive a high five!
#

odule.exports = (robot) ->
  robot.respond /\\o/i, (msg) ->
    msg.send "o/ high five!"
    
  robot.respond /o\//i, (msg) ->
    msg.send "\\o high five!"  
