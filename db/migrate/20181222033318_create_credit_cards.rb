class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string            :number, null: false, unique: true
      t.integer           :security_code, null: false
      t.integer           :expiration_month, null: false
      t.integer           :expriration_year, null: false
      t.references        :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
