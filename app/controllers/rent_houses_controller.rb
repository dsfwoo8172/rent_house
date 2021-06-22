class RentHousesController < ApplicationController
  before_action :set_rent_house, only: %i[show edit update destroy] # 只有這四個 action 會需要知道 house
  def index
    # @rents = RentHouse.all #撈出所有物件
  end
  
  def new
    @rent = RentHouse.new
  end

  def create
    @rent = RentHouse.new(rent_params)
    if @rent.save!
      redirect_to rent_houses_path, notice: "#{@rent.title} 創建成功!" # 創建成功後轉址給訊息
    else
      render :new # 失敗重新渲染表單
    end
  end

  def show; end
  
  def edit; end

  def update
    if @rent.update!(rent_params)
      redirect_to rent_houses_path, notice: "#{@rent.title} 更新成功!" # 更新成功轉址給訊息
    else
      render :edit # 失敗重新渲染表單
    end
  end

  def destroy
    @rent.destroy
    redirect_to rent_houses_path, notice: "#{@rent.title} 刪除成功!" # 刪除成功轉址給訊息
  end


  private

  def rent_params
    params.require(:rent_house).permit()
  end

  def set_rent_house
    @rent = RentHouse.find_by(id: params[:id])
  end
  
end