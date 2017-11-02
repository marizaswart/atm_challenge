# :name :cash :account
class Person
  attr_accessor :name, :cash

  def initialize(attrs = {})
    username(attrs[:name])
    @cash = 0
  end

  def username(name)
    name == nil ? missing_name : @name = name
    #name.nil? ? missing_name : name
  end

  def missing_name
    raise 'A name is required'
  end

end
