class CreateIcs < ActiveRecord::Migration[5.1]
  def change
    create_table :ics do |t|
      t.string :image
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
