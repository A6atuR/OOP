class Parcel
  
  attr_accessor :city, :street, :house, :apartment, :destination, :value
  
  def initialize(city, street, house, apartment, destination, value)
    @city, @street, @house, @apartment, @destination, @value = city, street, house, apartment, destination, value
  end
  
  def to_s
    "Parcel: city => #{city}, street => #{street}, house => #{house}, apartment => #{apartment}, destination => #{destination}, value => #{value}"
  end

end

class MailSorting

  attr_accessor :parcels

  def initialize
    @parcels = []
  end

  def add_parcel(parcel)
    @parcels << parcel
  end

  def show_all_parcels
    @parcels.each { |parcel| parcel }
  end

  def the_number_of_parcels_sent_to_some_city(city)
    parcels_count = 0
    @parcels.each { |parcel| parcels_count +=1 if parcel.city == city }
    return parcels_count
  end

  def how_many_parcels_with_value_higher_than_10_were_sent
    parcels_count = 0
    @parcels.each { |parcel| parcels_count +=1 if parcel.value > 10 }
    return parcels_count
  end

  def what_is_the_most_popular_address
    adresses = Hash.new(0)
    @parcels.each { |parcel| adresses["city => #{parcel.city}, street => #{parcel.street}, house => #{parcel.house}, apartment => #{parcel.apartment}"] += 1 }
    adresses.max_by { |adress, count| count }.first
  end

end

parcel1 = Parcel.new("city1", "street1", "house1", "apartment1", "Stas", 5)
parcel2 = Parcel.new("city1", "street1", "house1", "apartment1", "Stas", 15)
parcel3 = Parcel.new("city2", "street2", "house2", "apartment2", "Vova", 25)
parcel4 = Parcel.new("city2", "street2", "house2", "apartment2", "Vova", 100)
parcel5 = Parcel.new("city2", "street2", "house2", "apartment2", "Vova", 50)
parcel6 = Parcel.new("city2", "street2", "house2", "apartment2", "Vova", 200)
parcel7 = Parcel.new("city3", "street3", "house3", "apartment3", "Oleg", 1)

mail_sorting = MailSorting.new

mail_sorting.add_parcel(parcel1)
mail_sorting.add_parcel(parcel2)
mail_sorting.add_parcel(parcel3)
mail_sorting.add_parcel(parcel4)
mail_sorting.add_parcel(parcel5)
mail_sorting.add_parcel(parcel6)
mail_sorting.add_parcel(parcel7)

puts mail_sorting.show_all_parcels
puts "---------------------------------------------------------------------------------------------------------------------"

puts mail_sorting.the_number_of_parcels_sent_to_some_city("city1")
puts mail_sorting.how_many_parcels_with_value_higher_than_10_were_sent
puts mail_sorting.what_is_the_most_popular_address