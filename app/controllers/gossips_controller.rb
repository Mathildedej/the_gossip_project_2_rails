class GossipsController < ApplicationController
  def new
  end
  def create
    @gossip = Gossip.new(title: params['gossip_title'], content: params['gossip_content'], user: User.find_by(first_name: 'anonymous')) # avec xxx qui sont les données obtenues à partir du formulaire
    
    if @gossip.save # essaie de sauvegarder en base @gossip
      id_gossip = Gossip.last.id
      redirect_to "/gossip/#{id_gossip}", notice: "Yes ton potin à bien été crée !" # si ça marche, il redirige vers la page d'index du site
    else
      flash.now[:error] =  "Champs invalides"
      render :new #sinon, il render la view new (qui est celle sur laquelle on est déjà)  
    end
  end
end
