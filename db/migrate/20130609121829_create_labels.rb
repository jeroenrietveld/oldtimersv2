class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
    	t.integer :question_id
      t.string :title

      t.timestamps
    end

    add_index :labels, [:question_id, :created_at]
  end
end
