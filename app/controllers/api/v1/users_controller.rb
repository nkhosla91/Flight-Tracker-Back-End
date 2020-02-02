class Api::V1::UsersContoller < Application controller 

    def index 
        user = User.all
        render json: users
    end

  def show
      user = User.find(params[:id])
      render json: user
  end

  def create
      user = User.new(user_params)

      if user.save
        render json: user
      else
        render json: {errors: work.errors.full_messages}, status: 403
      end
      
  end


  private

  def user_params
    params.require(:user).permit( :first_name,:last_name,:username,:password :age, :gender, :home_city)
  end

end #end of Users Class 