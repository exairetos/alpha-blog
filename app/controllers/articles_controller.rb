class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    # replaced by the before_action attribute
    # which calls the privet set_article method
    # @article = Article.find(params[:id]) #instance variable
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    # replaced by the before_action attribute
    # @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article]
    # whitelist the params we need
    @article = Article.new(article_params)
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
    # replaced by the before_action attribute
    # @article = Article.find(params[:id])
    # whitelist the params we need
    if @article.update(article_params)
      flash[:notice] = "Article was updated succesfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    # replaced by the before_action attribute
    # @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id]) #instance variable
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
