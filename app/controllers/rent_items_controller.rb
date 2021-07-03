class RentItemsController < ApplicationController
  before_action :set_rent_item, only: %i[show edit update destroy] # 只有這四個 action 會需要知道 item
  def index
    @query = params[:q] || {}
    @search = RentItem.ransack(@query) #撈出所有物件 每頁三十筆資料
    @rent_items = @search.result.page(params[:page]).per(30)
    @counties = RentItem.all.map(&:county).uniq # 撈出所有縣市
  end
  
  def new
    @rent = RentItem.new
  end

  def create
    @rent = RentItem.new(rent_params)
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
    # 白名單
    params.require(:rent_item).permit(:small_img, :show_url, :title, :address,
                                       :area, :price, :county, :type, :size, :floor,
                                       :specification, :user_id, :q)
  end

  def set_rent_item
    @rent = RentItem.find_by(id: params[:id])
  end
  
end