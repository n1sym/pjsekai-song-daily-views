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
  end
end