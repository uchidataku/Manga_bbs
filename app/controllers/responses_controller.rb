class ResponsesController < ApplicationController
  def create
    @response = Response.create(text: response_params[:text], 
                             post_id: response_params[:post_id], 
                             user_id: current_user.id)
    if @response.save
      flash[:success] = "投稿しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
    def response_params
      params.permit(:text, :post_id)
    end
end
