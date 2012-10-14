# encoding: UTF-8
require 'twitter_search'

class TwitterController < ApplicationController
	def index
		# Formulario
	end

	def busqueda
		session[:cliente] = TwitterSearch::Client.new 'Buscar tweets'
		busqueda = Palabra.new params[:busqueda]
		busqueda.save
		session[:palabra] = busqueda.word
		redirect_to tweets_path

	rescue Exception => e
		puts e.message
		puts busqueda.inspect
		redirect_to index_path

	end

	def tweets
		# Muestra los tweets
		@palabra = session[:palabra]
		@tweets = session[:cliente].query :q => @palabra, :result_type => "recent", :rpp => 50
		id = params[:id].to_i
		@word = Palabra.get id
	end

	def guardar
		id = params[:id].to_i
		word = Palabra.get id
		palabra = session[:palabra]
		tweets = session[:cliente].query :q => palabra, :result_type => "recent", :rpp => 50
		guardar = Tweet.new
		guardar.attributes = { :user_name => tweets.from_user, :text => tweets.text, :image => tweets.profile_image_url, :date => tweets.created_at, :palabra_id => word}
		guardar.save
		redirect_to tweets_path

	rescue Exception => e
		puts e.message
		puts guardar.inspect
		redirect_to index_path
	end



end