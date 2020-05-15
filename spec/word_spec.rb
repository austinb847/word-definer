require 'word'
require 'rspec'
require 'pry'
#require 'definition'


describe('#Word') do
  before(:each) do
    Word.clear()
  end

  describe('#save') do
    it('saves a new word to a list of words') do
      word = Word.new({:name => "Nutrition", :id => nil})
      word.save()
      word2 = Word.new({:name => "Company", :id => nil})
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('.all') do
    it('returns an empty array when there are no Words added') do
      expect(Word.all).to(eq([]))
    end
  end

end