class Book < ApplicationRecord
	require 'net/http'
  	require 'json'
  	require 'uri'
	belongs_to :author
	belongs_to :publisher
	validates_uniqueness_of :name
	validates_presence_of :author_id,:publisher_id

	def self.save_data_from_api
		url = 'https://www.safaribooksonline.com/api/v2/search/'
	    uri = URI(url)
	    data = Net::HTTP.get(uri)
	    book_data = JSON.parse(data)
	    book = book_data.map do |val|
	    	book1 = Book.new
	    	book1.name = val["results"]["title"]
	    	book1.description = val["results"]["description"]
	    	book1.time_seconds = val["results"]["duration_seconds"]
	    	book1.publisher_id = val["results"]["publishers"]
	    	book1.author_id = val["results"]["authors"]
	    	book1.content_format = val["results"]["format"]
	    	book1.save
	    	book1
	    end
	end

end
