# frozen_string_literal:true

require 'board'

RSpec.describe Board do
  it 'begins as an array of indices 1-9' do
    arr = '123456789'.chars
    expect(subject.current_board).to eq(arr)
  end
end
