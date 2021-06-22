class User < ApplicationRecord
  # 會提供兩個虛擬欄位 password & password_confirmation 都是字串
  # 當兩個虛擬欄位 match 之後會由 bcrypt 產生 password_digest 存到 database
  has_secure_password

  # email 必須要存在且唯一, 格式需要有小老鼠
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: '格式不正確' }
  
  
  
  
end
