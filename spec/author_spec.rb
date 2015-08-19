require('spec_helper')

describe(Author) do
  describe(".all") do
    it("is empty at first") do
      expect(Author.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("adds an author to an array of author") do
      test_author = Author.new({:name => "Bohumil Hrabal", :id => nil})
      test_author.save()
      expect(Author.all()).to(eq([test_author]))
    end
  end
  describe('#==') do
    it('is the same author if it has the same name and id') do
      test_author1 = Author.new({:name => "Bohumil Hrabal", :id => nil})
      test_author2 = Author.new({:name => "Bohumil Hrabal", :id => nil})
      expect(test_author1).to(eq(test_author2))
    end
  end
  describe('#name') do
    it("gives the name of the author") do
      test_author = Author.new({:name => "Bohumil Hrabal", :id => nil})
      expect(test_author.name()).to(eq("Bohumil Hrabal"))
    end
  end
  describe('.find') do
    it('returns a book by the books id number') do
      test_author = Author.new({:name => "Bohumil Hrabal", :id => nil})
      test_author.save()
      test_author2 = Author.new({:name => "Shakespeare", :id => nil})
      test_author2.save()
      expect(Author.find(test_author2.id())).to(eq(test_author2))
    end
  end
end
