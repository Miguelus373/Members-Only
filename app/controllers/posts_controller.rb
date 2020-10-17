class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :signed_in_only!, only: [:new, :create]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show; end

  # GET /posts/new
  def new
    @post = current_member.posts.build
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  def create
    @post = current_member.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to root_path, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end
  
  # Used to redirect a create a member session if signed in
  def signed_in_only!
    redirect_to new_member_session_path unless signed_in?
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
