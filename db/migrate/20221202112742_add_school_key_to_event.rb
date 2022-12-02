class AddSchoolKeyToEvent < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :school, null: false, foreign_key: true
  end
end
