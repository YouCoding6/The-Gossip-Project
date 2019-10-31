class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  
  end

  def new
  	@user = User.new
  end
  
  def create

    my_city = City.create(name:"undefined")

  	@user = User.new(email: params["email"],password: params["password"],city_id: my_city.id)

  	if @user.save # essaie de sauvegarder en base @user
      flash[:notice] = "User successfully created"
      redirect_to root_path# si ça marche, il redirige vers la page d'index du site
    else
      flash[:notice] = "User creation failed"
      redirect_to new_user_path 
    end

  end	

end
