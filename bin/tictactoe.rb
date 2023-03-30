#!/usr/bin/env ruby

# frozen_string_literal:true

require './lib/game'
require './lib/display'
require './lib/board'

game = Game.new(Display.new, Board.new)
game.play
