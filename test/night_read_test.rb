require_relative '../lib/night_read.rb'

class NightReadTest < Minitest::Test

  def test_raise_error_if_character_not_supported
    assert_raises(KeyError) {NightRead.new.create_file("..\n..\n.0")}
  end

  def test_raise_error_if_converting_empty_braille_file
    assert_raises "Error - Converting empty file" do
      NightRead.new.create_file("")
    end
  end

  def test_can_convert_a_braille_character_into_a_lowercase_letter
    assert_equal "a", NightRead.new.create_file("0.\n..\n..")
  end

  def test_can_convert_a_braille_character_into_a_uppercase_letter
    skip
  end

  def test_can_convert_braille_into_a_lowercase_word
    skip
  end

  def test_can_convert_braille_into_a_capitalized_word
    skip
  end

  def test_can_convert_braille_into_multiple_words
    skip
  end


end
