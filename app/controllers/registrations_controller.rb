class RegistrationsController < Devise::RegistrationsController
 def new
    super
  end

  def create
    # add custom create logic here
    user = User.new(user_params)
    if user.save
      # send_otp(user.mobile,user.name, user.otp, user)
      redirect_to authenticated_root_path
          else
      unless params[:user][:password] == params[:user][:password_confirmation]
        flash[:danger] = "Password and Password Confirmation must be same."
        redirect_to new_user_registration_path(user: { name: params[:user][:name], mobile: params[:user][:mobile],email: params[:user][:email],postal_code: params[:user][:postal_code],salesman_mobile: params[:user][:salesman_mobile]})
      else
        flash[:danger] = "Mobile, Email should be unique and valid"
        redirect_to new_user_registration_path(user: { name: params[:user][:name], password: params[:user][:password],password_confirmation: params[:user][:password_confirmation],postal_code: params[:user][:postal_code],salesman_mobile: params[:user][:salesman_mobile]})
      end
    end
  end

  def update
    super
  end
   def user_params
    user_params = params.require(:user).permit( :email, :password, :password_confirmation, :role)
  end
end
