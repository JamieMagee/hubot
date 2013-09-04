# Description:
#   receive a high five!
#

module.exports = (robot) ->
  robot.hear /( )+\\o/i, (msg) ->
    msg.send "o/ high five!"
    
  robot.hear /( )+o\//i, (msg) ->
    msg.send "\\o high five!"  
