class RentItem < ApplicationRecord
  belongs_to :user, optional: true

  def self.get_areas(params)
    if params.nil? || !params[:county_eq]
      self.all.map(&:area).map{|area| area.split(" ").last}.uniq
     else
      self.where(county: params[:county_eq]).map(&:area).map{|area| area.split(" ").last}.uniq
     end
  end
end
