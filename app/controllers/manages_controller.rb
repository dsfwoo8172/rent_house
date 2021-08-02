class ManagesController < ApplicationController
  def index
    @user = Current.user
    @rent_item = RentItem.all.sample(15)
  end
end