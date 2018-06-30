class HomeController < ApplicationController
  def index
    @posts = Post.all
    @postnum = Post.count
    @usernum = User.count
    @singers = Singer.all.includes(:albums)
    # @albums = Album.all
    # @members = Member.all
    @search =Search.new
    @ranking = rank
  end
  
  def rank
    a = []
    Ranking.each do |rank|
      a.push(rank)
    end
    sort(a)
    b = []
    for i in 0..5
      b.push(a[i])
    end
    @ranking = b
    return @ranking
  end

  
  def new
  end
  #jisu
  
  def create
    post = Post.new
    post.singer = params[:input_singer]
    post.album = params[:input_album]
    post.had_card = params[:input_had_card]
    post.want_card = params[:input_want_card]
    post.change_type = params[:input_change_type]
    post.kakao_id = params[:input_kakao_id]
    post.user_id = params[:user_id]
    post.image = params[:input_image]
    post.save
    
    findrank = Ranking.find_by_singer_member(post.want_card)
    if findrank == nil
      newrank = Ranking.new
      newrank.singer_member = post.want_card
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
  
  def edit
    post = Post.find(params[:post_id])
    post.singer = params[:input_singer]
    post.album = params[:input_album]
    post.had_card = params[:input_had_card]
    post.want_card = params[:input_want_card]
    post.change_type = params[:input_change_type]
    post.kakao_id = params[:input_kakao_id]
    post.user_id = params[:user_id]
    post.image = params[:input_image]
    post.save
    
    redirect_to '/'
    # 경로 지정: 카드 게시물 페이지로
  end
  
  def delete
    post = Post.find(params[:post_id])
    post.destroy
    redirect_to '/'
      # 경로 지정: 카드 목록 페이지로
  end
  
  def search
    @find_post = Post.new
    @find_post.singer = params[:input_singer]
    @find_post.album = params[:input_album]
    @find_post.want_card = params[:input_had_card]
    @find_post.had_card = params[:input_want_card]
    
    @wantpeoplenum = Post.find_by_want_card(params[:input_had_card]).count
    @needpeoplenum = Post.find_by_had_card(params[:input_want_card]).count
    
    @matched_post = []
    Post.each do |post|
      if post.singer == params[:input_singer] && post.album == params[:input_album] && post.want_card == params[:input_had_card] && post.had_card == params[:input_want_card]
        @matched_post.push(post)
      end
    end

  end

  # def singerselect
  #   singer = params[:input_singer]
  #   @album = Album.find_by singer_id: singer_id
  #   respond_to do |format|
  #     format.json {render json: @album}
  #   end
  # end
end
