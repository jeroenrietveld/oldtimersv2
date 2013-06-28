class RenameCompanyColumnName < ActiveRecord::Migration
  def change
  	rename_column :companies, :Specialty, :specialty
  end
end
