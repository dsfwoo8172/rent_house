class RentItem < ApplicationRecord
  belongs_to :user, optional: true

  
  def self.get_counties
    all.map(&:county).uniq
  end

  def self.under_counties_of_areas(county)
    where(county: county).map(&:area).map{|area| area.split(" ").last}.uniq
  end
end
