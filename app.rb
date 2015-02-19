require 'sinatra'
require 'sinatra/content_for'
require 'holidapi'

class MyWebApp < Sinatra::Base
	helpers Sinatra::ContentFor
	get '/' do
		time = Time.new
		@curr_yholiday = HolidApi.get(country: 'us', year: time.year, month: time.month)
		@b_holiday = HolidApi.get(country: 'us', year: '1994', month: 10)
		erb :"index"
	end
end
