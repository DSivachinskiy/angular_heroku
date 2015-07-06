class RenameComment < ActiveRecord::Migration
  def change
  	rename_table :comments, :tasks
  end
end
