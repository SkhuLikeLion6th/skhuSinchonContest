class HomeController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
    @posts = Post.all
    @postnum = Post.count
    @usernum = User.count
    @singers = Singer.all.includes(:albums)
    # @albums = Album.all
    # @members = Member.all
    @search =Search.new
    @ranking = Ranking.order("-needcount").limit(5)
    @post = Post.new
    @postrandom = Post.all.sample(3)
    @singernum = Singer.count
    @albumnum = Album.count
  end
  
  def mypost
    # @posts = Post.find(params[:user_id])
    @posts = Post.where(user_id: params[:user_id])
  end
  
  def readall
    @posts = Post.all
  end

  
  def new
  end
  #jisu
  
  def create
    @post = Post.new
    @post.singer = Singer.find(params[:post][:singer]).singer_name
    @post.album = Album.find(params[:post][:album]).album_name
    @post.had_card = Member.find(params[:post][:had_card]).member_name
    @post.want_card = Member.find(params[:post][:want_card]).member_name
    @post.change_type = params[:post][:change_type]
    @post.kakaoId = params[:post][:kakaoId]
    @post.user_id = params[:post][:user_id]
    # @post.image = params[:input_image]
    uploader = ImageUploader.new
    uploader.store!(params[:image])
    @post.image = uploader
    @post.save
    

    
    findrank = Ranking.find_by_singer_member(@post.want_card)
    if findrank == nil
      newrank = Ranking.new
      newrank.singer_member = @post.want_card
      newrank.needcount = 1
      newrank.save
    else
      findrank.needcount = findrank.needcount+1
      findrank.save
    end
    
    redirect_to '/'
    # 경로 지정: 카드 목록 페이지로
  end
  
  def update
    @post = Post.find(params[:post_id])
  end
  
  # def edit
  #   post = Post.find(params[:post_id])
  #   post.singer = params[:input_singer]
  #   post.album = params[:input_album]
  #   post.had_card = params[:input_had_card]
  #   post.want_card = params[:input_want_card]
  #   post.change_type = params[:input_change_type]
  #   post.kakao_id = params[:input_kakao_id]
  #   post.user_id = params[:user_id]
  #   post.image = params[:input_image]
  #   post.save
    
  #   redirect_to '/'
  #   # 경로 지정: 카드 게시물 페이지로
  # end
  
  # def delete
  #   post = Post.find(params[:post_id])
  #   post.destroy
  #   redirect_to '/'
  #     # 경로 지정: 카드 목록 페이지로
  # end
  
  def search
    @find_singer = Singer.find(params[:search][:singer]).singer_name
    @find_album = Album.find(params[:search][:album]).album_name
    @find_name = Member.find(params[:search][:had_card]).member_name
    @want_name = Member.find(params[:search][:want_card]).member_name
    
    @wantpeoplenum = Post.where(had_card: @want_name).count
    @needpeoplenum = Post.where(want_card: @find_name).count
    
    @matched_post = []
    postlist = Post.all
    postlist.each do |post|
      if post.singer == @find_singer && post.album == @find_album && post.want_card == @find_name && post.had_card == @want_name
        @matched_post.push(post)
      end
    end

  end
  
  def destroy
    post = Post.find(params[:post_id])
    wantrank = Ranking.find_by_singer_member(post.want_card)
    if wantrank.needcount != 0
      wantrank.needcount = wantrank.needcount-1
      wantrank.save
    end
    post.destroy
    
    redirect_to :back
  end

  # def singerselect
  #   singer = params[:input_singer]
  #   @album = Album.find_by singer_id: singer_id
  #   respond_to do |format|
  #     format.json {render json: @album}
  #   end
  # end
end
