class GossipsController < ApplicationController
  def index
  end
  def new
  end
  def show
  end
  def create
    @gossip = Gossip.new(title: params['gossip_title'], content: params['gossip_content'], user: User.find_by(first_name: 'anonymous')) # avec xxx qui sont les données obtenues à partir du formulaire
    if @gossip.save # essaie de sauvegarder en base @gossip
      id_gossip = Gossip.last.id
      #redirect_to "/gossips/#{id_gossip}", notice: "Yes ton potin à bien été crée !" # si ça marche, il redirige vers la page d'index du site
      flash.now[:notice] =  "Yes ton potin à bien été crée !"
      render :index
    else
      flash.now[:error] =  "Champs invalides"
      render :new  #sinon, il render la view new (qui est celle sur laquelle on est déjà)  
    end
  end
  
end
