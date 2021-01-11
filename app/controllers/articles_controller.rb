class ArticlesController < ApplicationController
  # use filter before_action. The called method will run before the specified action
  # the private method find_article is called before show, edit, update, and destroy run.
  before_action :find_article, only: [:show, :edit, :update, :destroy]

   def index
    @articles = Article.all
    # raise
  end

  def show
    # @article = Article.find(params[:id])
    # raise
  end

  def create
    # creates and article and this is then saved back to the index page
    # raise
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def new
    @article = Article.new
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  # refactor the code that appears in several actions
  def find_article
    @article = Article.find(params[:id])
  end

end
