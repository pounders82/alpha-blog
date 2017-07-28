class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit] #can do this if there is a repeative call

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit

  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
    end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    # @article.save

    if @article.save
    flash[:notice] = "Article was successfully created"
    redirect_to article_path(@article)
    else
    render 'new'

    end
  end
  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

    def set_article
      @article = Article.find(params[:id])
    end

  end