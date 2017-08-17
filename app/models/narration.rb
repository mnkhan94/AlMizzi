class Narration < ActiveRecord::Base

	belongs_to :hadith_chapter

	def reset_narration
		self.update(annotated_arabic: nil)
	end

	def self.bulk_add_narrator(name)

		n = HadithCollection.first.narrations
		ahadith = n.where("arabic like ?", "%#{name}%")

		ahadith.each do |h|

			original = h.arabic

			if h.annotated_arabic.present?
				annot = h.annotated_arabic
				new_version = annot.gsub!(name, '<span class="narrator id-this">'+name+'</span>')
				h.update(annotated_arabic: new_version)
			else
				h.update(annotated_arabic: original)
				annot = h.annotated_arabic
				new_version = annot.gsub!(name, '<span class="narrator id-this">'+name+'</span>')
				h.update(annotated_arabic: new_version)
			end

		end

	end

end
