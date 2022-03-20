class CreateVinyls < ActiveRecord::Migration[6.1]
  def change
    create_table :vinyls do |t|
      t.string :artist
      t.string :title
      t.string :genre
      t.string :year

      t.timestamps
    end
  end
end
