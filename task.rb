
class Task
  attr_reader :description
  attr_accessor :complete

  def initialize(description)
    @description = description
    @complete = false
  end

  def complete?
    @complete
  end

  def complete!
    @complete = true
  end
end