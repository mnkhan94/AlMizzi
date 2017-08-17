# http://www.natadarrab.com/verbs/1230.json

desc "Fetch From Arbaeen"
task :fetch_arbaeen => :environment do
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

	url = "https://sunnah.com/nawawi40"

	if HadithCollection.find_by_title("الأربعون النووية").present?
		@collection = HadithCollection.find_by_title("الأربعون النووية")
		@collection.hadith_books.all.destroy_all
		@collection.narrations.all.destroy_all
	else
		@collection = HadithCollection.create(title: "الأربعون النووية") 
	end

	hb = HadithBook.create(title: "Full Book", position: 1, hadith_collection_id: @collection.id)

	i = 0
	
		doc = Nokogiri::HTML(open(url))
		doc.css(".arabic_hadith_full").each_with_index do |hadith, index|
			hc = HadithChapter.create(hadith_book_id: hb.id, title: "Hadith #{index + 1}", position: index + 1)

			Narration.create(arabic: hadith, hadith_chapter_id: hc.id, position: index + 1)
			
			i = i + 1
		end


	puts "Done! Total Narrations: #{i}" 
	

end