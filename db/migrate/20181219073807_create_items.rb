class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.integer :condition, null: false
      t.integer :shipping_from, null: false
      t.integer :shipping_date, null: false
      t.integer :shipping_fee, null: false
      t.integer :shipping_way, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
