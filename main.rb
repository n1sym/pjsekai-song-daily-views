require './src/scraper/video_list.rb'
require './src/scraper/video.rb'

Scraper::VideoList.new.update()
Scraper::Video.new.update()