require 'watir'

task create_house_data: :environment do
  url = "https://rent.591.com.tw/?kind=0&region=1" # 目標網站
  # url = "https://rent.591.com.tw/home/11040181"
  browser = Watir::Browser.new :chrome # 建立瀏覽器
  browser.goto(url) # 開啟頁面
  # byebug
  # 一開始有視窗需要關閉
  close_login_button = browser.a(id: "area-box-close")
  close_login_button.click if close_login_button

  rent_items = []
  page = 11
  index = 0
  
  while index < page # 抓十一頁
    # 選到要的資料
    houses = browser.div(id: 'content').uls(class: ['listInfo', 'clearfix', 'j-house'])
    # 迴圈整理
    houses.each do |house|

      data = {
        small_img: house.li(class: 'imageBox').img.attributes[:data_original], # 圖片網址
        show_url: 'https:' + house.h3.a.attributes[:href], # 物件內頁
        title: house.h3.a.text, # 物件名稱
        address: house.ps[1].text,  # 物件地址
        area: house.ps[1].text.split("-")[0], # 物件地區
        price: house.div(class: 'price').text, # 物件價格
        county: '台北市',
        user_id: User.first.id
      }
      
      # 拆出房間種類，坪數，樓層，格局
      house.ps[0].text.split("|").map(&:strip).each do |str|
        if str =~ /套房|雅房|住家/
          data[:room_type] = str
        elsif str =~ /坪/
          data[:size] = str
        elsif str =~ /樓層/
          data[:floor] = str
        else
          data[:specification] = str # 不符合上面三個的話, 就會是格局
        end
      end

      rent_items << data # 放到陣列裡面
    
    end

    sleep 2 # 間隔 2 秒
    index += 1 # 改變條件
    browser.a(class: 'pageNext').click # 點擊下一頁
    
  end
  # byebug

  rent_items.each {|item| RentItem.create(item)}

end