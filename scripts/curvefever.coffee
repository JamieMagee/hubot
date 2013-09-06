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
  'Ealbrigt',
  'tjw',
  'Aatukora',
  'Irp',
  'Jose-panda',
  'Andyj',
  'obone',
  'usmate',
  'Lutomlin',
  'jobrandh'  
  ]

cheerio = require 'cheerio'
async = require 'async'

module.exports = (robot) ->
  robot.respond /curve stat(istic)?s/i, (msg) ->
    results = []
    fns = players.map (player) ->
      (cb) ->
        msg.http("http://pwa.wp3.pl/curvefever/?player=" + player).get() (err, res, body) ->
#          if (err) return cb(err);
          $ = cheerio.load(body)
          results.push
            name: $("b").slice(0).eq(0).text().toLowerCase()
            rank: parseInt($("td").slice(37).eq(0).text(), 10)
          cb()
    async.parallel fns, ->
#    if (err) msg.send(err);
      results.sort (x,y) -> y.rank - x.rank
      for player in results
        msg.send player.name + " " + player.rank
