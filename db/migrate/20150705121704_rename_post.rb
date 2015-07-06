class RenamePost < ActiveRecord::Migration
  def change
  	rename_table :posts, :lists
  end
end
