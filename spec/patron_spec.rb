require('spec_helper')

describe(Patron) do
  describe(".all") do
    it("is empty at first") do
      expect(Patron.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("adds an patron to an array of patrons") do
      test_patron = Patron.new({:name => "Reading Girl", :id => nil})
      test_patron.save()
      expect(Patron.all()).to(eq([test_patron]))
    end
  end
  describe('#==') do
    it('is the same patron if it has the same name and id') do
      test_patron1 = Patron.new({:name => "Reading Girl", :id => nil})
      test_patron2 = Patron.new({:name => "Reading Girl", :id => nil})
      expect(test_patron1).to(eq(test_patron2))
    end
  end
  describe('#name') do
    it("gives the name of the patron") do
      test_patron = Patron.new({:name => "Reading Girl", :id => nil})
      expect(test_patron.name()).to(eq("Reading Girl"))
    end
  end
  describe('.find') do
    it('returns a patron by the patron id number') do
      test_patron = Patron.new({:name => "Reading Girl", :id => nil})
      test_patron.save()
      test_patron2 = Patron.new({:name => "Reading Boy", :id => nil})
      test_patron2.save()
      expect(Patron.find(test_patron2.id())).to(eq(test_patron2))
    end
  end
  describe('#update') do
    it('lets you update patrons in the database') do
      patron = Patron.new({:name => "Cool Patron", :id => nil})
      patron.save()
      patron.update({:name => "Cooler Patron"})
      expect(patron.name()).to(eq("Cooler Patron"))
    end
  end
  describe("#delete") do
    it("lets you delete an patron from the database") do
      patron = Patron.new({:name => "Patron Person", :id => nil})
      patron.save()
      patron2 = Patron.new({:name => "Patron Non-Person", :id => nil})
      patron2.save()
      patron.delete()
      expect(Patron.all).to(eq([patron2]))
    end
  end
end
