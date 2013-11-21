class BookOrder
  
  attr_accessor :name, :book, :order_date, :issue_date

  def initialize(name, book, issue_date = nil, order_date = Time.now)
    @name, @book, @order_date, @issue_date = name, book, order_date, issue_date
  end

  def find_a_book
    @issue_date - @order_date if @issue_date
  end

  def to_s
    "Order information: name => #{@name}, book => #{@book}, order_date => #{@order_date}, issue_date => #{@issue_date}"
  end

end

class Library

  attr_accessor :book_orders

  def initialize
    @book_orders = []
  end

  def add_book_order(book_order)
    @book_orders << book_order
  end

  def show_all_orders
    @book_orders.each { |order| order }
  end

  def the_smallest_period_for_which_library_found_a_book
    if @book_orders.map(&:find_a_book).compact.length > 0
      Time.at(@book_orders.map(&:find_a_book).compact.min).getgm.strftime("%H:%M:%S")
    else
      "Did not find a book"
    end
  end

  def how_many_orders_were_not_satisfied
    orders_were_not_satisfied = 0
    @book_orders.each { |order| orders_were_not_satisfied +=1 if !order.issue_date }
    return orders_were_not_satisfied
  end

  def who_often_takes_the_book(book)
    readers = Hash.new(0)
    @book_orders.each { |order| readers[order.name] +=1 if order.book == book }
    reader = readers.max_by { |name, count| count }.first
  end

  def what_is_the_most_popular_book
    books = Hash.new(0)
    @book_orders.each { |order| books[order.book] += 1 }
    most_popular_book = books.max_by { |book, count| count }.first
  end

  def how_many_people_ordered_one_of_the_three_most_popular_books
    books = Hash.new(0)
    @book_orders.each { |order| books[order.book] += 1 }
    books = books.sort_by { |book, count| count }.reverse
    index_book = rand(3)
    books[index_book].first
    people = Hash.new(0)
    people_count = 0
    @book_orders.each { |order| people_count += 1 if order.book == books[index_book].first }
    "#{people_count} people ordered #{books[index_book].first}"
  end

end

book_order1 = BookOrder.new("Stas", "book1", Time.now + rand(60))
book_order2 = BookOrder.new("Stas", "book2", Time.now + rand(2*60))
book_order3 = BookOrder.new("Stas", "book2", Time.now + rand(3*60))
book_order4 = BookOrder.new("Stas", "book2", Time.now + rand(4*60))
book_order5 = BookOrder.new("Oleg", "book2")
book_order6 = BookOrder.new("Stas", "book1", Time.now + rand(5*60))
book_order7 = BookOrder.new("Vova", "book3", Time.now + rand(2*60))
book_order8 = BookOrder.new("Vova", "book3", Time.now + rand(3*60))
book_order9 = BookOrder.new("Vova", "book4")
book_order10 = BookOrder.new("Oleg", "book5")

library = Library.new

library.add_book_order(book_order1)
library.add_book_order(book_order2)
library.add_book_order(book_order3)
library.add_book_order(book_order4)
library.add_book_order(book_order5)
library.add_book_order(book_order6)
library.add_book_order(book_order7)
library.add_book_order(book_order8)
library.add_book_order(book_order9)
library.add_book_order(book_order10)

puts library.show_all_orders
puts "--------------------------------------------------------------------------------------------------------------------------------"

puts library.the_smallest_period_for_which_library_found_a_book
puts library.how_many_orders_were_not_satisfied
puts library.who_often_takes_the_book("book1")
puts library.what_is_the_most_popular_book
puts library.how_many_people_ordered_one_of_the_three_most_popular_books