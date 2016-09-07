#!/bin/bash

exit_code=0

echo "*** Running Predictor specs"
bundle exec rspec spec
exit_code+=$?

exit $exit_code
