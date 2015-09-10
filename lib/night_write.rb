require 'pry'
require_relative 'braille_map'

class NightWrite

  def self.to_braille(file)
    characters = file.chars

    first = ""
    second = ""
    third = ""

    characters.each do |char|
      first << BrailleMap::KEYS.fetch(char)[0]
      second << BrailleMap::KEYS.fetch(char)[1]
      third << BrailleMap::KEYS.fetch(char)[2]
    end

    # Return 3 Strings for every 1 string provided
    "#{first}\n#{second}\n#{third}"
  end

end


input_file = ARGV[0]
output_file = ARGV[1]

handle = File.read(input_file)

# TODO Verify the handle.chars.count <= 40

braille = NightWrite.to_braille(handle.downcase.strip)

File.write(output_file, braille)

puts "Created #{output_file} containing #{handle.strip.chars.count} characters"
