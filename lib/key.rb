require 'date'

module KeyEnumerables

  def generate_random
    number = rand(0..99999).to_s
  end

  def generate_random_key
    generate_random.rjust(5,"0")
  end
end
