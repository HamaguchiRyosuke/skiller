class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.integer :age, null: false
      t.string :teach_skill
      t.string :learn_skill
      t.text :other_information
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
