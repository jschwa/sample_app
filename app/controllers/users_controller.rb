class UsersController < ApplicationController


	def show
  		@user = User.find(params[:id])
	end

	def new
  		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:sucess] = "Welcome to the Sample App!"
			redirect_to @user
			#handle a succesful save.
		else
			render 'new'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User destroyed"
		redirect_to users_url
	end


	def index
  		@users = User.paginate(page: params[:page])
  	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "Profile updated"
			sign_in @user
			redirect_to @user
		else
			render 'edit'
		end
	end
end
