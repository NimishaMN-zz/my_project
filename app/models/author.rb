class Author < ApplicationRecord
	require 'net/http'
  	require 'json'
  	require 'uri'
	has_many :books
	belongs_to :publisher

	def self.save_data_from_api
		url = 'https://www.safaribooksonline.com/api/v2/search/'
	    uri = URI(url)
	    data = Net::HTTP.get(uri)
	    author_data = JSON.parse(data)
	    author = author_data.map do |val|
	    	author1 = Author.new
	    	author1.name = val["results"]["authors"]
	    	author1.save
	    	author1
	    end
	end
end
