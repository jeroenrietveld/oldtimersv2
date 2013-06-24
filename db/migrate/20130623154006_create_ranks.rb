class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.integer :level
      t.string :name
      t.integer :required_points

      t.timestamps
    end
  end
end
