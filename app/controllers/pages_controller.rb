class PagesController < ApplicationController

	def home
		
	end

	def test_bukhari

		require 'nokogiri'
		require 'open-uri'
		require 'json'

		link = params[:link]

		url = "https://sunnah.com/bukhari/" + link
		
		result = []
	
		doc = Nokogiri::HTML(open(url))
		doc.css(".chapter").each_with_index do |chapter, index|

			if chapter.next_element.attr('class').include? "achapintro"
				notes = chapter.next_element.text
			elsif chapter.next_element.attr('class').include? "echapintro"
				notes = chapter.next_element.next_element.text
			end

			# arabic_hadith_full arabic

			ahadith = []

			fetch = collect_between(doc.css(".chapter")[index], doc.css(".chapter")[index + 1])

			fetch.each do |f|

				if f != nil 
					if f.to_html.include? 'actualHadithContainer'
						ahadith.push(f.css(".arabic_hadith_full").text)
					end
				end
			end



			v = {
				"number" => index + 1,
				"title" => chapter.css(".arabicchapter").text,
				"notes" => notes,
				"hadith" => ahadith
			}
			
			result.push(v)
		end

		# fetch = collect_between(doc.css(".chapter")[1], doc.css(".chapter")[2])
		# v = []

		# fetch.each do |f|
		# 	if f.to_html.include? 'actualHadithContainer'
		# 		v.push(f.css(".arabic_hadith_full").text)
		# 	end
		# end

		# @b = v

		@result = result
	end

	def test_muslim

		require 'nokogiri'
		require 'open-uri'
		require 'json'

		link = params[:link]

		url = "https://sunnah.com/muslim/" + link
		
		result = []
	
		doc = Nokogiri::HTML(open(url))
		doc.css(".chapter").each_with_index do |chapter, index|

			if chapter.next_element.attr('class').include? "achapintro"
				notes = chapter.next_element.text
			elsif chapter.next_element.attr('class').include? "echapintro"
				notes = chapter.next_element.next_element.text
			end

			# arabic_hadith_full arabic

			ahadith = []

			fetch = collect_between(doc.css(".chapter")[index], doc.css(".chapter")[index + 1])

			fetch.each do |f|

				if f != nil 
					if f.to_html.include? 'actualHadithContainer'
						ahadith.push(f.css(".arabic_hadith_full").text)
					end
				end
			end



			v = {
				"number" => index + 1,
				"title" => chapter.css(".arabicchapter").text,
				"notes" => notes,
				"hadith" => ahadith
			}
			
			result.push(v)
		end

		# fetch = collect_between(doc.css(".chapter")[1], doc.css(".chapter")[2])
		# v = []

		# fetch.each do |f|
		# 	if f.to_html.include? 'actualHadithContainer'
		# 		v.push(f.css(".arabic_hadith_full").text)
		# 	end
		# end

		# @b = v

		@result = result
	end

	def test_bukhari_narrators
		narrator = params[:search]

		@search = params[:search]

		n = HadithCollection.first.narrations
		@ahadith = n.where("arabic like ?", "%#{narrator}%")

	end

	def collect_between(first, last)
	  first == last ? [first] : [first, *collect_between(first.next, last)]
	end


end