require('spec_helper')

describe(Book) do
  describe(".all") do
    it("is empty at first") do
      expect(Book.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("adds a book to an array of books") do
      test_book = Book.new({:title => "Too Loud a Solitude"})
      test_book.save()
      expect(Book.all()).to(eq([test_book]))
    end
  end
  describe('#==') do
    it('is the same book if it has the same title and id') do
      test_book1 = Book.new({:title => "Too Loud a Solitude"})
      test_book2 = Book.new({:title => "Too Loud a Solitude"})
      expect(test_book1).to(eq(test_book2))
    end
  end
  describe('#title') do
    it("gives the title of the book") do
      test_book = Book.new({:title => "Too Loud a Solitude"})
      expect(test_book.title()).to(eq("Too Loud a Solitude"))
    end
  end
end
