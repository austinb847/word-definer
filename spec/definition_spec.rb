require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe('#Definition') do
  before(:each) do
    Definition.clear()
    Word.clear()
    @word = Word.new({:name => "Nutrition", :id => nil})
    @word.save()
  end

  describe('#save') do
    it('saves a definition') do
      definition = Definition.new({:word_definition => "this is a definition of a word", :id => nil, :word_id => @word_id})
      definition.save()
      definition2 = Definition.new({:word_definition => "this is another definition of a word", :id => nil, :word_id => @word_id})
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.all') do
    it('returns an empty array if no defintions are added') do
      expect(Definition.all).to(eq([]))
    end
  end
end