class NightWrite
  attr_accessor :output_file

  def initialize

  end

  def self.to_braille(file)
    # Convert the passed-in file to braille


    # Return 3 Strings for every 1 string provided
  end

  def count(file)
    256
  end

  def output_message
    puts "Created #{@output_file} containing #{count} characters"
  end

end


# `ruby night_write.rb ../io/message.txt ../io/test_out_2.txt`
# $?.success?

nightwrite = NightWrite.new

input_file = ARGV[0]

# Read the input file
handle = File.read(input_file)

# Convert it to braille
braille = NightWrite.to_braille(handle)

# Export it to the output file
output_file = ARGV[1]
File.write(output_file, braille)

# Print the summary

nightwrite.output_message
puts "Created #{output_file} containing #{nightwrite.count(handle)} characters"
