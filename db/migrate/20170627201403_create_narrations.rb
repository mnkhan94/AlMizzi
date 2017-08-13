class CreateNarrations < ActiveRecord::Migration
  def change
  	create_table :hadith_collections do |t|
  		t.string :title
  		t.string :author
    end

    create_table :hadith_books do |t|
    	t.text :title
    	t.text :notes

    	t.integer :position
    	t.belongs_to :hadith_collection, index: true 
    end

    create_table :hadith_chapters do |t|
    	t.text :title
    	t.text :notes

    	t.integer :position
    	t.belongs_to :hadith_book, index: true 
    end

    create_table :narrations do |t|
    	t.integer :position
    	t.belongs_to :hadith_chapter, index: true 

    	t.text :arabic
    	t.text :english
    end

    create_table :narrators do |t|
    	t.integer :position
    	
    	t.text :full_name
    end

    create_table :narrator_narrations do |t|
    	t.belongs_to :narrator, index: true 
    	t.belongs_to :narration, index: true 
	end

  end
end
