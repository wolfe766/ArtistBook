class ChangePostsDateToString < ActiveRecord::Migration[5.1]
  def change
  	change_column :posts, :date, :string
  end
end
