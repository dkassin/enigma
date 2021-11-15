

class Encryption

  attr_reader :message, :key_input, :date_input, :character_set, :final_shift

  def initialize(message,key_input, date_input)
    @message = message.downcase.split("")
    @key_input = key_input
    @date_input = date_input
    @character_set = ("a".."z").to_a << " "
    @final_shift = final_shift
  end

  def final_shift
    keys_hash.merge!(offset_hash) do |key, old_value, new_value|
      old_value + new_value
    end
  end

  def keys_hash
    key_hash =
          {
            "A" => @key_input.slice(0..1).to_i,
            "B" => @key_input.slice(1..2).to_i,
            "C" => @key_input.slice(2..3).to_i,
            "D" => @key_input.slice(3..4).to_i
          }
  end

  def offset_hash
    keys = ("A".."D").to_a
    value = @date_input.to_i * @date_input.to_i
    last_four = value.to_s[-4..-1].split("")
    hash = keys.zip(last_four.map(&:to_i)).to_h
  end

  def shift(multiplier = 1)
    hash = Hash.new
    keys_hash.keys.each do |key|
      hash[key] = @character_set.zip(@character_set.rotate(@final_shift[key]*multiplier)).to_h
    end
    hash
  end

  def encryptor(multiplier = 1)
    counter = 4
    new_message = []
    hash = shift(multiplier)
    characters = @message
    @message.each do |char|
      if @character_set.include?(char)
        counter += 1
        if counter.to_f % 4 == 1
          new_message << hash["A"][char]
        elsif counter.to_f % 4  == 2
          new_message << hash["B"][char]
        elsif counter.to_f % 4  == 3
          new_message << hash["C"][char]
        else
          new_message << hash["D"][char]
        end
      else
        new_message.append(char)
      end
    end
    new_message.join("")
  end
end
