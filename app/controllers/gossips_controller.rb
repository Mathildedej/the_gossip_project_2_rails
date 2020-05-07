class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def new
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comments = Comment.all.where(gossip_id: params[:id]).order("created_at DESC")
    @comment = Comment.new(gossip: @gossip, user: User.find(@gossip.user.id), content: "")
  end

  def create
    @gossip = Gossip.new(title: params['gossip_title'], content: params['gossip_content'], user: User.find_by(first_name: 'anonymous')) # avec xxx qui sont les données obtenues à partir du formulaire
    if @gossip.save # essaie de sauvegarder en base @gossip
      flash[:success] =  "Yes ton potin à bien été crée !"
      redirect_to action: "index"
    else
      flash.now[:error] =  "Champs invalides"
      render :new  #sinon, il render la view new (qui est celle sur laquelle on est déjà)  
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    # ou: params_potin = params.require(:gossip).permit(:title, :content)
    # et: if @gossip.update(params_potin, user:....)
    if @gossip.update(title: params[:gossip][:title], content: params[:gossip][:content], user: User.find_by(first_name: 'anonymous'))
      flash[:notice] =  "Le potin à bien été edité !"
      redirect_to action: "show", id: (params[:id])
    else
      flash.now[:error] =  "Champs invalides"
      render :edit
    end
  end

  def destroy
    goss = Gossip.find(params[:id])
    goss.destroy
    flash[:alert] =  "Le potin a été supprimé :o"
    redirect_to action: "index"
  end

end
