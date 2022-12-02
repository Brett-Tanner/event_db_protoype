class AddUserKeyToChild < ActiveRecord::Migration[7.0]
  def change
    add_reference :children, :user, null: false, foreign_key: true
  end
end
