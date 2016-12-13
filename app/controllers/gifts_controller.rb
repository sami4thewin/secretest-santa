class GiftsController < ApplicationController

  protect_from_forgery

  def create
    # binding.pry
    # @giver = User.find(params[:gift][:user_id])
    # @recipient = User.find(params[:gift][:recipient_id])
    @gift = Gift.create(gift_params)
    render json: @gift, status: 201

  end

  private

  def gift_params
    params.require(:gift).permit(:link, :description, :price, :user_id, :recipient_id)
  end


end
