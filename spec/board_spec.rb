# frozen_string_literal:true

require 'board'

RSpec.describe Board do
  it 'board begins as an array of indices 1-9' do
    arr = %w[1 2 3 4 5 6 7 8 9] # array of number strings
    expect(subject.current_board).to eq(arr)
  end
end
