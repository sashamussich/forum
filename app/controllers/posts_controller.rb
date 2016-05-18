class PostsController < ApplicationController

	before_action :create_post_object, only: [:new]
	before_action :fetch_post, only: [:show, :edit, :update, :destroy]

	def index 
		@posts = Post.all.order "created_at DESC"
	end

	def new 
	end

	def create 
		create_post_object post_params

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update post_params
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

	def create_post_object post_params=nil
		@post = Post.new post_params
	end

	def fetch_post
		@post = Post.find(params[:id])
	end
end
