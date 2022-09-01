require './src/scraper/video_list.rb'
require './src/scraper/video.rb'
require './src/calculator/daily.rb'
require './src/calculator/weekly.rb'

Scraper::VideoList.new.update()
Scraper::Video.new.update()
Calculator::Daily.new.exec()
Calculator::Weekly.new.exec()