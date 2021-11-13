module EncryptionEnumerables

  def final_shift(key_hash,offset_hash)
    key_hash.merge!(offset_hash) do |key, old_value, new_value|
      old_value + new_value
    end
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

  def offset_hash(date_input)
    keys = ("A".."D").to_a
    value = date_input.to_i * date_input.to_i
    last_four = value.to_s[-4..-1].split("")
    hash = keys.zip(last_four.map(&:to_i)).to_h
  end
end
