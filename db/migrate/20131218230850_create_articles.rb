class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :location
      t.text :body
      t.string :contact

      t.timestamps
    end
  end
end
