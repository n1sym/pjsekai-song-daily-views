require './src/calculator.rb'

class Calculator::Weekly < Calculator
  def exec
    today = Date.today

    # 1週間以内にtop10入りしたvideoリストを作成
    in_weekly_ranking_videos = {}
    ((today - 6)..today).each do |day|
      #next if day == Date.today
      csv = CSV.read("data/daily/#{day.to_s}.csv")
      (1..10).each do |num|
        title = csv[num][2]
        in_weekly_ranking_videos[title] = []
      end
    end
    
    (Date.parse("2022-08-25")..today).each do |day|
      #next if day == Date.today
      csv = CSV.read("data/daily/#{day.to_s}.csv")
      top10 = []
      (1..20).each do |num|
        title = csv[num][2]
        top10 << title
        if in_weekly_ranking_videos[title]
          in_weekly_ranking_videos[title] << num
        end
      end
      in_weekly_ranking_videos.keys.each do |title|
        unless top10.include? title
          in_weekly_ranking_videos[title] << nil
        end
      end
    end
    File.open("data/latest_weekly.json","w") {|file| 
      file.puts(JSON.generate(in_weekly_ranking_videos))
    }
  end
end