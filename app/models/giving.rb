class Giving < ApplicationRecord
	belongs_to :giver
	belongs_to :recipient
end
