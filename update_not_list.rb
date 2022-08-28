require './src/scraper/video_list.rb'
video_id = "mMUFtpnPFKs"
Scraper::VideoList.new.update_not_list_video(video_id)