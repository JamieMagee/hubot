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
            name: $("h1").slice(0).eq(0).text()
            rank: parseInt($("dd").slice(1).eq(0).text(), 10)
          cb()
    async.parallel fns, ->
      results.sort (x,y) -> y.rank - x.rank
      for player in results
        msg.send player.name + " " + player.rank
