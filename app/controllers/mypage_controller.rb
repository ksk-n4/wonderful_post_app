class MypageController < ApplicationController
  # GET /mypage
  def show
    @articles = current_user.articles.page(params[:page]).per(10)
  end
end
