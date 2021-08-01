class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :rent_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
