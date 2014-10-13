class RemoveNewsIdFromIndexSlider < ActiveRecord::Migration
  def change
    remove_column :index_sliders, :news_id, :integer
  end
end
