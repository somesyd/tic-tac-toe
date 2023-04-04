# frozen_string_literal: true

class Player
  attr_reader :name, :token

  def initialize(input, name, token)
    @input = input
    @name = name
    @token = token
  end

  def make_move
    @input.fetch_input
  end
end
