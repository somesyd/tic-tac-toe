# frozen_string_literal: true

class Player
  attr_reader :name

  def initialize(input, name)
    @input = input
    @name = name
  end

  def request_move
    @input.fetch_input
  end
end
