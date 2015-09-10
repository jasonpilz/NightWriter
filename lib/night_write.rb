require 'pry'
require_relative 'braille_map'

class NightWrite
  attr_accessor :first, :second, :third, :input_file, :output_file

  def initialize(input, output)
    @input_file = input
    @output_file = output
    @first = ""
    @second = ""
    @third = ""
  end

  def create_file
    handle = File.read(@input_file) # TODO Verify the handle.chars.count <= 40
    file = handle.downcase.strip # TODO remove downcase for capitalization
    File.write(output_file, to_braille(file))
    output_message(file)
  end

  def to_braille(file)
    file.chars.each do |char|
      @first << BrailleMap::KEYS.fetch(char)[0]
      @second << BrailleMap::KEYS.fetch(char)[1]
      @third << BrailleMap::KEYS.fetch(char)[2]
    end
    "#{@first}\n#{@second}\n#{@third}"
  end

  def output_message(file)
    puts "Created #{output_file}, containing #{file.chars.count} characters"
  end

end

NightWrite.new(ARGV[0], ARGV[1]).create_file
