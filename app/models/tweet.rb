# encoding: UTF-8
class Tweet
	include DataMapper::Resource
	include	DataMapper::Timestamps

	property :id, 			Serial
	property :user_name, 	String
	property :text, 	 	String, :length => 200
	property :image, 		String, :length => 200

	belongs_to :palabra

	timestamps :at
end