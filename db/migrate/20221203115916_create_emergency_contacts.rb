class CreateEmergencyContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :emergency_contacts do |t|
      t.string :name
      t.string :relationship
      t.string :phone
      t.references :child, null: false, foreign_key: true

      t.timestamps
    end
  end
end
