# This script grabs totals for contributors for the OrbitDB organization for a three month period.
# It needes to be edited, but keeping this here for next time should save some life.
# This could easily be extended elsewhere.

# npm i -g name-your-contributors
# You will also need to have [`jq`](https://stedolan.github.io/jq/download/) installed.
# brew install jq

# Fix these to match the current month
# TODO Automate monthly so you don't need to do 'before' and 'after'
# GITHUB_TOKEN=1ffa490b775ba233e8b46b111d57a9ebd82fbbfe name-your-contributors -o orbitdb -m June --commits > orbitdb-june-contribs.json
# Fix these to match the current month
name-your-contributors -o orbitdb -m October --commits > orbitdb-oct-contribs.json
name-your-contributors -o orbitdb -m November --commits > orbitdb-nov-contribs.json
name-your-contributors -o orbitdb -m December --commits > orbitdb-dec-contribs.json
# Change these to match the output above
cat orbitdb-oct-contribs.json | jq '[ .[][].count]' | jq 'add | "There were \(.) contributions (including commits, comments and PRs) in October."'
cat orbitdb-nov-contribs.json | jq '[ .[][].count]' | jq 'add | "There were \(.) contributions (including commits, comments and PRs) in November."'
cat orbitdb-dec-contribs.json | jq '[ .[][].count]' | jq 'add | "There were \(.) contributions (including commits, comments and PRs) in December."'
# These will just print out the unique numbers.
# Change these to match the output above.
cat orbitdb-oct-contribs.json | jq '[ .[][].login]' | jq unique | jq -r .[] | wc -l | awk '{print "There were "$1" contributors in October."}'
cat orbitdb-nov-contribs.json | jq '[ .[][].login]' | jq unique | jq -r .[] | wc -l | awk '{print "There were "$1" contributors in November."}'
cat orbitdb-dec-contribs.json | jq '[ .[][].login]' | jq unique | jq -r .[] | wc -l | awk '{print "There were "$1" contributors in December."}'