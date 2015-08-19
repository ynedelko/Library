class Book
  attr_reader(:title)

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
  end

  define_singleton_method(:all) do
    returned_books = DB.exec("SELECT * FROM books;")
    books =[]
    returned_books.each() do |book|
      title = title.fetch("title")
      title.push(Book.new({:title => title}))
    end
    books
  end
end
