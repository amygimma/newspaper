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
  
  def random
    count = Article.count()
  
    @article = nil
    until not @article.nil?
      begin
        random_number= rand(0..count)
        @article = Article.find(random_number)
      rescue =>e
        puts e.message
      end
    end 
      
  end
  
  def search_post
    @search_term = params["search_term"]
    
    @article = Article.find_by title: @search_term
  end
  
  def author_return
    @author_search_term = params["author_search_term"]
    #@articles = Article.find_by author: @author_search_term
    @articles = Article.where("author = ?", params["author_search_term"])
  end
  
  private
    def post_params
      params.require(:article).permit(:title, :author, :location, :contact, :body)
    end
end
