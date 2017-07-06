class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.references :pilot, foreign_key: true
      t.date :date
      t.string :startplace
      t.string :stopplace
      t.text :description
      t.numeric :duration
      t.numeric :length

      t.timestamps
    end
  end
end
