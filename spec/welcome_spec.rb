# frozen_string_literal: true

RSpec.describe 'a trival test to check CI tests are running' do
  it 'checks array is empty' do
    arr = []
    expect(arr.length).to eq(0)
  end
end
