class ContactsController < ApplicationController
  def index
    @contacts = Contact.contacts_for_user_id(params[:user_id]).includes(:comments).where(:comments => {:user_id => params[:user_id]})
    # @contacts.map! do |contact|
    #   comment = contact.comments.where(:user_id => params[:user_id])
    #   {:contact => contact, :comment => comment}
    # end
    render :json => @contacts
  end

  def show
    @contact = Contact.find(params[:id])
    @comment = @contact.comments.where(:user_id => params[:user_id])

    render :json => {:contact => @contact, :comment => @comment}
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      render :json => @contact
    else
      render :json => @contact.error, :status => 418
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      render :json => @contact
    else
      render :json => @contact.error, :status => 418
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.delete
      head :ok
    else
      render :json => @contact.error, :status => 418
    end
  end

  def favorite
    @contacts = Contact.favorites_for_user_id(params[:user_id])
    render :json => @contacts
  end


end