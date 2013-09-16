# Description:
#   Get curvefever player statistics
#
# Dependencies:
#   cheerio
#
# Commands:
#   hubot curve stats
#
# Author:
#   JamieMagee

players = [
  'jammie',
  'ealbrigt',
  'tjw',
  'aatukora',
  'irp',
  'jose-panda',
  'andyj',
  'obone',
  'usmate',
  'lutomlin',
  'jobrandh'  
  ]

cheerio = require 'cheerio'
async = require 'async'

module.exports = (robot) ->
  robot.respond /curve stat(istic)?s/i, (msg) ->
    results = []
    fns = players.map (player) ->
      (cb) ->
        msg.http("http://curvefever.com/users/" + player).get() (err, res, body) ->
          $ = cheerio.load(body)
          results.push
            name: $("h1").slice(0).eq(0).text().toLowerCase()
            rank: parseInt($("dd").slice(1).eq(0).text(), 10)
          cb()
    async.parallel fns, ->
      results.sort (x,y) -> y.rank - x.rank
      for player in results
        msg.send player.name + " " + player.rank

  robot.respond /curve teams (.*)*/i, (msg) ->
    teamplayer = "#{msg.match[1]}".split " "
#    results = []
#    fns = players.map (player) ->
#      (cb) ->
#        msg.http("http://curvefever.com/users/" + player).get() (err, res, body) ->
#          $ = cheerio.load(body)
#          results.push
#            name: $("h1").slice(0).eq(0).text().toLowerCase()
#            rank: parseInt($("dd").slice(1).eq(0).text(), 10)
#          cb()
#    async.parallel fns, ->
    shuffle(teamplayer)
    msg.send "Red Team"
    for i in [0..(Math.floor((teamplayer.length)/2)-1)]
      msg.send teamplayer[i]
    msg.send "Blue Team"
    for i in [Math.floor((teamplayer.length)/2)..(teamplayer.length-1)]
      msg.send teamplayer[i]
      
    
shuffle = (a) ->
  for i in [a.length-1..1]
    j = Math.floor Math.random() * (i + 1)
    [a[i], a[j]] = [a[j], a[i]]
  a

