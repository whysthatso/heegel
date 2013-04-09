class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title_eng, :string
      t.string :title_est, :string
      t.string :creation_date_eng
      t.string :creation_date_est
      t.string :measurement_eng
      t.string :measurement_est
      t.string :description_eng
      t.string :description_est
      t.string :amount
      t.decimal :price
      t.string  :image
      t.string  :image_hover

      t.timestamps
    end
  end
end
