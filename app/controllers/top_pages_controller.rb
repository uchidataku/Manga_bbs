class TopPagesController < ApplicationController
	def home
		@posts = Post.all
	end
	
	def show
		@user = User.find(params[:id])
	end
end
