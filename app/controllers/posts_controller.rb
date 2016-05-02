class PostsController < ApplicationController

def index
	@posts = Post.all.reverse_order
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
	@discussion = Discussion.find(params[:discussion_id])
	@post = @discussion.posts.new(post_params)
	if @post.save
		flash[:success] = 'Post successfully created'
		redirect_to @discussion
	else
		flash[:failure] = 'Failed to create post, please try again'
		render 'new'
	end
end

private

def post_params
	params.require(:post).permit(:title, :content)
end

def post_params_with_current_user
	post_params.merge(user_id: current_user.id)
end

end
