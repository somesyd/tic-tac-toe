#!/usr/bin/env ruby

# frozen_string_literal:true

require './lib/display'
require './lib/board'
require './lib/game'
require './lib/pretty_print'
require './lib/stringify_board'

text_formatter = PrettyPrint.new
board_formatter = StringifyBoard.new
display = Display.new(text_formatter, board_formatter)
game = Game.new(display, Board.new)
game.play
