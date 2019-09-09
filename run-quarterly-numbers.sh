# This script grabs totals for contributors for the OrbitDB organization for a three month period.
# It needes to be edited, but keeping this here for next time should save some life.
# This could easily be extended elsewhere.

npm i -g name-your-contributors
# You will also need to have [`jq`](https://stedolan.github.io/jq/download/) installed.
brew install jq

# Fix these to match the current month
# TODO Automate monthly so you don't need to do 'before' and 'after'
name-your-contributors -o orbitdb -a 2019-05-31 -b 2019-07-01 --commits > orbitdb-june-contribs.json
name-your-contributors -o orbitdb -a 2019-06-31 -b 2019-08-01 --commits > orbitdb-june-contribs.json
name-your-contributors -o orbitdb -a 2019-07-31 -b 2019-09-01 --commits > orbitdb-june-contribs.json

# Change these to match the output above
cat orbitdb-june-contribs.json | jq '[ .[][].count]' | jq 'add | "There were \(.) contributions (including commits, comments and PRs) in June."'
cat orbitdb-july-contribs.json | jq '[ .[][].count]' | jq 'add | "There were \(.) contributions (including commits, comments and PRs) in July."'
cat orbitdb-aug-contribs.json | jq '[ .[][].count]' | jq 'add | "There were \(.) contributions (including commits, comments and PRs) in August."'

# These will just print out the unique numbers.
# Change these to match the output above.
cat orbitdb-june-contribs.json | jq '[ .[][].login]' | jq unique | jq -r .[] | wc -l | awk '{print "There were "$1" contributors in June."}'
cat orbitdb-july-contribs.json | jq '[ .[][].login]' | jq unique | jq -r .[] | wc -l | awk '{print "There were "$1" contributors in July."}'
cat orbitdb-aug-contribs.json | jq '[ .[][].login]' | jq unique | jq -r .[] | wc -l | awk '{print "There were "$1" contributors in August."}'