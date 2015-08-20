require('spec_helper')

describe(Book) do
  describe(".all") do
    it("is empty at first") do
      expect(Book.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("adds a book to an array of books") do
      test_book = Book.new({:title => "Too Loud a Solitude", :id => nil})
      test_book.save()
      expect(Book.all()).to(eq([test_book]))
    end
  end
  describe('#==') do
    it('is the same book if it has the same title') do
      test_book1 = Book.new({:title => "Too Loud a Solitude", :id => nil})
      test_book2 = Book.new({:title => "Too Loud a Solitude", :id => nil})
      expect(test_book1).to(eq(test_book2))
    end
  end
  describe('#title') do
    it("gives the title of the book") do
      test_book = Book.new({:title => "Too Loud a Solitude", :id => nil})
      expect(test_book.title()).to(eq("Too Loud a Solitude"))
    end
  end
  describe('.find') do
    it('returns a book by the books id number') do
      test_book1 = Book.new({:title => "Too Loud a Solitude", :id => nil})
      test_book1.save()
      test_book2 = Book.new({:title => "Things They Carry", :id => nil})
      test_book2.save()
      expect(Book.find(test_book2.id())).to(eq(test_book2))
    end
  end
  describe('#update') do
    it('lets you update books in the database') do
      book = Book.new({:title => "Too Loud a Solitude", :id => nil})
      book.save()
      book.update({:title => "The Lover of Lady Chatterly"})
      expect(book.title()).to(eq("The Lover of Lady Chatterly"))
    end
  end
  describe("#delete") do
    it("lets you delete a book from the database") do
      book = Book.new({:title => "From Death Camp to Existentialism", :id => nil})
      book.save()
      book2 = Book.new({:title => "When You Give a Mouse a Cookie", :id => nil})
      book2.save()
      book.delete()
      expect(Book.all).to(eq([book2]))
    end
  end

  # describe('#authors') do
  #   it("returns an array of authors for that book") do
  #     test_book = Book.new({:title => "Too Loud a Solitude", :id => nil})
  #     test_book.save()
  #     test_author = Author.new({:name => "Bohumil Hrabal", :id => nil})
  #     test_author.save()
  #     test_author2 = Author.new({:name => "Byron", :id => nil})
  #     test_author2.save()
  #     expect(test_book.authors()).to(eq([test_author, test_author]))
  #   end
  # end
end
