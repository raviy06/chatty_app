class RoomsController < ApplicationController

  before_filter :current_user


  def index
  	@rooms = Room.all
  end

  def new
  	@room = Room.new
  end

  def create
  	@room = @current_user.rooms.build(room_params)
  	if @room.save
  		flash[:notice] = 'New Chat room created.'
  		redirect_to room_path(@room)
  	else
  		render :new
  	end
  end

  def show
	  @room = Room.includes(:messages).find_by(id: params[:id])
    @message = Message.new
	end


  private

  def room_params
  	params.require(:room).permit(:name)
  end
end
