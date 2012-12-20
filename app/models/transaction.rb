class Transaction < ActiveRecord::Base
  attr_accessible :debited_from, :credited_to, :amount, :purpose
  def self.log(transaction)
    create(transaction).id
  end
end
