class ArticleController < ApplicationController
  def create
    @article = Article.new(post_params)
    @article.save
    
    redirect_to article_index_path
  end
  
  def read
    article_id = params["id"]
    @article = Article.find(article_id)
  end

  def update
    article_id = params["id"]
    
    @article = Article.find(params[:id])
    @article.update(params[:article].permit(:author, :title, :contact, :location, :body))
    
    redirect_to article_index_path
  end

  def destroy
    article_id = params["id"]
    Article.destroy(article_id)
    
    redirect_to article_index_path
  end

  def index
    @articles = Article.all()
  end

  def new
  end

  def edit
    article_id = params["id"]
    @article = Article.find(article_id)
  end
  
  private
    def post_params
      params.require(:article).permit(:title, :author, :location, :contact, :body)
    end
end
