#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# create secret number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# initialize guess_count variable
GUESS_COUNT=0

# prompt user for username
echo "Enter your username:"
read USERNAME

# check if username has been entered before
GET_USERNAME_RESULT=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME';")
USERNAME_ID=$($PSQL "SELECT username_id FROM users WHERE username = '$USERNAME';")

# if username has not been used before
if [[ -z $GET_USERNAME_RESULT ]]
  then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # insert username into database
  INSERT_NEW_USERNAME=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  else
  # if username has been used before
  # get games_played data
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE username_id = '$USERNAME_ID';")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE username_id = '$USERNAME_ID';")
  echo "Welcome back, $GET_USERNAME_RESULT! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# prompt user for secret number guess
echo -e "\nGuess the secret number between 1 and 1000:"
read USER_GUESS

until [[ $USER_GUESS == $SECRET_NUMBER ]]
do
  # check to see if guess is a number
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then
    echo -e "\nThat is not an integer, guess again:"
    read USER_GUESS
    # update guess_count
    ((GUESS_COUNT++))
    else
      # check if guess is less than secret number
      if [[ $USER_GUESS < $SECRET_NUMBER ]]
        then
        echo -e "\nIt's higher than that, guess again:"
        read USER_GUESS
        ((GUESS_COUNT++))
        else
          # check if guess is greater than secret number
          if [[ $USER_GUESS > $SECRET_NUMBER ]]
            then
            echo -e "\nIt's lower than that, guess again:"
            read USER_GUESS
            ((GUESS_COUNT++))
          fi
      fi
  fi
done

# update guess count once answer is correct and out of until loop
((GUESS_COUNT++))

# send user winning message
echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

# get username_id
USERNAME_ID=$($PSQL "SELECT username_id FROM users WHERE username = '$USERNAME';")

# input game data into database
INSERT_GAME_DATA=$($PSQL "INSERT INTO games(username_id, secret_number, number_of_guesses) VALUES($USERNAME_ID, $SECRET_NUMBER, $GUESS_COUNT);")
