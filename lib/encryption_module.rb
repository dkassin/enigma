module EncryptionEnumerables

  def final_shift
  end

  def hash_setup
    keys = ("A".."D").to_a
    hash = Hash.new(0)
    keys.each do |key|
      hash[key] = 0
    end
    hash
  end

  def keys_hash(key)
    key_hash =
          {
            "A" => key.slice(0..1).to_i,
            "B" => key.slice(1..2).to_i,
            "C" => key.slice(2..3).to_i,
            "D" => key.slice(3..4).to_i
          }
  end
end
