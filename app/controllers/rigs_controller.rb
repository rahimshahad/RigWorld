class RigsController < ApplicationController
before_action :redirect_if_not_logged_in
    def index 
        @rigs = Rig.all
    end 

    def new 
        @rig = Rig.new
    end 

    def create 
        @rig = current_user.rigs.build(rig_params)
        if @rig.save
          redirect_to rig_path(@rig)
        else 
            render :new
        end
    end

    def show 
        @rig = Rig.find_by_id(params[:id])
        redirect_to rigs_path if !@rig
    end 

    def edit 
    end 

    def update 
    end 

    def destroy 
    end

    private 

        def rig_params
        params.require(:rig).permit(:name, :type, :max_depth, :min_depth, :location, :classification)
        end
end
