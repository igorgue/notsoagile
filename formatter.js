// Generated by CoffeeScript 1.3.3
(function() {
  var format;

  format = function(content, parsed_data, callback) {
    var error_message, mention, new_link, status, tag, _i, _j, _k, _len, _len1, _len2, _ref, _ref1, _ref2;
    error_message = null;
    if (!content) {
      error_message = 'we need the original content';
    }
    if (!parsed_data) {
      error_message = 'we need parsed data';
    }
    if (error_message) {
      callback(error_message, null);
      return error_message;
    }
    if (parsed_data.tags) {
      _ref = parsed_data.tags;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        tag = _ref[_i];
        new_link = "<a title=\"" + tag + "\" href=\"/" + tag + "\">" + tag + "</a>";
        content = content.replace(tag, new_link, 'g');
      }
    }
    if (parsed_data.mentions) {
      _ref1 = parsed_data.mentions;
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        mention = _ref1[_j];
        new_link = "<a title=\"" + mention + "\" href=\"/" + mention + "\">" + mention + "</a>";
        content = content.replace(tag, new_link, 'g');
      }
    }
    if (parsed_data.statuses) {
      _ref2 = parsed_data.statuses;
      for (_k = 0, _len2 = _ref2.length; _k < _len2; _k++) {
        status = _ref2[_k];
        new_link = "<a title=\"" + status + "\" href=\"/" + status + "\">" + status + "</a>";
        content = content.replace(tag, new_link, 'g');
      }
    }
    callback(null, content);
    return content;
  };

  module.exports = {
    format: format
  };

}).call(this);
