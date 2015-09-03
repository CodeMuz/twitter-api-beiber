class ArticlesController < ApplicationController
  def index
    @articles = Article.all


      client = Twitter::REST::Client.new do |config|

        config.consumer_key        = ""
        config.consumer_secret     = ""
        config.access_token        = ""
        config.access_token_secret = ""
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
