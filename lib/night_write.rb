require 'pry'
require_relative 'braille_map'

class NightWrite
  attr_accessor :first, :second, :third, :input_file, :output_file

  def initialize(input=nil, output=nil)
    @input_file = input
    @output_file = output
    @first = ""
    @second = ""
    @third = ""
  end

  def create_file
    handle = File.readlines(@input_file)
    file = handle.each { |x| x.strip! } .join(" ")
    File.write(output_file, to_braille(file))
    output_message(file)
  end

  def to_braille(file)
    file.chars.each do |char|
      @first << BrailleMap::KEYS.fetch(char)[0]
      @second << BrailleMap::KEYS.fetch(char)[1]
      @third << BrailleMap::KEYS.fetch(char)[2]
    end
    divide_by_eighty
  end

  def divide_by_eighty
    first = @first.scan(/.{1,80}/)
    second = @second.scan(/.{1,80}/)
    third = @third.scan(/.{1,80}/)
    create_output(first, second, third)
  end

  def create_output(first, second, third)
    output_string = ""
    first.count.times do |idx|
      output_string << first[idx]
      output_string << "\n"
      output_string << second[idx]
      output_string << "\n"
      output_string << third[idx]
      output_string << "\n" if first.count > (idx + 1)
    end
    output_string
  end

  def output_message(file)
    puts "Created #{output_file} containing #{file.chars.count} characters"
  end

end

NightWrite.new(ARGV[0], ARGV[1]).create_file if ($PROGRAM_NAME == __FILE__)
