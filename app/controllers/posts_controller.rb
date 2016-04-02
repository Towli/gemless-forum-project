class PostsController < ApplicationController

def index
	@posts = Post.all
end

def show
	@post = Post.find(params[:id])
end

def new
	@post = Post.new
end

def destroy
	@post = Post.find(params[:id])
	@post.destroy
	redirect_to root_path
end

def create
	@post = Post.new(post_params)
	if @post.save
		flash[:success] = 'Post successfully created'
		redirect_to @post
	else
		flash[:failure] = 'Failed to create post, please try again'
		render 'new'
	end
end

private

def post_params
	params.require(:post).permit(:title, :content)
end

end
