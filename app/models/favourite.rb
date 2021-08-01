class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :rent_item
end
