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

post('/book/new') do
  title = params.fetch('title')
  book = Book.new({:title => title, :id =>nil})
  book.save()
  @success_message = "You have added the book #{title}."
  @books = Book.all()
  erb(:index)
end
