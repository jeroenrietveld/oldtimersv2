class AddCompanyInfoToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :company_name, :string
    add_column :companies, :city, :string
    add_column :companies, :postal, :string
    add_column :companies, :CoC, :string
    add_column :companies, :Specialty, :string
  end
end
