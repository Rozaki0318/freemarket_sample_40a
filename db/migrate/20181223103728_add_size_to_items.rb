class AddSizeToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :size, :integer
  end
end
