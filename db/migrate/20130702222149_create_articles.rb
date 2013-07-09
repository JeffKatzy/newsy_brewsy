class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.text :text_preview
      t.integer :tag_id

      t.timestamps
    end
  end
end
