require './src/scraper/video_list.rb'
require './src/scraper/video.rb'
require './src/calculator/daily.rb'

Scraper::VideoList.new.update()
Scraper::Video.new.update()
Calculator::Daily.new.exec()