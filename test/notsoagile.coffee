test_parser = require './test_parser'
test_formatter = require './test_formatter'

tests = []

for test in test_parser.tests
  tests.push test

for test in test_formatter.tests
  tests.push test

for test in tests
  test()
