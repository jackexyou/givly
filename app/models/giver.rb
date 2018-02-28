class Giver < ApplicationRecord
	has_many :givings
	has_many :recipients, through: :givings
end
