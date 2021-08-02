class RentItemsController < ApplicationController
  before_action :set_rent_item, only: %i[show edit update destroy favourite]
  def index
    @query = params[:q].blank? ? {county_eq: '台北市'} : params[:q] # 給 default
    @search = RentItem.ransack(@query)
    @rent_items = @search.result.includes(:user).page(params[:page]).per(30) # 撈出 30 筆資料
    @counties = RentItem.get_counties # 撈出所有縣市
    @areas = RentItem.under_counties_of_areas(@query[:county_eq]) # 撈出該縣市的區域
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

  def favourite
    if Current.user
      Current.user.toggle_fav(@rent)
      render json: { message: 'OK!', status: @rent.favourited_by?(Current.user) }
    else
      render json: { message: '請先登入', status: 401 }
    end
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