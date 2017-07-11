# Hangman

## Features of Hangman Program
------------
This Hangman game is a Command Line Interface program. It features a menu and tracks game and user history.
It get's its words from Wordnik's API.
It has different difficulty levels.
If you loose it gives you the definition of the word.
It saves all progress if you exit the program and loads it every time

## How to Use Hangman Program
------------
* Install ruby and download Hangman. Navigate to the hangman-project directory and type bin/run in terminal.

* A menu pops up with options to start a new game, view player game history, view the leaderboard, and exit the program. There is also an option to change player.

* Once the user completes a game, there is a prompt to return to menu. There, he again has his choice of menu options, including the option to change player, which allows the program to track a different user.

* The program tracks and remembers the game and user data until the option to exit the program is executed, at which point the data is lost.

## Technical Structure of Hangman Program
------------
The Hangman program currently contains a Menu class, a User class, and a Game class. The menu is the outer loop of the program; that loop ends when a user selects the option to exit the program. The "New Game" option in the menu starts the inner loop, which is a single game of Hangman. That loop ends when the game is finished and the user hits Enter.

## How to Contribute to the Program
-----------
* To contribute to the program simply do a fork and send a pull request

## Authors
-----------
* Luis Arita luisarita@gmail.com
* Yakov Kiffel yakov.kiffel@gmail.com
