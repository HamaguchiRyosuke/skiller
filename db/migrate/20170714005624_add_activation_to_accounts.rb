class AddActivationToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :activation_digest, :string
    add_column :accounts, :activated, :boolean, default: false
    add_column :accounts, :activated_at, :datetime
  end
end
