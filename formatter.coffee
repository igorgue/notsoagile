# Get the link formatted
format = (content, parsed_data, callback) ->
  error_message = null

  if not content
    error_message = 'we need the original content'

  if not parsed_data
    error_message = 'we need parsed data'

  if error_message
    callback error_message, null

    return error_message

  # Tags
  if parsed_data.tags
    for tag in parsed_data.tags
      new_link = """<a title="#{tag}" href="/#{tag}">#{tag}</a>"""
      content = content.replace tag, new_link

  # Mentions
  if parsed_data.mentions
    for mention in parsed_data.mentions
      new_link = """<a title="#{mention}" href="/#{mention}">#{mention}</a>"""
      content = content.replace mention, new_link

  # Statuses
  if parsed_data.statuses
    for status in parsed_data.statuses
      new_link = """<a title="#{status}" href="/#{status}">#{status}</a>"""
      content = content.replace status, new_link

  callback null, content

  return content

if window?
  window.notsoagile = {} unless window.notsoagile?
  window.notsoagile.format = format

if module?
  module.exports =
    format: format
