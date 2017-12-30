# :pin_code :balance :account_status to be added :account_owner
class Account
  STANDARD_VALIDITY_YRS = 5

  attr_accessor :pin_code, :account_status, :owner, :balance

  def initialize(attrs = {}) #it is a hash that allows you to give as many arguments as you would like (needs symbol?)
    @pin_code = generate_pin
    @account_status = :active
    @balance = 0
    create_owner(attrs[:owner])
  end

  def exp_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def deactivate
    @account_status = :deactivated
  end

  private

  def generate_pin
    rand(1000..9999)
  end

  def create_owner(person)
    person.nil? ? missing_owner : @owner = person #If person = 0 call on missing owner else person
  end

  def missing_owner
    raise 'An Account owner is required'
  end

end
