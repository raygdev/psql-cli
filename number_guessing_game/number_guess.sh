#!/bin/bash
PSQL="psql -U freecodecamp -d number_guess -t -c"
SECRET_NUM=$(( $RANDOM%1000 + 1 ))


echo "Enter your username:"
read USERNAME

USER=$( $PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME'" )

if [[ -z $USER ]]
  then
  INSERTED_USER=$( $PSQL "INSERT INTO users(username) values('$USERNAME')" )
  
  echo "Welcome, $USERNAME! It looks like this is your first time here."

else
  
  echo $USER | while read USERSNAME BAR GAMES_PLAYED BAR BEST_GAME
  do
    echo "Welcome back, $USERSNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

echo -e "\nGuess the secret number between 1 and 1000:"

NUM=''
NUM_GUESSES=0

while [[ $NUM != $SECRET_NUM ]]
do
read GUESS
  if [[ ! $GUESS =~ ^([0-9])+$ ]]
    then
      echo 'That is not an integer, guess again:'
  elif [[ $GUESS -gt $SECRET_NUM ]]
    then
    NUM=$GUESS
    ((NUM_GUESSES++))
    echo "It's lower than that, guess again:"
  elif [[ $GUESS -lt $SECRET_NUM ]]
    then
      NUM=$GUESS
      ((NUM_GUESSES++))
      echo "It's higher than that, guess again:"
  else
      NUM=$GUESS
      ((NUM_GUESSES++))
  fi
done

USER=$( $PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME'" )
echo $USER | while read USERSNAME BAR GAMES_PLAYED BAR BEST_GAME
do
  if [[ -z $BEST_GAME ]]
  then
    INSERT_FIRST_GAME=$( $PSQL "UPDATE users SET games_played=1, best_game=$NUM_GUESSES WHERE username='$USERSNAME' " )
  else
    if [[ $NUM_GUESSES -lt $BEST_GAME ]]
     then
     INSERT_NEW_BEST=$( $PSQL "UPDATE users SET games_played=$(($GAMES_PLAYED + 1)), best_game=$NUM_GUESSES WHERE username='$USERSNAME'" )
     echo "$INSERT_NEW_BEST"
    else
      INSERT_GAME_PLAYED=$( $PSQL "UPDATE users SET games_played=$(($GAMES_PLAYED + 1)) WHERE username='$USERSNAME'" )
    fi
  fi
done
echo -e "\nYou guessed it in $NUM_GUESSES tries. The secret number was $SECRET_NUM. Nice job!"
