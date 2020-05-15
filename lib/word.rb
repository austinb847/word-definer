class Word

  attr_reader :id
  attr_accessor :name
  
  @@total_rows = 0
  @@words = {}

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end
  
end