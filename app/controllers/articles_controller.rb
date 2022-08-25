class ArticlesController < ApplicationController
  def index
    @article =  Article.all
    @article = Article.paginate(:page => params[:page], :per_page => 3)
  end


  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_parmas)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
     @article = Article.find(params[:id])
      if @article.update(article_parmas)
        redirect_to root_path
     else
        render :edit
     end    
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
       redirect_to root_path
    end  
  end
  
  private
  def article_parmas
   params.require(:article).permit(:title,:description,:avatar, :user_id)
  end

end
