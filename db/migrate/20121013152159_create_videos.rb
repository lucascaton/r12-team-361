class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :youtube_url
      t.boolean :sponsored

      t.timestamps
    end
  end
end
