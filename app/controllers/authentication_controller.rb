class AuthenticationController < ApplicationController
  def sign_in
    @user = User.new
  end

  def login
    username_or_email = params[:user][:username]
    password = params[:user][:password]

    if username_or_email.rindex('@')
      email=username_or_email
      user = User.authenticate_by_email(email, password)
    else
      username=username_or_email
      user = User.authenticate_by_username(username, password)
    end

    if user
    session[:user_id] = user.id
    if(user.attempts == 0)
       flash[:notice] = "Hi! #{user.username}"
       redirect_to  :start
     else
        flash.now[:error] = "Hi! #{user.username}, You have already taken the exam."
       render :action => "sign_in"
   end
    else
     flash.now[:error] = 'Unknown user. Please check your username and password.'
    render :action => "sign_in"
end
end

def signed_out
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."
end

  def new_user
  @user = User.new
end

def register
  @user = User.new(params[:user])

  if @user.valid?
    @user.save
   # UserMailer.welcome_email(@user).deliver
    session[:user_id] = @user.id
    flash[:notice] = "Welcome..!!  #{@user.username}"
    redirect_to :root
  else
    render :action => "new_user"
  end
end

def all_user
 @users = User.all
 respond_to do |format|
    format.html # users_list.html.erb
    format.json { render json: @users }
  end
end

def exam_permissions
  @user = User.find(params[:id])
  @results = Result.where(:userid => @user.username)
  @results.delete_all
  @user.update_attribute :attempts, 0
  @user.update_attribute :count, 0
  
  flash.now[:notice] = "Permissions for Exam granted."
  redirect_to :all_user
end


def admin
    username = params[:admin][:username]
    password = params[:admin][:password] 
    admin = Admin.authenticate_by_username(username, password)
    if admin
    session[:admin_id] = admin.username
    redirect_to quizzs_path
    else
     flash.now[:error] = 'Unknown user. Please check your username and password.'
    render :action => "admin_in"
  end
end

end