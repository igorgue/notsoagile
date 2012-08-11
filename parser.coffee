parse = (content, callback) ->
  if not content
    error_message = 'nothing to parse'
    callback(error_message, null)

    return error_message

  tags_regex = /(#[a-zA-Z0-9_-]+)/g
  mentions_regex = /(@[a-zA-Z0-9_-]+)/g
  status_regex = /(status:[a-zA-Z0-9_-]+)/g

  tags = content.match(tags_regex) or []
  mentions = content.match(mentions_regex) or []
  statuses = content.match(status_regex) or []

  # Remove '#' from tag
  tags = for tag in tags
    tag.slice(1, tag.length)

  # Remove '@' from mentions 
  mentions = for mention in mentions
    mention.slice(1, mention.length)

  # Remove 'status:' from statuses
  statuses = for status in statuses
    status.slice(7, status.length)

  data =
    tags: tags
    mentions: mentions
    statuses: statuses

  callback(null, data) if callback

  return data

module.exports =
  parse: parse
