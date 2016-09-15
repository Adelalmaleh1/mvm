class AddColumnsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :category_id, :string
    add_column :movies, :—force, :string
  end
end
