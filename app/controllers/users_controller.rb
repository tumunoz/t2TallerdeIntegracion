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
    if params[:id]
      render status: 400, json: { error: "id no es modificable" }
    else
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
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
      params.require(:user).permit(:usuario, :nombre, :apellido, :twitter)
    end
    
end
