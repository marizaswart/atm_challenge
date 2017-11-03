#require './lib/account'

class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    @name = username(attrs[:name])
    @cash = 0
    @account = nil
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

  def deposit(amount)
    @account == nil ? no_account : deposit_cash(amount)
  end

  def no_account
    raise 'No account present'
  end

  private

  def deposit_cash(amount)
    @cash -= amount
    account.balance += amount
  end

end
