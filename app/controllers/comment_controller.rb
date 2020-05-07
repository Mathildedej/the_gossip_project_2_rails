class CommentController < ApplicationController

  def index
   @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    gossip = Gossip.find(params[:gossip])
    @comment = Comment.new(gossip: gossip,user: User.last,content: params[:content])
    puts @comment
    if @comment.save 
      flash[:success] =  "Yes ton commentaire à bien été crée !"
      redirect_to gossip_path(id: Gossip.find(gossip.id))
    else
      flash[:error] =  "Commentaire invalide, minimum 10 characters"
      redirect_to gossip_path(id: Gossip.find(gossip.id))  #sinon, il render la view new (qui est celle sur laquelle on est déjà)  
    end
  end


  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(params)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end
end
