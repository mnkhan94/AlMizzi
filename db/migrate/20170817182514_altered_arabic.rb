class AlteredArabic < ActiveRecord::Migration
  def change
  	add_column :narrations, :annotated_arabic, :text
  end
end
