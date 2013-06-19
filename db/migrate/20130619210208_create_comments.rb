class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.integer :answer_id
    	t.integer :user_id
      t.text :description

      t.timestamps
    end

    add_index :comments, [:answer_id, :created_at]
  end
end
