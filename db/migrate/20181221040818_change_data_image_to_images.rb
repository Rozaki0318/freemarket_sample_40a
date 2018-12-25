class ChangeDataImageToImages < ActiveRecord::Migration[5.1]
  def change
    change_column :images, :image, :string
  end
end
