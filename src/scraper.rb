require 'uri'
require 'net/http'
require 'json'
require 'csv'
require 'date'

class Scraper
  LIST_3DMV_ID = "PLiFNg5fXiX33oJoBNfuq2yO7exoc_9qJW"
  LIST_2DMV_ID  = "PLiFNg5fXiX32G3fNBC7U02t19zVkHAmdD"
  API_KEY = ENV["API_KEY"]
end