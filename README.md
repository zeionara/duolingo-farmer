# About
A simple script for farming xp on duolingo.
# Usage
1. Add to your environment an environment variable called `DUOLINGO_TOKEN` which should keep your authentication token:
```sh
export DUOLINGO_TOKEN=some-token-here
```
2. Run the `farm.sh` script which takes as an argument an amount of xp you want to farm (the quantity should divide by 18 without a remainder, the default value is 180).
```sh
./farm.sh 36
```
