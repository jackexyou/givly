class Recipient < ApplicationRecord
	has_many :givings
	has_many :givers, through: :givings
	has_many :transactions
	has_many :merchants, through: :transactions
end
