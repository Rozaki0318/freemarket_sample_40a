class ChangeUserIdToSnsCredential < ActiveRecord::Migration[5.1]
  def change
    change_column_null :sns_credentials, :user_id, null: false
  end
end
