require './lib/account'
require 'date'

describe Account do
  it 'check lenght of the pin number' do
    number = 1234
    number_length = Math.log10(number).to_i + 1
    expect(number_length).to eq 4
  end

  it 'is expected to have an expiry date on initialize' do
    expected_date = Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
    expect(subject.exp_date).to eq expected_date
  end
end
