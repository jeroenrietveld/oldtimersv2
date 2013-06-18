class RemoveTitleFromAnswer < ActiveRecord::Migration
  def change
  	remove_column :answers, :title
  end
end