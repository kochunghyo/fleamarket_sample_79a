class MypageController < ApplicationController


  def index
  end
  
  def card
    card = Creditcard.where(user_id: current_user.id).first
    if card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)

      @card_brand = @default_card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "https://web-jp-assets.mercdn.net/_next/static/images/visa-91c71914c6ae23d33f896e60bb1e3859.svg"
      when "JCB"
        @card_src = "https://web-jp-assets.mercdn.net/_next/static/images/mastercard-8b5b68c12b7a2fc8619c71f49ef9209b.svg"
      when "MasterCard"
        @card_src = "https://web-jp-assets.mercdn.net/_next/static/images/jcb-9ea981d20008c6545aa3afd1b3da9804.svg"
      when "American Express"
        @card_src = "https://web-jp-assets.mercdn.net/_next/static/images/american_express-4df44c450653b0209850070ea5cf1264.svg"
      when "Diners Club"
        @card_src = "https://web-jp-assets.mercdn.net/_next/static/images/dinersclub-3d52fbb4b39dc998f039571f3314bfc7.svg"
      when "Discover"
        @card_src = "https://web-jp-assets.mercdn.net/_next/static/images/discover-879b0b1c9f9a30159f09e9ef492ad349.svg"
      end
    end
  end

  def card_new
    card = Creditcard.where(user_id: current_user.id).first
    redirect_to action: "card" if card.present?
  end

  


end
