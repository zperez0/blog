class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
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
    @article = Article.new(params.require(:article).permit(:title, :description))
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
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "#{@article.title} was updated successfully 🤡"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    flash[:notice] = "#{@article.title} was deleted successfully 🤡"
    if @article.destroy
      redirect_to articles_path
    else
      flash[:notice] = "OOPS 🤡 could not delete #{@article.title}"
      redirect_to @article
    end
  end
end
