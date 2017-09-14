class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      	t.string :title
      	t.string :ayah
      	t.integer :hadith_reference

    	t.text :body

    	t.string :category

    	t.belongs_to :user, index: true 

      	t.references :resourceable, polymorphic: true, index: true

    end
  end
end