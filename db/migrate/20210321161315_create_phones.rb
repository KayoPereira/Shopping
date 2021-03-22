class CreatePhones < ActiveRecord::Migration[6.0]
  def change
    create_table :phones do |t|
      t.integer :number
      t.references :user, null: false, foreign_key: true
    end
  end
end
