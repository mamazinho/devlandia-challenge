#### This is a project that solves the devlandia challenge

You can access challenge details [here](https://www.hackerrank.com/challenges/saveprincess2/problem).


## Questions

***Why Ruby?***
* To satisfied the challenge requirements.

***Why you don't use classes?***
* I am starting my studies in ruby and that's why I did't use classes.

***Why don't up this to a sever?***
* This is a simple script to solve a pontual challenge, so this is unnecessary.

## How to install Ruby:
    $ sudo apt install ruby-full

## How to install rspec:
    $ sudo gem install rspec

## How to Run:
    $ ruby main.rb

## How to Run Test:
    $ rspec specs/

## Use case:

    First input it's the max rows that your matrix will have, example:
    $ Number of rows in your matrix: 3

    Second input it's the max columns that your matrix will have, example:
    $ Number of columns in your matrix: 3

    Third input it's the line that you want to appear to start the game, 0 (zero) doesn't count, example:
    $ What will be your starting line? (PS: The count starts in 1)     2

    Fourth input it's the column that you want to appear to start the game, 0 (zero) doesn't count, example:
    $ What will be your starting column? (PS: The count starts in 1)     2

    This will be generate a table like this:
                    ---
                    -m-
                    --p

    The 'm' value represents you and 'p' represents the princess (randomly generated) 