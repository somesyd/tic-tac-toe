# frozen_string_literal: true

# rubocop:disable Layout/LineLength
WELCOME_MSG = 'Let\'s play TIC-TAC-TOE! Here is more text! We will continue a game!'
# rubocop:enable Layout/LineLength

class Embox
  def initialize(message, max_width = nil, char_str = nil)
    @message = message.dup
    @max_width = max_width
    @char_str = char_str
    @lines = []
    @buffer = 3
    build_box
  end

  def message
    @message || ''
  end

  def max_width
    @max_width || 25
  end

  def char_str
    @char_str || '-'
  end

  def build_box
    fill_lines
    @message = build_box_string
  end

  def build_box_string
    boxed_message = "#{horizontal_border}\n"
    boxed_message += vertical_border
    @lines.each do |line|
      boxed_message += message_border(line)
    end
    boxed_message += vertical_border
    boxed_message += horizontal_border
  end

  def horizontal_border
    width = max_width + (@buffer * 2)
    " #{char_str * width} "
  end

  def vertical_border
    space_width = (@buffer * 2) + max_width
    "|#{' ' * space_width}|\n"
  end

  def message_border(message_line)
    message_line += ' ' * (max_width - message_line.length) if message_line.length < max_width
    "|#{' ' * @buffer}#{message_line}#{' ' * @buffer}|\n"
  end

  def box_width
    return max_width + (@buffer * 2) if message.length > max_width

    message.length + (@buffer * 2)
  end

  def fill_lines
    line = ''
    message.split.each do |word|
      if line.length + word.length < max_width
        line += "#{word} "
      elsif line.length + word.length == max_width
        line += word
      else
        @lines.push(line)
        line = "#{word} "
      end
    end
    @lines.push(line) unless line.empty?
  end

  def print_box_message
    puts message
  end
end
