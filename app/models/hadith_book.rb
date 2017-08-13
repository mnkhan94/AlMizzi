class HadithBook < ActiveRecord::Base
	
	belongs_to :hadith_collection
	has_many :hadith_chapters

	accepts_nested_attributes_for :hadith_chapters,
    allow_destroy: true

	def set_position
		chapters_list = self.hadith_collection.hadith_books
		if chapters_list.count > 1
			self.update_attributes(position: chapters_list.count)
		else
			self.update_attributes(position: 1)
		end
	end

end
