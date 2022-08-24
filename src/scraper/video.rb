require './src/scraper.rb'
require './src/util/video.rb'

class Scraper::Video < Scraper
  include Util::Video

  def update
    today = Date.today.to_s
    video_ids = get_video_ids()
    separated_video_ids = separate_video_ids(video_ids)
    separated_video_ids.each do |separated_ids|
      sleep 1
      query_ids = separated_ids.join(",")
      uri = URI("https://www.googleapis.com/youtube/v3/videos?key=#{API_KEY}&id=#{query_ids}&part=statistics")
      res = Net::HTTP.get_response(uri)
      JSON.parse(res.body)["items"].each do |json|
        id = json["id"]
        count = json["statistics"]["viewCount"]
        CSV.open("data/videos/#{id}.csv",'a') do |csv|
          csv << [today, count]
        end
      end
    end
  end
end