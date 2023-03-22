# frozen string literal: true

require 'hello'

describe 'Hello' do
  it 'says hello' do
    expect { say_hello }.to output("Hello World!\n").to_stdout
  end
end
