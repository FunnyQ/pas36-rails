class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do |t|
      t.string :image

      t.timestamps
    end
  end
end
