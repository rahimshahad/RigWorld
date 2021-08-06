class RigsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index 
        @rigs = Rig.all
    end

    def new 
        @rig = Rig.new
    end

    def create 
        @rig = .rigs.build(rig_params)
        if @rig.save
          redirect_to rig_path(@rig)
        else
            render :new
        end  
    end 

    def edit 
    end

    def update 
    end

    def delete
    end

    private 

    def rig_params
        params.require(:rig).permit(:name, :max_depth, :min_depth, :description)
    end
end
