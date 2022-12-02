class AddSchoolKeyToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :school, null: false, foreign_key: true
  end
end
