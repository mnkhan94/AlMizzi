class Narration < ActiveRecord::Base

	belongs_to :hadith_chapter

	def reset_narration
		self.update(annotated_arabic: nil)
	end

end
