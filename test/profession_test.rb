require "test_helper"

class ProfessionTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Profession::VERSION
  end

  def test_professions_are_loaded
    assert (Profession::Profession.size == 1152)
  end

  def test_professions_is_an_array_of_string_professions
    assert Profession::Profession.list[15].is_a? String
  end

  def test_contains_exact_match?
    assert Profession::Profession.contains_exact?('Zoologist')
    refute Profession::Profession.contains_exact?('Clamper')
    refute Profession::Profession.contains_exact?('Storm Trooper')
  end

  def test_exact_match
    assert ['Zoo Keeper'] == Profession::Profession.exact_match('Zoo Keeper')
    assert [] == Profession::Profession.exact_match('Keeper')
  end

  def test_match
    refute_empty Profession::Profession.match('Zoo Keeper')
    refute_empty Profession::Profession.match('Keeper')
    assert Profession::Profession.match('Keeper').size > 1
  end

end
