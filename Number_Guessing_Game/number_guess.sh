#!/bin/bash

# Number Guessing Game

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUM_OF_GUESSES=0

# get user info
  echo "Enter your username:"
  read USERNAME

  GET_USERNAME=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")

  # if user doesn't exist
  if [[ -z $GET_USERNAME ]]
  then
    # insert new user
    INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")

    # give welcome message
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    # if user is found

    # get user_id
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

    # get games_played
    GAMES_PLAYED=$($PSQL "SELECT count(*) as number_of_games FROM games WHERE user_id=$USER_ID")

    # get best game
    BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) as MIN FROM games WHERE user_id=$USER_ID")

    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

  fi

  # get user_id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

  # generate random number between 1 and 1000
  SECRET_NUMBER=$[ $RANDOM % 1000 + 1 ]

 #echo -e "\nRN: $SECRET_NUMBER"

  echo "Guess the secret number between 1 and 1000:"
  read GUESS

let "NUM_OF_GUESSES++"
#echo "NumbGuess: $NUM_OF_GUESSES"

while [[ $GUESS != $SECRET_NUMBER ]]
do
 if [[ $GUESS =~ ^[0-9]+$ ]]
 then
  if [[ $GUESS > $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    read GUESS
    # inscrement number of guesses
    let "NUM_OF_GUESSES++"
  else
    if [[ $GUESS < $SECRET_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
        read GUESS
        # inscrement number of guesses
        let "NUM_OF_GUESSES++"
      fi
  fi
else
  echo "That is not an integer, guess again:"
  read GUESS
  # inscrement number of guesses
  let "NUM_OF_GUESSES++"
fi
done

# insert in games table
INSERT_GAME_INFO=$($PSQL "INSERT INTO games(user_id,number_of_guesses) VALUES($USER_ID,$NUM_OF_GUESSES)")
echo "You guessed it in $NUM_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"