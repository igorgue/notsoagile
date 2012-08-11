test_parser = require('./test_parser')

tests = test_parser.tests

for test in tests
  test()
