class ContactSharesController < ApplicationController

  def create
    @contact_share = ContactShare.new(params[:contact_share])
    if @contact_share.save
      render :json => @contact_share
    else
      render :json => @contact_share.error, :status => 418
    end
  end

  def destroy
    @contact_share = ContactShare.find(params[:id])
    if @contact_share.delete
      head :ok
    else
      render :json => @contact_share.error, :status => 418
    end
  end

end
