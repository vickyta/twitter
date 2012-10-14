# encoding: UTF-8
class Palabra
	include DataMapper::Resource
	include	DataMapper::Timestamps

	property :id, 		Serial
	property :word, 	String, :required => true

	has n, :tweets

	timestamps :at
end
