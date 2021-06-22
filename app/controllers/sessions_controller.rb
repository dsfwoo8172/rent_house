class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil # 清除 session
    redirect_to root_path, notice: "登出成功!"
  end
end