class MypageController < ApplicationController


  def index
  end
  
  def card
    card = Creditcard.where(user_id: current_user.id).first
    if card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def card_new
    card = Creditcard.where(user_id: current_user.id).first
    redirect_to action: "card" if card.present?
  end

  


end
