class CreditcardController < ApplicationController
  require "payjp"
  before_action :set_card, only: [:new,:destroy,:show]

  def new
    redirect_to action: "show" if @card.exists?
  end

  def pay 
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: current_user.first_name + current_user.last_name,
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = Creditcard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to controller: :mypage, action: :card
      else
        redirect_to action: "pay"
      end
    end
  end

  def destroy
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to controller: :mypage, action: :card
  end

  def show 
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def set_card
    @card = Creditcard.find_by(user_id: current_user.id)
  end
end
