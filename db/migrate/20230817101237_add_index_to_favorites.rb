class AddIndexToFavorites < ActiveRecord::Migration[7.0]
  def change
    # add_column :favorites, :recipe_id, :string
    add_index :favorites, :recipe_id
    # add_column :favorites, :user_id, :string
    add_index :favorites, :user_id
  end
end
