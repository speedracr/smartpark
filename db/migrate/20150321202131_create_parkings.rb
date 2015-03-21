class CreateParkings < ActiveRecord::Migration
  def change
    create_table :parkings do |t|
      t.datetime :start
      t.datetime :end
      t.boolean :ispaid
      t.decimal :amount
      t.decimal :lat
      t.decimal :lng
      t.references :user, index: true
      t.references :car, index: true
      t.references :parkdeck, index: true

      t.timestamps null: false
    end
    add_foreign_key :parkings, :users
    add_foreign_key :parkings, :cars
    add_foreign_key :parkings, :parkdecks
  end
end
