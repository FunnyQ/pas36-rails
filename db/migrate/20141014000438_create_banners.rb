class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :img
      t.string :link

      t.timestamps
    end
  end
end
