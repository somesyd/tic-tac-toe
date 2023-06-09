# frozen_string_literal: true

require 'colorize'

class CliPrinter
  def send(content)
    puts content
  end

  def send_without_newline(content)
    print content
  end
end
