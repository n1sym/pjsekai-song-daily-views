require './src/calculator.rb'
require './src/util/video.rb'

class Calculator::Daily < Calculator
  include Util::Video

  def exec
    today = Date.today.to_s
    hash = get_all_video_data_hash()
    arr = []
    res = []
    video_ids = get_video_ids()
    video_ids.each do |video_id|
      csv = CSV.read("data/videos/#{video_id}.csv")
      next if csv.size < 3
      daily = csv[-1][1].to_i - csv[-2][1].to_i
      arr << [video_id, daily]
    end
    arr = arr.sort_by{|x|x[1]*-1}
    CSV.open("data/daily/#{today}.csv",'w') do |csv|
      csv << ["rank", "daily", "title", "date", "thumbnail"]
      arr.each_with_index do |a, i|
        id = a[0]
        daily = a[1]
        csv << [i+1, daily, hash[id][:title], hash[id][:date], hash[id][:thumbnail]]
        video_url = "https://www.youtube.com/watch?v=#{id}"
        res << {rank: i+1, daily: daily, title: hash[id][:title], date: hash[id][:date], thumbnail: hash[id][:thumbnail], url: video_url}
      end
    end
    #FileUtils.cp "data/daily/#{today}.csv", "data/latest_daily.csv"
    File.open("data/latest_daily.json","w") {|file| 
      file.puts(JSON.generate(res))
    }
  end
end