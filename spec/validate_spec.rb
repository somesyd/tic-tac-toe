# frozen_string_literal: true

require 'validate'

RSpec.describe 'ErrorReport' do
  let(:report) { ErrorReport.new(true, 'this is an error message') }

  it 'has a valid method' do
    expect(report).to respond_to(:valid)
  end

  it 'has a error_message method' do
    expect(report).to respond_to(:error_message)
  end
end

RSpec.describe 'Validate#check' do
  let(:validate) { Validate.new }
  let(:board_array) { %w[1 2 3 4 5 6 7 8 9] }

  it 'returns ErrorReport with true if input is valid' do
    input = '5'

    error_report = validate.check(input, board_array)
    expect(error_report.valid).to be true
    expect(error_report.error_message).to be_nil
  end

  it 'returns ErrorReport with false if input is not an integer' do
    input = 'x'

    error_report = validate.check(input, board_array)
    expect(error_report.valid).to be false
    expect(error_report.error_message).to be(Text::BAD_INPUT_MESSAGE)
  end

  it 'returns ErrorReport with false if board index is already occupied' do
    board_array = %w[1 2 3 4 X 6 7 8 9]
    input = '5'

    error_report = validate.check(input, board_array)
    expect(error_report.valid).to be false
    expect(error_report.error_message).to be(Text::ILLEGAL_MOVE_MESSAGE)
  end
end

RSpec.describe 'Validate#check with board edges' do
  let(:validate) { Validate.new }
  let(:board_array) { %w[1 2 3 4 5 6 7 8 9] }

  it 'returns ErrorReport with false if input is nil' do
    input = nil

    error_report = validate.check(input, board_array)
    expect(error_report.valid).to be false
    expect(error_report.error_message).to be(Text::BAD_INPUT_MESSAGE)
  end

  it 'returns ErrorReport with false if input is 0' do
    input = '0'

    error_report = validate.check(input, board_array)
    expect(error_report.valid).to be false
    expect(error_report.error_message).to be(Text::BAD_INPUT_MESSAGE)
  end

  it 'returns ErrorReport with false if input is 10' do
    input = '10'

    error_report = validate.check(input, board_array)
    expect(error_report.valid).to be false
    expect(error_report.error_message).to be(Text::BAD_INPUT_MESSAGE)
  end

  it 'returns ErrorReport with false if input is empty string' do
    input = ''

    error_report = validate.check(input, board_array)
    expect(error_report.valid).to be false
    expect(error_report.error_message).to be(Text::BAD_INPUT_MESSAGE)
  end

  it 'returns ErrorReport with false if input is negative' do
    input = '-2'

    error_report = validate.check(input, board_array)
    expect(error_report.valid).to be false
    expect(error_report.error_message).to be(Text::BAD_INPUT_MESSAGE)
  end
end
