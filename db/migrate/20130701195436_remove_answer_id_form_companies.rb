class RemoveAnswerIdFormCompanies < ActiveRecord::Migration
  def change
  	remove_column :companies, :answer_id
  	add_column :answers, :company_id, :integer
  end
end