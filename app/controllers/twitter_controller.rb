# encoding: UTF-8
require 'twitter_search'

class TwitterController < ApplicationController
	def index
		# Formulario
	end

	def tweets
		# Muestra los tweets
		cliente = TwitterSearch::Client.new 'Buscar tweets'
		@palabra = params[:busqueda][:word]
		@tweets = cliente.query :q => @palabra, :result_type => "recent", :rpp => '10'
	end

	def guardar
		# Guarda todos los datos en la base de datos
		Palabra.transaction do	
			word = Palabra.create params[:busqueda]
			params[:tweets].each do |tweet|
	    		word.tweets.create tweet
			end
		end	
		redirect_to index_path

	rescue DataMapper::SaveFailureError => e
		puts e.message
		puts e.resource.errors.inspect
	end

end