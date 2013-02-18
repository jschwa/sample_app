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
end
