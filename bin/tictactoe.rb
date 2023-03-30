#!/usr/bin/env ruby

# frozen_string_literal:true

require './lib/game'
require './lib/display'
require './lib/board'

display = Display.new(PrettyPrint.new, StringifyBoard.new)
game = Game.new(display, Board.new)
game.play
