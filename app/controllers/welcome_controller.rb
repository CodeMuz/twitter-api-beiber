class WelcomeController < ApplicationController


  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "bdvXYUpcyfmSPzjaLAMv3A"
    config.consumer_secret     = "usmtAZzGMOSQBsdk2NrsrjyHdjYd9rLHL63gFnyIGLo"
    config.access_token        = "602956964-GcviHsjd4L2SI1PaFChld296LLzmkm6lp8zn2NsQ"
    config.access_token_secret = "3skbjcVC7jgMaT1Sxj0ZZePgFRO2o7mOslsyCcRDPF6Qn"
  end
  ARGV.each do|a|
    client.search("to:justinbieber "+ a, result_type: "recent").take(3).each do |tweet|
      puts tweet.user.screen_name + tweet.text
    end
  end


end
