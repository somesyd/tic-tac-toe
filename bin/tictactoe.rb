#!/usr/bin/env ruby

# frozen_string_literal:true

require './lib/cli_printer'
require './lib/display'
require './lib/board'
require './lib/game'
require './lib/pretty_print'
require './lib/stringify_board'

output = CliPrinter.new
text_formatter = PrettyPrint.new
board_formatter = StringifyBoard.new
display = Display.new(output, text_formatter, board_formatter)
game = Game.new(display, Board.new)
game.play
