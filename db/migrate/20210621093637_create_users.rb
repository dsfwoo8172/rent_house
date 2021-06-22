class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.string :phone, null: false
      t.string :username

      t.timestamps
    end
  end
end
