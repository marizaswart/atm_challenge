require './lib/account'
require 'date'

describe Account do
  let(:person) { instance_double('Person', name: 'Mariza') } #let (any person...)
  subject { described_class.new(owner: person) } #described_class = Account, add in owner and person

  it 'is expected to have an owner' do
    expect(subject.owner).to eq person
  end

  it 'is expected to raise error if no owner is set' do
    expect { described_class.new }.to raise_error 'An Account owner is required'
  end

  it 'check lenght of the pin number' do
    pin_length = Math.log10(subject.pin_code).to_i + 1 # 1234 = 123,4 = 123 +1 1234 = 4
    expect(pin_length).to eq 4
  end

  it 'is expected to have an expiry date on initialize' do
    expected_date = Date.today.next_year(5).strftime('%m/%y')
    expect(subject.exp_date).to eq expected_date
  end

  it 'is expected to have :active status on initialize' do
    expect(subject.account_status).to eq :active
  end

  it 'deactivates account using Instance method' do
    subject.deactivate                                  # spef method
    expect(subject.account_status).to eq :deactivated
  end

  it 'is expected to have a balance of 0 on initialize' do
    expect(subject.balance).to eq 0
  end

end
