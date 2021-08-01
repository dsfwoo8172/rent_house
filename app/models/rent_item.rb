class RentItem < ApplicationRecord
  belongs_to :user, optional: true
  has_many :favourites
  has_many :favourite_by_users, through: :favourites, source: :user

  
  def self.get_counties
    all.map(&:county).uniq
  end

  def self.under_counties_of_areas(county)
    where(county: county).map(&:area).map{|area| area.split(" ").last}.uniq
  end
  
  def favourited_by?(user)
    favourite_by_users.include?(user)
  end
end
