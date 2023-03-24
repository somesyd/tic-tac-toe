# frozen_string_literal: true

WELCOME_MSG = 'Let\'s play TIC-TAC-TOE! Here is a lot more text to add for a fun message that everyone will enjoy. Yay! for tic-tac-toe.'

# puts WELCOME_MSG

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
    "|#{' ' * (max_width + @buffer * 2)}|\n"
  end

  def message_border(message_line)
    if message_line.length < max_width
      message_line += ' ' * (max_width - message_line.length)
    end
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
  end

  def print_box_message
    puts message
  end
end

box = Embox.new(WELCOME_MSG)
box.print_box_message

