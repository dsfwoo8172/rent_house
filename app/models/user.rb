class User < ApplicationRecord
  # 會提供兩個虛擬欄位 password & password_confirmation 都是字串
  # 當兩個虛擬欄位 match 之後會由 bcrypt 產生 password_digest 存到 database
  has_secure_password(options={validations:false}) # 關閉驗證

  # email 必須要存在且唯一, 格式需要有小老鼠
  validates :email, presence: { message: '不能空白' },
                    uniqueness: { message: '已經被使用'},
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: '格式不正確' }

  validates :password, presence: { message: '不能空白' },
                       length: {
                          minimum: 6,
                          maximum: 12,
                          too_short: '密碼最少 6 位數(含英文)',
                          too_long: '密碼最多 12 位數(含英文)'
                        },
                        confirmation: { message: '與密碼不符合' }
  validates :phone, presence: { message: '不能空白' }, uniqueness: true, length: { minimum: 10, too_short: '電話號碼需要十位數' }
  
  has_many :rent_items
end
