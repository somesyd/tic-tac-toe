#!/usr/bin/env ruby

# frozen_string_literal:true

require './lib/display'
require './lib/board'
require './lib/game'

game = Game.new(Display.new, Board.new)
game.play
