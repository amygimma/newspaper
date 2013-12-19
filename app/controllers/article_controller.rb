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
  end

  def destroy
  end

  def index
    @articles = Article.all()
  end

  def new
  end

  def edit
  end
  
  private
    def post_params
      params.require(:article).permit(:title, :author, :location, :contact, :body)
    end
end
