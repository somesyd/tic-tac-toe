#!/usr/bin/env ruby

# frozen_string_literal:true

require './lib/cli_printer'
require './lib/cli_input'
require './lib/display'
require './lib/board'
require './lib/game'
require './lib/player'
require './lib/turn'
require './lib/pretty_print'
require './lib/stringify_board'

player1 = Player.new(CliInput.new, 'Player 1', 'X')
player2 = Player.new(CliInput.new, 'Player 2', 'O')
players = [player1, player2]

output = CliPrinter.new
text_formatter = PrettyPrint.new
board_formatter = StringifyBoard.new
display = Display.new(output, text_formatter, board_formatter)

board = Board.new
turn = Turn.new(display, board)
game = Game.new(display, board, turn, players)
game.play
