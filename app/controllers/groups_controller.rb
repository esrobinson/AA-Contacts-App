class GroupsController < ApplicationController
  def index
    @groups = Group.where(:user_id => params[:user_id])
    render :json => @groups
  end

  def create
    @group = Group.new(params[:group])
    if @group.save
      render :json => @group
    else
      render :json => @group.error, :status => 418
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      render :json => @group
    else
      render :json => @group.error, :status => 418
    end
  end

  def show
    @group = Group.find(params[:id])
    render :json => @group
  end

  def destroy
    @group = Group.find(params[:id])
    @group.delete
    head :ok
  end
end
