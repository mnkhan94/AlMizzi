class HadithCollection < ActiveRecord::Base
	has_many :hadith_books
	has_many :hadith_chapters, :through => :hadith_books
	has_many :narrations, :through => :hadith_chapters
end
