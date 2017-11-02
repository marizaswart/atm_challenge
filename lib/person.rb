#require './lib/account'

class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    @name = username(attrs[:name])
    @cash = 0
    @account = nil
    user_account(attrs[:account])
  end

  def username(name)
    name == nil ? missing_name : @name = name
    #name.nil? ? missing_name : name
  end

  def missing_name
    raise 'A name is required'
  end

  def create_account
    @account = Account.new(owner: self)
  end

  private

  def user_account(account)
    account == nil
  end

end
