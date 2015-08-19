class Book
  attr_reader(:title)

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
  end

  define_singleton_method(:all) do
    returned_books = DB.exec("SELECT * FROM books;")
    books =[]
    returned_books.each() do |book|
      title = book.fetch("title")
      books.push(Book.new({:title => title}))
    end
    books
  end

  define_method(:==) do |another_book|
    self.title().==(another_book.title())
  end

  define_method(:save) do
    DB.exec("INSERT INTO books (title) VALUES ('#{@title}')")
  end
end
