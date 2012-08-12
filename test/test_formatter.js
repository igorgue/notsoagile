// Generated by CoffeeScript 1.3.3
(function() {
  var assert, formatter, parser, test_formats_a_tag, test_formats_combined_stuff;

  assert = require('assert');

  formatter = require('../formatter');

  parser = require('../parser');

  test_formats_a_tag = function() {
    var content;
    content = 'This is some content #winning';
    return formatter.format(content, parser.parse(content), function(err, data) {
      if (err) {
        throw new Error("There was an error trying to parse data: " + err);
      }
      return assert.equal(data, 'This is some content <a title="#winning" href="/#winning">#winning</a>');
    });
  };

  test_formats_combined_stuff = function() {
    var content;
    content = 'Please fix the site @igor #broken-site';
    return formatter.format(content, parser.parse(content), function(err, data) {
      if (err) {
        throw new Error("There was an error trying to parse data: " + err);
      }
      return assert.equal(data, 'Please fix the site <a title="@igor" href="/@igor">@igor</a> <a title="#broken-site" href="/#broken-site">#broken-site</a>');
    });
  };

  module.exports = {
    tests: [test_formats_a_tag, test_formats_combined_stuff]
  };

}).call(this);
