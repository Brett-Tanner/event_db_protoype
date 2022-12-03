class CreateRegistration < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.references :child, null: false, foreign_key: true
      t.references :event_day, null: false, foreign_key: true
      t.boolean :attend_morning
      t.boolean :attend_afternoon

      t.timestamps
    end
  end
end
