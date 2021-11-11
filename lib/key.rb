require 'date'

module KeyEnumerables

  def generate_random
    number = rand(0..99999).to_s
  end

  def generate_random_key
    generate_random.rjust(5,"0")
  end

  def date_format
  date = Date.today.to_s.split('-')
  order = [2,1,0]
  date[0].slice!(0..1)
  date_key = date.values_at *order
  date_key.join('')
  end
end
