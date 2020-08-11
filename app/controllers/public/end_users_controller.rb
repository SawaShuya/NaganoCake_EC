class Public::EndUsersController < Public::Base
  def show
  	@my_data = EndUser.find(current_end_user.id)
  end

  def edit
  	@my_data = EndUser.find(current_end_user.id)
  end


  def update
  	@my_data = EndUser.find(current_end_user.id)
  	if @my_data.update(end_user_params)
  		flash[:notice] = "edit my data successfly"
  		redirect_to my_page_path
  	else
  		render "edit"
  	end
  end


  def unsubscribe
  end

  def withdrawal_process
    @my_data = EndUser.find(current_end_user.id)
    if @my_data.update(is_unsubscribe: true)
        reset_session
        flash[:notice] = "unsubscribe succesfully"
        redirect_to root_path
    else
      flash[:notice] = "cannot unsubscribe"
      redirect_to my_page_path
    end
  end



  private
  def end_user_params
  	params.require(:end_user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :telephone_number, :email)
  end


end
