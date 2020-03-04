class CreateGenerationData < ActiveRecord::Migration[5.2]
  def change
    create_table :generation_data do |t|
      t.integer :seed
      t.integer :width
      t.integer :height
      t.integer :river_length

      t.timestamps
    end
  end
end
