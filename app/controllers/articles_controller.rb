class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id]) #instance variable
  end

end
