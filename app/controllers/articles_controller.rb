class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "#{@article.title} was created successfully 🤡"
      # redirect_to article_path(@article)
      # or
      redirect_to @article
    else
      render "new"
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "#{@article.title} was updated successfully 🤡"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    flash[:notice] = "#{@article.title} was deleted successfully 🤡"
    if @article.destroy
      redirect_to articles_path
    else
      flash[:notice] = "OOPS 🤡 could not delete #{@article.title}"
      redirect_to @article
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
