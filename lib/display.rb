# frozen_string_literal: true

class Display
  def text(content)
    puts Embox.new(content).message
  end
end

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

  private

  def max_width
    @max_width || 25
  end

  def char_str
    @char_str || '-'
  end

  def length_of_longest_line
    @lines.max_by(&:length).length
  end

  def box_width
    return max_width + (@buffer * 2) if message.length > max_width

    message.length + (@buffer * 2)
  end

  def build_box
    fill_lines
    @message = build_box_string
  end

  def build_internal_message_string
    internal_text = ''

    @lines.each do |line|
      internal_text += message_border(line)
    end

    internal_text
  end

  def build_box_string
    boxed_message = "#{horizontal_border}\n"
    boxed_message += vertical_border
    boxed_message += build_internal_message_string
    boxed_message += vertical_border
    boxed_message + horizontal_border
  end

  def horizontal_border
    width = length_of_longest_line + (@buffer * 2)
    " #{char_str * width} "
  end

  def vertical_border
    space_width = (@buffer * 2) + length_of_longest_line
    "|#{' ' * space_width}|\n"
  end

  def message_border(message_line)
    message_padding = length_of_longest_line - message_line.length
    message_line += ' ' * message_padding if message_line.length < max_width

    "|#{' ' * @buffer}#{message_line}#{' ' * @buffer}|\n"
  end

  def fill_lines
    line = ''

    message.split.each do |word|
      if line.length + word.length < max_width
        line += "#{word} "
      elsif line.length + word.length == max_width
        line += word
      else
        push_line(line)
        line = "#{word} "
      end
    end

    push_line(line)
  end

  def push_line(line)
    line = line.strip
    @lines.push(line) unless line.empty?
  end
end
