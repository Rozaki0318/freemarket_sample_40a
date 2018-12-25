class CardsController < ApplicationController
  def index
    @card = CreditCard.where(user_id: current_user.id)
  end
  def create
  end
  def new
  end
  def destroy
  end
end
