require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all()
  erb(:words)
end

get('/words') do
  redirect to('/')
end

post('/words') do
  name = params[:word_name]
  word = Word.new({:name => name, :id => nil})
  word.save()
  redirect to('/')
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  redirect to('/words')
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:word_name])
  redirect to('/words')
end

get('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  erb(:definitions)
end

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  word_definition = params[:word_definition]
  definition = Definition.new({:word_definition => word_definition, :id => nil, :word_id => @word.id})
  definition.save()
  erb(:definitions)
end