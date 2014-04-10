class CreateHistoryPosts < ActiveRecord::Migration
  def change
    create_table :history_posts do |t|
      t.string :title
      t.text :text
      t.references :post, index: true

      t.timestamps
    end
  end
end
