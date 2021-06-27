module ApplicationHelper
  def price_maker(price_str)
    price = price_str.split(' ')
    content_tag(:span, price[0], class: 'me-2 fw-bolder fs-4', style: 'color: #ff4313') +
    content_tag(:span, price[1], style: 'font-size: 16px')
  end
end
