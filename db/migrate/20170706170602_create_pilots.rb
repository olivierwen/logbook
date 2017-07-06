class CreatePilots < ActiveRecord::Migration[5.1]
  def change
    create_table :pilots do |t|
      t.string :pseudo
      t.string :password_digest
      t.string :name
      t.string :firstname
      t.string :email
      t.date :birthdate
      t.text :description

      t.timestamps
    end
    add_index :pilots, :pseudo, unique: true
  end
end
