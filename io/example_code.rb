require_relative './lib/night_write.rb'


input_file = ARGV[0]

# Read the input file
handle = File.read(input_file)

# Convert it to braille
braille = NightWrite.to_braille(handle)

# Export it to the output file
output_file = ARGV[1]
File.write(output_file, braille)

# Print the summary
puts "Created #{output_file} containing 256 characters"
