class BankAccount
  class InvalidInitialValueError < RuntimeError; end
  class InvalidDepositValueError < RuntimeError; end
  class InsufficientFundsError < RuntimeError; end
  class SavingsAlreadyExistsError < RuntimeError; end
  class NoSavingsError < RuntimeError; end
  class InvalidWithdrawalAmount < RuntimeError; end

  attr_accessor :balance, :savings, :savings_start_date

  BASE_RATE = 2.5

  def initialize(balance:)
    raise InvalidInitialValueError if balance.negative?

    @balance = balance
    @savings = nil
    @savings_start_date = nil
  end

  def deposit(amount)
    raise InvalidDepositValueError if amount.negative?

    self.balance += amount
  end

  def withdraw(amount)
    raise InvalidWithdrawalAmount if amount.negative?
    raise InsufficientFundsError if amount > balance

    self.balance -= amount
  end

  def create_savings(deposit_amount)
    raise InsufficientFundsError if deposit_amount > balance
    raise SavingsAlreadyExistsError unless savings.nil?
    raise InvalidDepositValueError if deposit_amount.negative?

    self.savings = deposit_amount
    self.savings_start_date = Date.today
    balance - deposit_amount
  end

  def withdraw_savings
    raise NoSavingsError if savings.nil?

    days_since_creation = (Date.today - savings_start_date).to_i
    interest = (savings * BASE_RATE / 100 / 365) * days_since_creation
    total_withdrawal = savings + interest

    self.savings = nil
    self.savings_start_date = nil
    self.balance += total_withdrawal

    total_withdrawal
  end
end
