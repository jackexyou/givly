class Giver < ApplicationRecord
	has_many :givings
	has_many :recipients, through: :givings

	def donate(recipient, amount)
		Giving.create(amount: amount, recipient_id: recipient.id, giver_id: self.id)
		recipient.funds = 0 if recipient.funds == nil
		recipient.save if recipient.funds += amount
	end

	def history
		Giving.where(giver_id: self.id)
	end

	def total_given_to(recipient) 
		history.where(recipient_id: recipient.id).sum("amount")
	end


end
