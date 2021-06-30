class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|

      t.references :user, foreign_key: true
      t.string :title
      t.text :content
      t.datetime :date_time

      t.timestamps
    end
  end
end
