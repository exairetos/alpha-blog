class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
    # replaced by the before_action attribute
    # which calls the privet set_article method
    # @article = Article.find(params[:id]) #instance variable
  end

  def index
    # @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit
    # replaced by the before_action attribute
    # @article = Article.find(params[:id])
  end

  def create
    # whitelist the params
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article was created succesfully."
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
      flash[:success] = "Article was updated succesfully."
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
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to root_path
    end
  end

end
