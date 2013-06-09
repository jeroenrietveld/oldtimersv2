class CreateCategoriesQuestions < ActiveRecord::Migration
  def change
    create_table :categories_questions, :id => false do |t|
    	t.integer :category_id
    	t.integer :question_id
    end

    add_index :categories_questions, :category_id
    add_index :categories_questions, :question_id
  end
end
