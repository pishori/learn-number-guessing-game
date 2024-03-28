#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read NAME_ENTERED

USERNAME=$($PSQL "SELECT username FROM users WHERE username='$NAME_ENTERED'")
if [[ -z $USERNAME ]]
then
  echo "Welcome, $NAME_ENTERED! It looks like this is your first time here."
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES ('$NAME_ENTERED')")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM users INNER JOIN games USING(user_id) WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(number_guesses) FROM users INNER JOIN games USING(user_id) WHERE username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$NAME_ENTERED'")

RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))
#echo $RANDOM_NUMBER
echo "Guess the secret number between 1 and 1000:"
GUESSES=1
 
while read NUMBER_GUESSED
do
  if [[ ! $NUMBER_GUESSED =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else 
    if [[ $NUMBER_GUESSED -eq $RANDOM_NUMBER ]]
    then
      break
    else
      if [[ $NUMBER_GUESSED -lt $RANDOM_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
      elif [[ $NUMBER_GUESSED -gt $RANDOM_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
      fi
    fi
  fi
GUESSES=$(( $GUESSES + 1 ))
done

INSERT_NUMBER_GUESSES=$($PSQL "INSERT INTO games(number_guesses, user_id) VALUES($GUESSES, $USER_ID)")

echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"