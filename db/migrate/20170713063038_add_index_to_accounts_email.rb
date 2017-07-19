class AddIndexToAccountsEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :accounts, :email, unique: true
  end
end
