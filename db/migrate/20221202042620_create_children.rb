class CreateChildren < ActiveRecord::Migration[7.0]
  def change
    create_table :children do |t|
      t.string :name
      t.date :birthday
      t.string :level
      t.string :allergies

      t.timestamps
    end
  end
end
