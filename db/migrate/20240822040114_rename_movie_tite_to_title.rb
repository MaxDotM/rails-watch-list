class RenameMovieTiteToTitle < ActiveRecord::Migration[7.1]
  def change
    rename_column :movies, :tite, :title
  end
end
