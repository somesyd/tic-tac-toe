# frozen_string_literal:true

module Text
  WELCOME_MESSAGE = 'Welcome! Let\'s play a game of TIC-TAC-TOE!'

  BAD_INPUT_MESSAGE = 'Bad input: Please enter a valid number between 1 and 9: '

  ILLEGAL_MOVE_MESSAGE = 'Move not allowed: That space is already occupied. Please try again: '

  GAME_OVER_TIED = "***** GAME OVER!!! *****\n#######!! TIED !!#######"

  def request_move_message(player)
    "#{player}, Please choose a square [1-9]: "
  end

  def game_over_winner(winner)
    "***** GAME OVER!!! *****\n *** #{winner} WINS!!! ***"
  end
end
