class Transaction < ApplicationRecord
	belongs_to :recipient
	belongs_to :giver
	has_many :product_transactions
	has_many :products, through: :product_transactions
end
