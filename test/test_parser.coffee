assert = require 'assert'
parser = require '../parser'

# Tests that we are parsing a tag
test_parse_tags = () ->
  test_content = 'Fix #problem with scrolls #frontend #design'
  parser.parse test_content, (err, data) ->
    throw new Error "Error parsing tags: #{err}" if err

    assert.equal data.tags.length, 3

    for tag, index in ['#problem', '#frontend', '#design']
      assert.equal data.tags[index], tag

  return

# Tests that we're getting the mentions
test_parse_metions = () ->
  test_content = 'Fix parsing bugs now bitch @igorgue'
  parser.parse test_content, (err, data) ->
    throw new Error "Error parsing mentions: #{err}" if err

    assert.equal data.mentions.length, 1
    assert.equal data.mentions[0], '@igorgue'

  return

# Test that we get the statuses
test_parse_status = () ->
  test_content = 'Fix critical bugs before release status:started'
  parser.parse test_content, (err, data) ->
    throw new Error "Error parsing mentions: #{err}" if err

    assert.equal data.statuses.length, 1
    assert.equal data.statuses[0], 'status:started'

# Test empty content is an error
test_parse_empty_content = () ->
  test_content = ''

  assert.throws () ->
    parser.parse test_content, (err, data) ->
      throw new Error err if err
    Error

# Test all the cases combined
test_all_cases = () ->
  test_content = """Ok this is gonna be a #big-task @igorgue has to do
  a lot of this to make this release happen this weekend. He might need
  help from @_why. #release status:open
  """
  parser.parse test_content, (err, data) ->
    throw new Error "Error parsing he combination: #{err}" if err

    assert.equal data.tags.length, 2
    assert.equal data.mentions.length, 2
    assert.equal data.statuses.length, 1

    for tag, index in ['#big-task', '#release']
      assert.equal data.tags[index], tag

    for mention, index in ['@igorgue', '@_why']
      assert.equal data.mentions[index], mention

    for status, index in ['status:open']
      assert.equal data.statuses[index], status

module.exports =
  tests: [
    test_parse_tags,
    test_parse_metions,
    test_parse_empty_content,
    test_all_cases
  ]
