# encoding: UTF-8
class Tweet
	include DataMapper::Resource
	include	DataMapper::Timestamps

	property :id, 			Serial
	property :user_name, 	String
	property :text, 	 	String
	property :image, 		String
	property :date,		 	DateTime

	belongs_to :palabra

	timestamps :at
end