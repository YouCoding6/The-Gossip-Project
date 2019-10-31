class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:new,:create,:edit,:destroy]
 
  def index 

    @gossips = Gossip.all

  end

  
  def show
  
    @gossip = Gossip.find(params[:id])
  
  end  

  def edit
  
    @gossip = Gossip.find(params[:id])

  end

 


  def new
   
    @gossip = Gossip.new
   
  end 

  def create
    
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: 2) # avec xxx qui sont les données obtenues à partir du formulaire
    
    @gossip.user = current_user

    if @gossip.save # essaie de sauvegarder en base @gossip
       flash[:notice] = "Post successfully created"
       redirect_to gossips_path
    else
       flash[:notice] = "Post fail"
       redirect_to new_gossip_path
    end

  end  
  
  def update
    
    @gossip = Gossip.find(params[:id])
    
    gossip_params = params.require(:gossip).permit(:title, :content)

    @gossip.update(gossip_params)

      if @gossip.update(gossip_params)
      
        redirect_to gossips_path

      else
        render :edit
      
      end
  end    

    def destroy
    @gossip = Gossip.find(params[:id]) 
    @gossip.destroy
    redirect_to root_path
  end

    private

    def authenticate_user
        unless current_user
          flash[:notice] = "Connectez-vous afin de pouvoir ajouter ou editer un potin "
          redirect_to new_session_path
        end
    end
  end 

