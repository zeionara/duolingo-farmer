# About
A simple script for farming xp and skill trees on duolingo.
# Usage
1. Add to your environment an environment variable called `DUOLINGO_TOKEN` which should keep your authentication token:
```sh
export DUOLINGO_TOKEN=some-token-here
```

## Farming xp  

2. Run the `farm.sh` script which takes as an argument an amount of xp you want to farm (the quantity should divide by 18 without a remainder, the default value is 180).
```sh
./farm.sh 36
```

## Farming courses

2. If there is not suitable query for your course, then manually execute `skill-test` exercise on the web-site, catch body of the query and put it in a file, leaving references for further particular values insertion as in the provided examples for `spanish` and `klingon` courses (learned from english).

3. Obtain `skill-tree-id` and a list of `skill-ids` and put them into the respective fields in the `level-up.sh` script. Ids of trees for `spanish` and `klingon` courses (learned from english) are provided in the script as examples.

4. Run the `level-up.sh` script which takes no arguments and will emulate skill-tree completion.
```sh
./level-up.sh
```
