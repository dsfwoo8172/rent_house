class ManagesController < ApplicationController
  def index
    @user = Current.user
  end
end