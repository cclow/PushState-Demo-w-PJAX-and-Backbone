class ArticlesController < ApplicationController
  respond_to :html

  def index
    @articles = Article.all
    @title = "Articles"
    respond_with @articles
  end

  def show
    @articles = Article.all
    @active = params[:id]
    @article = Article.find(params[:id])
    @title = "Article: #{@article.title}"
    if request.headers['X-PJAX']
      render 'pjax_show', layout: false
    else
      respond_with @article
    end
  end
end
