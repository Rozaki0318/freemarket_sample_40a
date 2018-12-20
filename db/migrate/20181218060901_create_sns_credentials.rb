class CreateSnsCredentials < ActiveRecord::Migration[5.1]
  def change
    create_table :sns_credentials do |t|
      t.string :uid
      t.string :provider
      t.timestamps
    end
  end
end
