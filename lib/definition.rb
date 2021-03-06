class Definition
  attr_reader :id
  attr_accessor :word_definition, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @word_definition = attributes.fetch(:word_definition)
    @id = attributes.fetch(:id) || @@total_rows += 1
    @word_id = attributes.fetch(:word_id)
  end

  def ==(definition_to_compare)
    (self.word_definition == definition_to_compare.word_definition) && (self.word_id == definition_to_compare.word_id)
  end

  def self.all
    @@definitions.values()
  end

  def self.clear
    @@definitions = {}
    @@total_rows = 0
  end

  def save()
    @@definitions[self.id] = Definition.new({:word_definition => self.word_definition, :id => self.id, :word_id => self.word_id})
  end
  
  def update(word_definition)
    self.word_definition = word_definition
    self.save
  end

  def delete()
    @@definitions.delete(self.id)
  end

  def self.find(id)
    @@definitions[id]
  end

  def self.find_by_word(wrd_id)
    @@definitions.values.select{|d| d.word_id == wrd_id}
  end

  def word()
    Word.find(self.word_id)
  end
end