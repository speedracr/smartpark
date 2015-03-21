class CreateParkdecks < ActiveRecord::Migration
  def change
    create_table :parkdecks do |t|
      t.string :name
      t.string :city
      t.decimal :lat
      t.decimal :lng
      t.decimal :pricep15

      t.timestamps null: false
    end
  end
end
