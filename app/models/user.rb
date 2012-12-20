class User < ActiveRecord::Base
  attr_accessible :account_balance, :email_id, :name, :password, :password_confirmation
  validates :name, :email_id, :presence => true, :uniqueness => true
  validate :balance_must_not_be_negative
  has_secure_password
  has_many :bookings

  def deposit(amount)
  	self.account_balance += amount
  	self.save!
  end

  def withdraw(amount)
  	self.account_balance -= amount
  	self.save!
  end

  def balance_must_not_be_negative
    errors.add(:account_balance, "is_negative") if account_balance < 0
  end

  def transactions
    Transaction.where("debited_from = :id OR credited_to = :id", :id => id).order(:created_at).collect do |transaction|
      trans = {:id => transaction.id, :amount => transaction.amount, :purpose => transaction.purpose, :created_at => transaction.created_at}
      if id == transaction.debited_from
        trans.merge(:type => "DEBIT", :account_no => transaction.credited_to)
      else
        trans.merge(:type => "CREDIT", :account_no => transaction.debited_from)
      end
    end
  end
end
