class KeyGenerator
  attr_accessor :actual_key, :random_key, :find_array_rotation

  def initialize
    @random_key = 5.times.map { (1..9).to_a.sample }
  end

  def key_for_display_prompt
    @random_key.join
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





