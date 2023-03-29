# frozen_string_literal: true

RSpec.describe 'a trival test to check CI tests are running' do
  it 'checks array length is zero' do
    arr = []
    expect(arr.length).to eq(0)
  end
end
