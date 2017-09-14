class Resource < ActiveRecord::Base
	belongs_to :resourceable, polymorphic: true

	
end