require 'pry'
require_relative 'braille_map'

class NightWrite
  attr_accessor :first, :second, :third

  def initialize
    @first = ""
    @second = ""
    @third = ""
  end

  def to_braille(file)
    first, second, third = braille_lines(file)

    line1_chunks, line2_chunks, line3_chunks =
      divide_by_eighty(first, second, third)

    create_output(line1_chunks, line2_chunks, line3_chunks)
  end

  def braille_lines(file)
    first, second, third = "", "", ""
    file.chars.each do |char|
      first  << BrailleMap::KEYS.fetch(char)[0]
      second << BrailleMap::KEYS.fetch(char)[1]
      third  << BrailleMap::KEYS.fetch(char)[2]
    end
    [first, second, third]
  end

  def divide_by_eighty(first, second, third)
    first  = first.scan(/.{1,80}/)
    second = second.scan(/.{1,80}/)
    third  = third.scan(/.{1,80}/)
    [first, second, third]
  end

  def create_output(first, second, third)
    output_string = ""
    first.count.times do |idx|
      output_string << first[idx]  + "\n"
      output_string << second[idx] + "\n"
      output_string << third[idx]
      output_string << "\n" if first.count > (idx + 1)
    end
    output_string
  end
end


class TerminalWriter
  attr_accessor :input_file, :output_file

  def initialize(input, output)
    @input_file  = input
    @output_file = output
  end

  def create_file
    handle = File.readlines(@input_file)
    file = handle.each { |x| x.strip! }.join(" ")
    File.write(output_file, NightWrite.new.to_braille(file))
    output_message(file)
  end

  def output_message(file)
    "Created #{output_file} containing #{file.chars.count} characters"
  end
end

if ($PROGRAM_NAME == __FILE__)
  $stdout.puts TerminalWriter.new(ARGV[0], ARGV[1]).create_file
end
