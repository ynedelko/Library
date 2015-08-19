require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/author')
require('./lib/book')
require('./lib/patron')
require('pg')

DB = PG.connect({:dbname => 'library'})

get('/') do
  erb(:index)
end
