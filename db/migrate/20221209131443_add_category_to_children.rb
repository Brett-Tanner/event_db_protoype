class AddCategoryToChildren < ActiveRecord::Migration[7.0]
  def change
    add_column :children, :category, :string, default: "naibu"
  end
end
