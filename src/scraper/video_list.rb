require './src/scraper.rb'
require './src/util/video.rb'

class Scraper::VideoList < Scraper
  include Util::Video

  def update
    exist_video_ids = get_video_ids()
    [LIST_3DMV_ID, LIST_2DMV_ID].each do |list_id|
      sleep 1
      uri = URI("https://www.googleapis.com/youtube/v3/playlistItems?key=#{API_KEY}&playlistId=#{list_id}&part=snippet")
      res = Net::HTTP.get_response(uri)
      JSON.parse(res.body)["items"].each do |json|
        snippet = json["snippet"]
        video_id = snippet["resourceId"]["videoId"]
        unless exist_video_ids.include? video_id
          add_video_list(video_id, snippet)
          create_video_csv_file(video_id)
        end
      end
    end
  end

  def add_video_list(video_id, snippet)
    CSV.open('data/videolist.csv','a') do |csv|
      title = snippet["title"]
      default_thumbnail_url = snippet["thumbnails"]["default"]["url"]
      large_thumbnail_url = snippet["thumbnails"]["high"]["url"]
      video_id = snippet["resourceId"]["videoId"]
      published_at = snippet["publishedAt"]
      row = [video_id, title, published_at, default_thumbnail_url, large_thumbnail_url]
      csv << row
    end
  end
end