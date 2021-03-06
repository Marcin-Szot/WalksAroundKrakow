class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.text :description
      t.references :post

      t.timestamps
    end

    add_index :images, :post_id
  end
end
