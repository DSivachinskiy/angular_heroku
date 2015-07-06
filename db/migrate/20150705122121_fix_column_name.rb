class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :tasks, :post_id, :list_id
  end
end
