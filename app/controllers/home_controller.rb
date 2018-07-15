class HomeController < ApplicationController

	def index
		require 'net/http'
		require 'json'

		#Grab News Data
		@url = 'https://min-api.cryptocompare.com/data/v2/news/?lang=EN'
		@uri = URI(@url)
		@response = Net::HTTP.get(@uri)
		@news = JSON.parse(@response)

		#Grab Price Data
		@prices_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,XRP,BCH,EOS,LTC,ADA,XLM,MIOTA,USDT,TRX&tsyms=USD,TRY'
		@prices_uri = URI(@prices_url)
		@prices_response = Net::HTTP.get(@prices_uri)
		@prices = JSON.parse(@prices_response)
		
	end

	def prices
		require 'net/http'
		require 'json'

		@symbol = params[:sym]

		if @symbol
			@symbol = @symbol.upcase
			#Grab Price Data
			@quate_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=' + @symbol + '&tsyms=USD,TRY'
			@quate_uri = URI(@quate_url)
			@quate_response = Net::HTTP.get(@quate_uri)
			@quate = JSON.parse(@quate_response)
		end
		
	end



end
