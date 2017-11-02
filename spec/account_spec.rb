require './lib/account'
require 'date'

describe Account do
  it 'check lenght of the pin number' do
    pin_length = Math.log10(subject.pin_code).to_i + 1
    expect(pin_length).to eq 4
  end

  it 'is expected to have an expiry date on initialize' do
    expected_date = Date.today.next_year(5).strftime('%m/%y')
    expect(subject.exp_date).to eq expected_date
  end

  it 'is expected to have :active status on initialize' do
    expect(subject.account_status).to eq :active
  end

  it 'deactivates account using Insance method' do
    subject.deactivate
    expect(subject.account_status).to eq :deactivated
  end
end
