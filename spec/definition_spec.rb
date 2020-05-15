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

  describe('#update') do
    it('updates a definition with a new definition') do
      definition = Definition.new({:word_definition => "this is a definition of a word", :id => nil, :word_id => @word_id})
      definition.save()
      definition.update("this is an updated definition")
      expect(definition.word_definition).to(eq("this is an updated definition"))

    end
  end

  describe('#delete') do
    it('deletes a definition by id') do
      definition = Definition.new({:word_definition => "this is a definition of a word", :id => nil, :word_id => @word_id})
      definition.save()
      definition2 = Definition.new({:word_definition => "this is another definition of a word", :id => nil, :word_id => @word_id})
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('.find') do
    it('finds a definition by id') do 
      definition = Definition.new({:word_definition => "this is a definition of a word", :id => nil, :word_id => @word_id})
      definition.save()
      definition2 = Definition.new({:word_definition => "this is another definition of a word", :id => nil, :word_id => @word_id})
      definition2.save()
      expect(Definition.find(definition2.id)).to(eq(definition2))
    end
  end

  describe('.find_by_word') do
    it('finds all definitions for a Word based on word_id') do
      definition = Definition.new({:word_definition => "this is a definition of a word", :id => nil, :word_id => @word.id})
      definition.save()
      definition2 = Definition.new({:word_definition => "this is another definition of a word", :id => nil, :word_id => @word.id})
      definition2.save()
      expect(Definition.find_by_word(@word.id)).to(eq([definition,definition2]))
    end
  end

  describe('word') do
    it('finds the word a definition belongs to') do
      definition = Definition.new({:word_definition => "this is a definition of a word", :id => nil, :word_id => @word.id})
      definition.save()
      expect(definition.word()).to(eq(@word))
    end
  end
end