class CreateMovieCategories < ActiveRecord::Migration
  def change
    create_table :movie_categories do |t|
      t.belongs_to :movie, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
