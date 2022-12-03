class CreateEventDays < ActiveRecord::Migration[7.0]
  def change
    create_table :event_days do |t|
      t.date :date
      t.decimal :fee
      t.string :morning_description
      t.string :afternoon_description

      t.timestamps
    end
  end
end
