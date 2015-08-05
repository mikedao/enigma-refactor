class DecryptKeyGenerator
  attr_accessor :actual_key, :random_key

  def initialize(random_key)
    @random_key = random_key.chars
  end

  def find_array_rotation
   (find_rotation_a + find_rotation_b + find_rotation_c + find_rotation_d).join.scan(/.{1,2}/).map(&:to_i)
  end

  def find_rotation_a
    @random_key[0..1]
  end

  def find_rotation_b
    @random_key[1..2]
  end

  def find_rotation_c
    @random_key[2..3]
  end

  def find_rotation_d
    @random_key[3..4]
  end
end

