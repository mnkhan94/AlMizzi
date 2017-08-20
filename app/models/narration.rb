class Narration < ActiveRecord::Base

	belongs_to :hadith_chapter

	def reset_narration
		self.update(annotated_arabic: nil)
	end

	def self.bulk_add_narrator(name)

		prefixes = [
			"حَدَّثَنَا ", 
			"حَدَّثَنَا ", 
			"حَدَّثَنِي ",
			"حَدَّثَنِي",  
			"قَالَ أَخْبَرَنِي ", 
			"فَأَخْبَرَنِي ", 
			"َأَخْبَرَنِي ", 
			"أَخْبَرَنَا ", 
			"قَالَ ", 
			"قَالَتْ ",
			"سَأَلَ ",
			"عَنِ ", 
			"عَنْ ", 
			"أَنَّ ", 
			"سَمِعْتُ ", 
			"سَمِعَ "
		]

		n = HadithCollection.first.narrations

		ahadith = n.where("arabic like ?", "%#{name}%")

		filtered_name = name
		prefixes.each do |p|
			filtered_name = filtered_name.gsub(p, "")
		end

		ahadith.each do |h|

			original = h.arabic

			if h.annotated_arabic.present?
				annot = h.annotated_arabic
				new_version = annot.gsub!(filtered_name, '<span class="narrator id-this">'+filtered_name+'</span>')
				h.update(annotated_arabic: new_version)
			else
				h.update(annotated_arabic: original)
				annot = h.annotated_arabic
				new_version = annot.gsub!(filtered_name, '<span class="narrator id-this">'+filtered_name+'</span>')
				h.update(annotated_arabic: new_version)
			end

		end

	end

end
