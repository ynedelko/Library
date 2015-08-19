require('spec_helper')

describe(Patron) do
  describe(".all") do
    it("is empty at first") do
      expect(Patron.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("adds an patron to an array of patrons") do
      test_patron = Patron.new({:name => "Reading Girl"})
      test_patron.save()
      expect(Patron.all()).to(eq([test_patron]))
    end
  end
  describe('#==') do
    it('is the same patron if it has the same name and id') do
      test_patron1 = Patron.new({:name => "Reading Girl"})
      test_patron2 = Patron.new({:name => "Reading Girl"})
      expect(test_patron1).to(eq(test_patron2))
    end
  end
  describe('#name') do
    it("gives the name of the patron") do
      test_patron = Patron.new({:name => "Reading Girl"})
      expect(test_patron.name()).to(eq("Reading Girl"))
    end
  end
end
