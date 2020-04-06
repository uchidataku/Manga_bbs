class TopPagesController < ApplicationController
	def home
		@posts = Post.all
	end
end
