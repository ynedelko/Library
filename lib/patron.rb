class Patron
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id).to_i()
  end

  define_singleton_method(:all) do
    returned_patrons= DB.exec("SELECT * FROM patrons;")
    patrons =[]
    returned_patrons.each() do |patron|
      name = patron.fetch("name")
      id = patron.fetch('id')
      patrons.push(Patron.new({:name => name, :id => id}))
    end
    patrons
  end

  define_method(:==) do |another_patron|
    self.name().==(another_patron.name()).&self.id().==(another_patron.id())
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO patrons (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:find) do |id|
    found_patron = nil
    Patron.all().each() do |patron|
      if patron.id().==(id)
        found_patron = patron
      end
    end
    found_patron
  end
end
