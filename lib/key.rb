module KeyEnumerables

  def generate_random_key
    number = rand(0..99999).to_s
    if number.length != 5
      number.rjust(5,"0")
    end
    number
  end
end
