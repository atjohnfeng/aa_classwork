class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.integer :user_id, null: false 
      t.string :long_url, null: false 
      t.string :short_url, null: false 
      #1 user: many url's
      #1 url: many users 
      #1 long url: #1 short url
    end
    add_index :shortened_urls, :short_url, unique: true
  end
end
