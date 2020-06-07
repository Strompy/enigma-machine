class KeyGenerator
attr_reader :key, :key_hash
  def initialize
    @key = ''
    @key_hash = {}
  end

  def create_key
    @key = rand(100_000).to_s.rjust(5, '0')
  end

  def create_key_hash
    # create_key
    @key_hash = {:A => key[0..1],
    :B => key[1..2],
    :C => key[2..3],
    :D => key[3..4]
    }
  end

end
