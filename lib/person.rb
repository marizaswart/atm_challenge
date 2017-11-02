# :name :cash :account
class Person
  attr_accessor :name

  def initialize(attrs = {})
    username(attrs[:name])
  end

  def username(name)
    name == nil ? missing_name : @name = name
  end

end
