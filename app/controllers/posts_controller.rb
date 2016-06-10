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
	@discussion = @post.discussion

	destroy_child_posts @post

	if @post.destroy
		flash[:success] = 'Post successfully deleted.'
	else
		flash[:failure] = 'Failed to delete post, please try again.'
	end
	redirect_to @discussion
end

def create
	@post = Post.new(post_params_with_discussion_id)
	if @post.save
		flash[:success] = 'Post successfully created'
		redirect_to @discussion = Discussion.find(params[:discussion_id])
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

def post_params_with_discussion_id
	post_params_with_current_user.merge(discussion_id: params[:discussion_id])
end

def post_has_replies?(post)
	post.replies.any?
end

def destroy_child_posts(post)
	if post_has_replies? @post
		post.replies.each do |reply|
			if post_has_replies? reply
				destroy_child_posts(reply)
			end
		reply.destroy
		end
	end
end

end
