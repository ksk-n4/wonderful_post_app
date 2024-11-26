class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :set_article, only: %i[ edit update destroy ]

  # GET /articles
  def index
    @articles = Article.all.page(params[:page]).per(10)
  end

  # GET /articles/1
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article, notice: "#{t('activerecord.models.article')}を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
      if @article.update(article_params)
        redirect_to @article, notice: "#{t('activerecord.models.article')}を編集しました。"
      else
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
      redirect_to articles_url, notice: "#{t('activerecord.models.article')}を削除しました。"
  end

  private
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content)
    end
end
