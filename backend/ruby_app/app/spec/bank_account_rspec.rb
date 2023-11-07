require 'bank_account.rb'

RSpec.describe BankAccount do
  subject { described_class.new(balance: balance) }

  let(:balance) { 100 }

  describe 'attributes' do
    it 'creates BankAccount class and sets balance to the initial value' do
      expect(subject.balance).to eq(balance)
    end

    context 'when specifying a negative value as an initial balance' do
      let(:balance) { -100 }

      it 'does not create a new object and raises an error' do
        expect { subject }.to raise_error(BankAccount::InvalidInitialValueError)
      end
    end
  end

  describe '#deposit' do
    it 'increases the account balance' do
      expect { subject.deposit(300.00) }.to change { subject.balance }.by(300.00)
    end

    it 'does not allow for negative deposits' do
      expect { subject.deposit(-300.00) }.to raise_error(BankAccount::InvalidDepositValueError)
    end
  end

  describe '#withdraw' do
    it 'decreases the account balance' do
      expect { subject.withdraw(100.00) }.to change { subject.balance }.by(-100.00)
    end

    it 'does not allow for withdrawals that exceed the current balance' do
      expect { subject.withdraw(350.00) }.to raise_error(BankAccount::InsufficientFundsError)
    end

    it 'does not allow for negative withdrawals' do
      expect { subject.withdraw(-50.00) }.to raise_error(BankAccount::InvalidWithdrawalAmount)
    end
  end
end
