class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id]) #instance variable
  end

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    # render plain: params[:article]
    @article =Article.new(params.require(:article).permit(:title, :description))
    # render plain: @article.inspect
    @article.save

    #redirect
    # /articles/:id(.:format)
    # redirect_to article_path(@article)
    # can be writen as
    redirect_to @article
  end
end
