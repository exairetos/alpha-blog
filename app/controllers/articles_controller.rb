class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id]) #instance variable
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article]
    # whitelist the params we need
    @article = Article.new(params.require(:article).permit(:title, :description))
    # render plain: @article.inspect
    if @article.save
      flash[:notice] = "Article was created succesfully."
      #redirect
      # /articles/:id(.:format)
      # redirect_to article_path(@article)
      # can be writen as
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    # whitelist the params we need
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated succesfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

end
