module Util
  module Video
    def get_video_ids
      video_ids = []
      videolist = CSV.read("data/videolist.csv")
      videolist.shift # header del
      videolist.each do |row|
        video_ids << row[0]
      end
      video_ids
    end

    # クエリ上限の50件に分割
    def separate_video_ids(video_ids)
      separate_video_ids = []
      video_ids_unit = []
      i = 0
      while i < video_ids.size
        video_ids_unit << video_ids[i]
        if video_ids_unit.size == 50
          separate_video_ids << video_ids_unit
          video_ids_unit = []
        end
        i += 1
      end
      separate_video_ids << video_ids_unit
      separate_video_ids
    end

    def create_video_csv_file(video_id)
      CSV.open("data/videos/#{video_id}.csv",'w') do |csv|
        csv << ["date","count"]
      end
    end

    def get_all_video_data_hash
      hash = {}
      videolist = CSV.read("data/videolist.csv")
      videolist.shift # header del
      videolist.each do |row|
        # video_id,title,published_at,default_thumbnail_url,large_thumbnail_url
        video_id = row[0]
        title = row[1]
        published_at = Date.parse(row[2]).to_s
        thumbnail = row[3] 
        hash[video_id] = {
          title: title,
          date: published_at,
          thumbnail: thumbnail
        }
      end
      hash
    end
  end
end