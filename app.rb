require 'sinatra'
require 'holidapi'

class MyWebApp < Sinatra::Base
  get '/' do
    time = Time.new
    params['year'] ||= Time.now.year
    params['month'] ||= Time.now.month
    params['day'] ||= Time.now.day
    @curr_yholiday = HolidApi.get(country: 'us', year: params['year'], month: params['month'], day: params['day'])
    @b_holiday = HolidApi.get(country: 'us', year: '1994', month: 10)
    erb :"index"
  end
end
