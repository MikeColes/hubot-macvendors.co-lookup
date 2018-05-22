# Description
#   This hubot script pulls information about the MAC address from macvendors.co
#
# Configuration:
#   No env vars need set
#
# Commands:
#   hubot mac BA:BE:CA:B7:3E:41 - <what the respond trigger does>
#   orly - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   Mike Coles <mike@mikecoles.us>
#
# Todo:
#   Parse out extra info returned
#   http://theprogrammingbutler.com/blog/archives/2011/10/28/hubot-scripts-explained/ ← reminder to me

module.exports = (robot) ->
  robot.respond /mac (.*)/i, (msg) ->
    mac = escape(msg.match[1])
    msg.http("http://macvendors.co/api/#{mac}")
    .get() (err,res,body) ->
      try
        json=JSON.parse(body)
        msg.reply "Vendor - #{json.result.company}"
      catch error
        msg.reply "An Error occured."

  #robot.hear /orly/, (res) ->
  #  res.send "yarly"
