class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string      :name, null: false
      t.string      :depth
      t.integer     :size_pulldown, null: false
      t.timestamps
    end
  end
end
