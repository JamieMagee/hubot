# Description:
#   Hubot delivers a compliment
#


compliments = [
  'Your prom date still thinks about you all the time.',
  'All your friends worry they aren\u2019t as funny as you.',
  'Your boss loved that thing you did at work today.',
  'Your blog is the best blog.',
  'People at trivia night are terrified of you.',
  'Those shoes were a great call.',
  'Hey, did you lose weight? (not that you needed to!)',
  'You are the most charming person in a 50 mile vicinity.',
  'Everyone was super jealous of your SAT score.',
  'Mensa would be so lucky.',
  'All the 6th graders agreed, your baking soda volcano was the best at the science fair.',
  'I would totally trust you to dog-sit for a long weekend.',
  '9/10 dentists agree, you are the BEST.',
  'Your voice sounds like a thousand cats purring. Also, I\u2019tm on acid.',
  'Today\u2019s outfit = Thumbs up.',
  'Every other country is super jealous you\u2019re a citizen in this country.',
  'Your hair looks great today. It also looked really good two days ago.',
  'I want to kiss you. I hope that\u2019s not too forward of me.',
  'That song was definitely written for you.',
  'You\u2019re not crazy, they are 100% into you.',
  'Your parents are more proud of you than you\u2019tll ever know.',
  'Rumour is Disney is basing its next cartoon on you.',
  'You actually looked super graceful that time you tripped in front of everyone.',
  'Your sneezes sound like a chorus of angels giggling.',
  'You don\u2019t get drunk, you get superhuman.',
  'You could be an astronaut if you wanted. NASA told me so.',
  'I\u2019tm not telling you what to do, but you could pull off orange corduroy.',
  'Your hair smells like freshly cut grass.',
  'Your pet loves you too much to ever run away.',
  'No one has ever thought your feet look gross.',
  'They\u2019ve never told you this, but your boss is really impressed by you.',
  'Your cousins refer to you as the cool cousin.',
  'The kid you passed on the street today wants to grow up to be like you.',
  'Your dental hygiene is impeccable.',
  'You\u2019re as sweet as a can of artificially flavoured diet soda.',
  'You pick the best radio stations when you\u2019re riding shotgun.',
  'You think of the funniest names for Wi-Fi connections.',
  'Keep walking around naked. Your neighbours are into it.',
  'You have the power to start and WIN a dance-off.',
  'You\u2019ve never had morning breath. I swear.',
  'Your senior portrait was the best.',
  '8 out of 10 co-workers agree, your desk is the cleanest.',
  'You\u2019d be the last one standing in a horror movie.',
  'You\u2019re a benevolent tipper.',
  'You\u2019re the best at making cereal.',
  'Your parents aren\u2019t worried about you.',
  'You\u2019re funny. Like LOL style.'
]

module.exports = (robot) ->
  robot.hear /compliment (.*)/i, (msg) ->
    name = msg.match[1].trim()
    rnd = Math.floor(Math.random()*compliments.length)
    msg.send "#{name}: #{compliments[rnd]}"
