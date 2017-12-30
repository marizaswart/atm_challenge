require './lib/account' # because we are using class Account from other file

class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    @name = username(attrs[:name])
    @cash = 0
  end

  def create_account
    @account = Account.new(owner: self) # self represents the instance that is currently working on
  end

  def deposit(amount)
    @account.nil? ? no_account : deposit_cash(amount)
  end

  def get_cash_from_atm(args = {})
    @account.nil? ? no_account : withdraw_cash(args)
  end

  private

  def username(name)
    name.nil? ? missing_name : name
  end

  def missing_name
    raise 'A name is required'
  end

  def deposit_cash(amount)
    @cash -= amount
    @account.balance += amount
  end

  def withdraw_cash(args)
    args[:atm].nil? ? no_atm : atm = args[:atm]
    account = @account
    amount = args[:amount]
    pin = args[:pin]
    response = atm.withdraw(amount, pin, account)
    response[:status] ? increase_cash(response) : response
  end

  def increase_cash(response)
    @cash += response[:amount]
  end

  def no_account
    raise 'No account present'
  end

  def no_atm
    raise 'An ATM is required'
  end

end
