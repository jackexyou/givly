class Product < ApplicationRecord
	belongs_to :merchant
	has_many :product_transactions
	has_many :transactions, through: :product_transactions
end
