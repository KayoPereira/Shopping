class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :users, null: false, foreign_key: true
      t.references :districts, null: false, foreign_key: true
      t.text :street
      t.integer :number
      t.text :cep
      t.text :complement
    end
  end
end
