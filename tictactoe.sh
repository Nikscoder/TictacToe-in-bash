
# TODO:
# Task 1: Main function to start the game
# Task 2: function to draw the main game board with connection to main.
# Task 3: Menu of game

# current player (1-'X', 2-'O')
# current_player=3-current_player
#current_player = 1

is_game_running=true
# declaration of board
board=(" " " " " "
         " " " " " "
         " " " " " ")

function isGameStopped() {
    echo "Hello from is Game stooped"
    # Placeholder for game status check logic
}

function start_input_verification() {
    while true; do
        read -p "Please choose the game character (X or O): " user_choice
        if [[ $user_choice = 'X' || $user_choice = 'O' ]]; then
            if [[ $user_choice == 'X' ]]; then
                user_player=1
                computer_player=2
            else
                user_player=2
                computer_player=1
            fi
            echo "Your choice is: $user_choice"
            echo "User_player: $user_player"
            echo "Computer_player: $computer_player"

            # break from while loop
            break
        else
            echo "Please use only X or O option to be able to play :)"
        fi
    done
}


function draw_board() {

    # Placeholder for drawing the game board
    echo "draw the board ..."
    echo "-------------"
    echo "| ${board[0]} | ${board[1]} | ${board[2]} |"
    echo "------------"
    echo "| ${board[3]} | ${board[4]} | ${board[5]} |"
    echo "------------"
    echo "| ${board[6]} | ${board[7]} | ${board[8]} |"
    echo "-------------"
}

function game_menu() {
    # Placeholder for game menu logic
    echo "Hello from game_menu"
}
function position_input(){
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
        if [[ ${board[$position]} == " " ]]; then 
            if [[ $user_player == 1 ]]; then
                board[$position]='X'
            else
                board[$position]='O'
            fi
            update_board
            
        else
            echo "Position is taken, please use another"
        fi
    done

}

function computer_move() { 
    #which cells are empy ?
    for i in ${board[@]}; do
        if [[ ${board[$i]} == " " ]]; then
            if [[ $computer_player == 1 ]]; then 
                board[$i]='X'
            else 
                board[$i]='O'
            fi
            update_board
            
        fi
    done

    #for i in ${!board[@]}; do 
     #   if [[ ${board[$i]} == " " ]]; then
      #      board[$position]=$computer_player
       #     update_board
        #    break
        #fi 
    #done
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

}

#main start game function
function main() {
    echo "Hello, this is the TicTacToe terminal game!"
    start_input_verification
    draw_board
    position_input
}

# Start the main function

main