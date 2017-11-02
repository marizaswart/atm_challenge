# :pin_code :balance :account_status to be added :account_owner
class Account
  attr_accessor :pin_code, :exp_date
  STANDARD_VALIDITY_YRS = 5

  def initialize
    @pin_code = generate_pin
  end
end

private

def generate_pin
  rand(1000..9999)
end

def set_expire_date
  Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
end
