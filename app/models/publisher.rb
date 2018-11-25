class Publisher < ApplicationRecord
	has_many :books
	has_many :authors
	validates_uniqueness_of :name

	def self.save_data_from_api
		url = 'https://www.safaribooksonline.com/api/v2/search/'
	    uri = URI(url)
	    data = Net::HTTP.get(uri)
	    publisher_data = JSON.parse(data)
	    publisher = publisher_data.map do |val|
	    	publisher1 = Publisher.new
	    	val["results"]["publishers"].each do |pub_val|
	    		publisher1.name = pub_val
	    		publisher1.save
	    		publisher1
	    	end
	    end
	end
end
