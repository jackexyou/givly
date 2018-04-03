class Merchant < ApplicationRecord
	has_many :transactions
	has_many :recipients, through: :transactions
	has_many :products
end
