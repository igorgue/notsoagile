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
  for tag in parsed_data.tags
    new_link = """<a title="#{tag}" href="/#{tag}">#{tag}</a>"""
    content.replace tag, new_link, 'g'

  # Mentions
  for mention in parsed_data.mentions
    new_link = """<a title="#{mention}" href="/#{mention}">#{mention}</a>"""
    content.replace tag, new_link, 'g'

  # Mentions
  for status in parsed_data.statuses
    new_link = """<a title="#{status}" href="/#{status}">#{status}</a>"""
    content.replace tag, new_link, 'g'

  callbackx null, content

  return content
