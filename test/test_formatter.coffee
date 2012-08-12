assert = require 'assert'
formatter = require '../formatter'
parser = require '../parser'

# Test formats a tag (should work for everything else)
test_formats_a_tag = () ->
  content = 'This is some content #winning'
  formatter.format content, parser.parse(content), (err, data) ->
    throw new Error "There was an error trying to parse data: #{err}" if err

    assert.equal data, 'This is some content <a title="#winning" href="/#winning">#winning</a>'

test_formats_combined_stuff = () ->
  content = 'Please fix the site @igor #broken-site'
  formatter.format content, parser.parse(content), (err, data) ->
    throw new Error "There was an error trying to parse data: #{err}" if err

    assert.equal data, 'Please fix the site <a title="@igor" href="/@igor">@igor</a> <a title="#broken-site" href="/#broken-site">#broken-site</a>'
    
module.exports =
  tests: [
    test_formats_a_tag
    test_formats_combined_stuff
  ]
