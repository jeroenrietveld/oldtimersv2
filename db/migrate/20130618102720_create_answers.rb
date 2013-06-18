class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.integer :question_id
      t.string :title
      t.text :description

      t.timestamps
    end

    add_index :answers, [:question_id, :created_at]
  end
end
