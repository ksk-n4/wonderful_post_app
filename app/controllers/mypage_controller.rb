class MypageController < ApplicationController
  # GET /mypage
  def index
    if params[:title].present?
      @articles = current_user.articles.where('title like ?', "%#{params[:title]}%").page(params[:page]).per(10)
    else
      @articles = current_user.articles.page(params[:page]).per(10)
    end
  end
end
