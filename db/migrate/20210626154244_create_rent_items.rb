class CreateRentItems < ActiveRecord::Migration[6.1]
  def change
    create_table :rent_items do |t|
      t.string :small_img
      t.string :show_url
      t.string :title
      t.string :address
      t.string :area
      t.integer :price
      t.string :county
      t.string :room_type
      t.integer :size
      t.string :floor
      t.string :specification
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
