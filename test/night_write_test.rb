require_relative '../lib/night_write.rb'

class NightWriteTest < Minitest::Test

  def test_raise_error_if_character_not_supported
    assert_raises(KeyError) {NightWrite.new.to_braille("&")}
  end

  def test_can_output_an_empty_string_to_empty_braille
    assert_equal "", NightWrite.new.to_braille("")
  end

  def test_can_output_a_lowercase_letter_to_braille
    assert_equal "0.\n..\n..", NightWrite.new.to_braille("a")
  end

  def test_can_output_multiple_lowercase_letters_to_braille
    assert_equal "000.00\n.0.000\n..0...", NightWrite.new.to_braille("dog")
  end

  def test_can_output_all_lowercase_letters
    assert_equal "0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000.\n..0....0.00.00000.00..0....0.00.00000.00..0.00...0.0\n....................0.0.0.0.0.0.0.0.0.0.0000.0000000",
    NightWrite.new.to_braille("abcdefghijklmnopqrstuvwxyz")
  end

  def test_can_output_all_uppercase_letters
    assert_equal "..0...0...00..00..0...00..00..0....0...0..0...0...00..00..0...00..00..0....0...0\n......0........0...0..0...00..00..0...00......0........0...0..0...00..00..0...00\n.0...0...0...0...0...0...0...0...0...0...00..00..00..00..00..00..00..00..00..00.\n..0...0....0..00..00..0.\n......0...00.......0...0\n.000.000.0.0.000.000.000",
    NightWrite.new.to_braille("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
  end

  def test_can_output_a_uppercase_letter_to_braille
    assert_equal "..0.\n...0\n.0..", NightWrite.new.to_braille("E")
  end

  def test_can_output_two_uppercase_letters_to_braille
    assert_equal "..0...0.\n..00..00\n.0...0..",
    NightWrite.new.to_braille("HH")
  end

  def test_can_output_a_capitalized_word_to_braille
    assert_equal "..0.0.0.0.0.\n..00.00.0..0\n.0....0.0.0.",
    NightWrite.new.to_braille("Hello")
  end

  def test_can_output_a_sentence_to_braille
    assert_equal "..00.00.0...000...0...000.0.0......00..00.\n..000.0..0.....0......0..0..00....00.00.00\n.0....00....0...........0.000....0..0.0...",
    NightWrite.new.to_braille("Give me a four Josh")
  end

  def test_can_output_multiple_lines_to_braille
    assert_equal "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...",
    NightWrite.new.to_braille("hello\nworld")
  end

  def test_can_restrict_output_to_80_braille_characters
    assert_equal "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n00000000000000000000000000000000000000000000000000000000000000000000000000000000\n................................................................................\n0.\n00\n..",
    NightWrite.new.to_braille("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh")
  end

  # def test_can_access_provided_input_file
  #   # MIKE said not to do this!!
  # end

end
