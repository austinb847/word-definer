class Word

  attr_reader :id
  attr_accessor :name
  
  @@total_rows = 0
  @@words = {}

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def save()
    @@words[self.id] = Word.new({:name => self.name, :id => self.id})
  end

  def self.all()
    @@words.values
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end
  
end