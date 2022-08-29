require './src/scraper/video_list.rb'
video_id = ARGV[0]
Scraper::VideoList.new.update_not_list_video(video_id)