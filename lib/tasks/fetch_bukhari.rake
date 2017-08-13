# http://www.natadarrab.com/verbs/1230.json

desc "Fetch From Bukhari"
task :fetch_bukhari => :environment do
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

	url = "https://sunnah.com/bukhari"
	@collection = HadithCollection.first
	
		doc = Nokogiri::HTML(open(url))
		doc.css(".arabic_book_name").each do |book|
			HadithBook.create(hadith_collection_id: @collection.id, title: book.text)
			puts book.text
		end


	puts "Done! Total Books: " + $total.to_s
	

end