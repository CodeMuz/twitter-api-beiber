class ArticlesController < ApplicationController
  def index
    @articles = Article.all


      client = Twitter::REST::Client.new do |config|

        config.consumer_key        = "bdvXYUpcyfmSPzjaLAMv3A"
        config.consumer_secret     = "usmtAZzGMOSQBsdk2NrsrjyHdjYd9rLHL63gFnyIGLo"
        config.access_token        = "602956964-GcviHsjd4L2SI1PaFChld296LLzmkm6lp8zn2NsQ"
        config.access_token_secret = "3skbjcVC7jgMaT1Sxj0ZZePgFRO2o7mOslsyCcRDPF6Qn"
      end

      @tweets = []
      @articles.each do |article|
        client.search("to:justinbieber " + article.text, result_type: "recent").take(3).each do |tweet|
                @tweets.push(tweet.user.screen_name + tweet.text)
        end
      end
  end



  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
  @article = Article.new(article_params)

  @article.save
  redirect_to @article
end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
