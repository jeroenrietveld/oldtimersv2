class AddAnswerIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :answer_id, :string
  end
end
