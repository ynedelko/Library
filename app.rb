require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/author')
require('./lib/book')
require('./lib/patron')
require('pg')

DB = PG.connect({:dbname => 'library'})

get('/') do
  @books = Book.all()
  erb(:index)
end

post("/book/new") do
  title = params.fetch("title")
  book = Book.new({:title => title, :id =>nil})
  book.save()
  @success_message = "You have added the book #{title}."
  @books = Book.all()
  erb(:index)
end

get('/authors') do
  @authors = Author.all()
  erb(:authors)
end

post("/author/new") do
  name = params.fetch("name")
  author = Author.new({:name => name, :id => nil})
  author.save()
  @success_message_author = "You have added the wordsmith #{name}."
  @authors = Author.all()
  erb(:authors)
end

get("/author/:id") do
  @author = Author.find(params.fetch('id').to_i())
  erb(:author)
end

get("/author/:id/edit") do
  @author = Author.find(params.fetch('id').to_i())
  erb(:author_edit)
end

patch("/author/:id") do
  name = params.fetch("name")
  @author = Author.find(params.fetch("id").to_i())
  @author.update({:name => name})
  @authors = Author.all()
  erb(:authors)
end

delete("/author/:id") do
  @author = Author.find(params.fetch("id").to_i())
  @author.delete()
  @authors = Author.all()
  erb(:authors)
end

### books below
get("/book/:id") do
  @book = Book.find(params.fetch('id').to_i())
  erb(:book)
end

get("/book/:id/edit") do
  @book = Book.find(params.fetch('id').to_i())
  erb(:book_edit)
end

patch("/book/:id") do
  title = params.fetch("title")
  @book = Book.find(params.fetch("id").to_i())
  @book.update({:title => title})
  @books = Book.all()
  erb(:index)
end

delete("/book/:id") do
  @book = Book.find(params.fetch("id").to_i())
  @book.delete()
  @books= Book.all()
  erb(:index)
end
