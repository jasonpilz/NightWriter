require_relative 'braille_map'
require 'pry'

class NightRead
  attr_accessor :input_file, :output_file, :first, :second, :third

  def initialize(input=nil, output=nil)
    @input_file = input
    @output_file = output
    @first = []
    @second = []
    @third = []
  end

  def read_file
    handle = File.read(@input_file)
    create_file(handle)
  end

  def create_file(handle)
    letters = []
    handle.each_line { |str| letters << str.chomp.split("") }
    to_text(letters)
  end

  def to_text(file)
    file[0].each_slice(2) { |ltr| @first << ltr }
    file[1].each_slice(2) { |ltr| @second << ltr }
    file[2].each_slice(2) { |ltr| @third << ltr }
    transpose
  end

  def transpose
    line_1 = @first.map { |x| x.join }
    line_2 = @second.map { |x| x.join }
    line_3 = @third.map { |x| x.join }
    all_lines = [line_1, line_2, line_3]
    transposed = all_lines.transpose
    string = ""
    transposed.each { |ary| string << BrailleMap::KEYS.key(ary) }
    write_file(string)
  end

  def write_file(string)
    if @output_file != nil
      File.write(output_file, string)
    end
    output_message(string)
    string
  end

  def output_message(file)
    puts "Created #{output_file} containing #{file.chars.count} characters"
  end

end

NightRead.new(ARGV[0], ARGV[1]).read_file if ($PROGRAM_NAME == __FILE__)
