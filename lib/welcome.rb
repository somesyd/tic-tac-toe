# frozen_string_literal: true

WELCOME_MSG = 'Let\'s play TIC-TAC-TOE! Here is a lot more text to add for a fun message that everyone will enjoy. Yay! for tic-tac-toe.'

# puts WELCOME_MSG

class Embox
  def initialize(message, max_width = nil, char_str = nil)
    @message = message.dup
    @max_width = max_width
    @char_str = char_str
    @lines = []
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
    # break up the message
    fill_lines
    p @lines
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
box.build_box

