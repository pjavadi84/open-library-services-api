class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.string :publish_date
      t.text :summary
      t.integer :page_count

      t.timestamps
    end
  end
end
