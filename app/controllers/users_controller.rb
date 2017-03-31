class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    @total = @users.count
    @users = User.all.select(:id, :nombre, :apellido, :usuario, :twitter)
    render json: {:usuarios => @users, :total => @total}
  end

  # GET /users/1
  def show
    render json: @user, :except => [:created_at, :updated_at]
  end

  # POST /users
  def create
    if params[:id]
     render status: 400, json: { error: "No se puede crear usuario con id" }
    else 
      @user = User.new(user_params)
      if @user.save
       render status: 201
      else
        render status:500, json: {error: "La creacion ha fallado"}
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    update_params = update_params_with_id
    
    if update_params.count > 2
      render status: 500, json: { error: "La modificacion ha fallado" }
      return
    end
    
    if update_params[:id] != @user.id
      render status: 400, json: { error: "id no es modificable" }
    else
      if @user.update(update_params)
        render status: 200
      else
        render status: 500, json: { error: "La modificacion ha fallado" }
      end
    end
  
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:id, :usuario, :nombre, :apellido, :twitter)
    end
    
    def update_params_with_id
      update_params = user_params
      unless update_params[:id]
        update_params[:id] = @user.id
      end
      update_params
    end
    
end
