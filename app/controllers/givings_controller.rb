class GivingsController < ApplicationController
  	before_action :set_giving, only: [:show]
	skip_before_action :verify_authenticity_token 

	def index
		givings = Giving.all 
		render json: givings 
	end

	def show
		render json: giving
	end

	def create 
		# POST   /givers/:giver_id/givings Creates a new giving (encounter) and sets the recipient's seen status to nil again if it's true, so that they will be shown to the user again (or not depending on what we decide?) it could be that we don't show a giver a recipient that they've already seen before
		giving = Giving.create(giving_params)
		render json: giving, status: 201
	end

	def update 
  		# PATCH givings/[:giving_id] It can't be less than 1.0
  		@giving = Giving.find(params[:id])
  		@giving.increment!(:amount, params[:amount].to_f)
  	    @giving.update(giving_params).merge(seen: true)
  		Recipient.find(params[:recipient_id]).increment!(:funds, params[:amount].to_f)
    	render json: @giving
	end

	private

	def giving_params 
		params.permit(:recipient_id, :location, :giver_id)
	end

  	def set_giving
    	giving = Giving.find(params[:id])
  	end
end
