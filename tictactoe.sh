#!/bin/bash

# TODO:
# Task 1: Main function to start the game
# Task 2: function to draw the main game board with connection to main.
# Task 3: Menu of game

# current player (1-'X', 2-'O')
# current_player=3-current_player
#current_player = 1

is_game_running=true
user_choice=""
computer_choice=""

# declaration of board
board=(" " " " " "
       " " " " " "
       " " " " " ")

# main function to choose the char to game with verification of user input
function game_menu() {
    while true; do
        echo "======================================="
        echo "==============='MAIN MENU'=============="
        echo "To stop and save the game press   -> save"
        echo "To finish the game press          -> end"
        echo "======================================="

        read -p "Please choose the game character (X or O): " user_choice
        if [[ $user_choice = "X" || $user_choice = "O" ]]; then
            break
        else 
            echo "Please use only X or O option to be able to play :)"
        fi
    done

    if [[ $user_choice == "X" ]]; then
        computer_choice="O"
    else 
        computer_choice="X"
    fi
    echo "User choice: $user_choice and computer: $computer_choice"
}

# To draw the first replica of draw board to play (to see the board)
function draw_board() {

    for i in ${!board[@]}; do 
        board[$i]=" "
    done
    echo "Drawing the initial board ..."
    echo "-------------"
    echo "| ${board[0]} | ${board[1]} | ${board[2]} |"
    echo "------------"
    echo "| ${board[3]} | ${board[4]} | ${board[5]} |"
    echo "------------"
    echo "| ${board[6]} | ${board[7]} | ${board[8]} |"
    echo "-------------"
}

# User move function with verification of input
function player_move(){
    while $is_game_running; do
        read -p "Position: " position

        if [[ "$position" == "end" ]]; then
            echo "The game stopped"
            is_game_running=false
            break
        fi
        if ! [[ $position =~ ^[0-9]$ ]]; then
            echo "Invalid position"
            continue
        fi
        #verify if the cell is empty
        if [[ ${board[$position]} == " " ]]; then 
            board[$position]=$user_choice
            update_board
            break
        else
            echo "Position is taken, please use another"
        fi
    done
}

# computer move
function computer_move() { 
    #which cells are empy ?
    echo "Computer's move..."

    for i in "${!board[@]}"; do
        if [[ ${board[$i]} == " " ]]; then
            board[$i]=$computer_choice
            echo "Computer placed $computer_choice in position $i."
            update_board  # Update the board after the computer's move 
            return  # Exit the function after making the move          
        fi
    done
}


function update_board(){
    
    echo "Updating..."
    echo "-------------"
    echo "| ${board[0]} | ${board[1]} | ${board[2]} |"
    echo "------------"
    echo "| ${board[3]} | ${board[4]} | ${board[5]} |"
    echo "------------"
    echo "| ${board[6]} | ${board[7]} | ${board[8]} |"
    echo "-------------"

    game_status
}


function game_status() {
    #for i in ${board[@]}; do
    echo "Checking game status..."
    for i in "${!board[@]}"; do
        if [[ ${board[$i]} == " " ]]; then
            return
        fi
    done
    is_game_running=false
    echo "We have the winner, so the game is stopped"
    finish_game_menu
}

# function to play one more time after finish the game
function finish_game_menu() {
    read -p "To play one more time, press: 1, for no press 2: " finish_menu_input
    if [[ $finish_menu_input == 1 ]]; then 
        is_game_running=true
        main
    fi
    exit
}

#main start game function
function main() {
    echo "Hello, this is the TicTacToe terminal game!"
    game_menu
    draw_board
    # while is_game_running = true
    while $is_game_running; do 
        computer_move
        player_move
    done
    finish_game_menu
}

# Start the main function
main