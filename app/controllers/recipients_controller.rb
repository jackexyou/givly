class RecipientsController < ApplicationController
	skip_before_action :verify_authenticity_token 

	def index
		# Shows users recipients that have not yet been seen (seen: nil) but that they (Givers) have encountered (have givings of their id)
		#GET /givers/[:giver_id]/recipients
		@recipients = Recipient.joins(:givings).where(givings: {seen: false, giver_id: params[:giver_id]}).uniq
		Giving.where(giver_id: params[:giver_id]).each{|giving| giving.update(seen: true)}
		render json: @recipients 
	end

	def all 
		# Shows a user all of the receipients that they've passed and donated to
		#GET /givers/[:giver_id]/recipients/all
		@recipients = Recipient.joins(:givings).where(givings: {giver_id: params[:giver_id]}).uniq
		render json: @recipients
	end

	def donated
		# Shows a user all of the recipients that they've donated to
		#GET /givers/[:giver_id]/recipients/donated
		@recipients = Recipient.joins(:givings).where(givings: {giver_id: params[:giver_id]}).where(givings: {amount: (1.0)..Float::INFINITY}).uniq
		render json: @recipients
	end

	def passed
		# Shows a user all of the recipients that they've passed by 
		# GET givers/[:giver_id]/recipients/passed
		@recipients = Recipient.joins(:givings).where(givings: {giver_id: params[:giver_id]}).where(givings: {amount: nil}).uniq
		render json: @recipients
	end

  	def update
  		# PATCH /recipients/[:recipient_id]/
  		@recipient = Recipient.find(params[:id])
    	@recipient.update(recipient_params)
    	render json: @recipient
  	end

	private

	def recipient_params 
		params.permit(:funds)
	end
end
