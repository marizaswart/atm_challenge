class Atm
  attr_accessor :funds

  def initialize
    @funds = 1000
  end

  def withdraw(amount, account)
    case
      when amount > account.balance
        return
      else
      @funds -= amount
      account.balance = account.balance - amount
      {status: true, message: 'Success', date: Date.time, amount: amount}
    end
  end
end
