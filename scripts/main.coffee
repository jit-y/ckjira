module.exports = (robot) ->
  robot.router.post '/comments', (req, res) ->
    body = req.body
    action = switch body.webhookEvent
             when 'comment_created'
               'Comment Created'
             when 'comment_updated'
               'Comment Updated'
             when 'comment_deleted'
               'Comment Deleted'
             when 'comment_deleted'
               'Unknown Action'
    robot.send {room: process.env.HUBOT_SLACK_ROOM}, "[#{req.query.issue}] #{action} by #{req.query.user_key} \n URL: #{process.env.HUBOT_JIRA_URL}/browse/#{req.query.issue} \n\n>>>#{body.comment.body}"
