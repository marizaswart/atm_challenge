# :name :cash :account
class Person
  attr_accessor :name

  def initialize(attrs = {})
    username(attrs[:name])
  end

  def username(name)
    name == nil ? missing_name : @name = name
    #name.nil? ? missing_name : name
  end

  def missing_name
    raise 'A name is required'
  end
end
