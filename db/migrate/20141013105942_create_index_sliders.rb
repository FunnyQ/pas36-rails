class CreateIndexSliders < ActiveRecord::Migration
  def change
    create_table :index_sliders do |t|
      t.string :category
      t.string :link
      t.string :img
      t.references :news

      t.timestamps
    end
  end
end
