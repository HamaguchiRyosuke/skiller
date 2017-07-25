class RemoveColumnFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :teach_skill, :string
    remove_column :users, :learn_skill, :string
  end
end
