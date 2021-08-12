class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, null: false, presence: true
      t.text :image_url, null: false, presence: true
      t.integer :artist_id, null: false, presence: true

    end
    add_index :artworks, [:artist_id, :title], unique: true
    add_index :artworks, :artist_id
  end
end
