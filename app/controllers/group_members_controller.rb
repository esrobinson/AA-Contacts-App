class GroupMembersController < ApplicationController

  def index
    @members = Group.find(params[:id]).contacts
    render :json => @members
  end

  def create
    @member = GroupMember.new(params[:group_member])
    if @member.save(params[:group_member])
      render :json => @member
    else
      render :json => @member.error, :status => 418
    end
  end

  def destroy
    @member = GroupMember.find(params[:id])
    @member.delete
    head :ok
  end


end
