class Book
  attr_reader(:title, :id)

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id).to_i()
  end

  define_singleton_method(:all) do
    returned_books = DB.exec("SELECT * FROM books;")
    books =[]
    returned_books.each() do |book|
      title = book.fetch("title")
      id = book.fetch('id').to_i()
      books.push(Book.new({:title => title, :id => id}))
    end
    books
  end

  define_method(:==) do |another_book|
    self.title().==(another_book.title()).&(self.id.==(another_book.id()))
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO books (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:find) do |id|
    found_book = nil
    Book.all().each() do |book|
      if book.id().==(id)
        found_book = book
      end
    end
    found_book
  end

  define_method(:update) do |attributes|
    @title = attributes.fetch(:title)
    @id = self.id()
    DB.exec("UPDATE books SET title = '#{@title}' WHERE id = #{@id};")
  end
end
