class RigsController < ApplicationController
before_action :redirect_if_not_logged_in
    def index 
        if params[:company_id] && @company = Company.find_by_id(params[:company_id])
            @rigs = @company.rigs
        else
            @error = "Company not found" if params[:company_id]
            @rigs = Rig.all
        end
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
        @rig = Rig.find_by_id(params[:id])
        redirect_to rigs_path if !@rig || @rig.company != current_user
    end 

    def update 
        @rig = Rig.find_by_id(params[:id])
        redirect_to rigs_path if !@rig || @rig.company != current_user
        if @rig.update(rig_params)
            redirect_to rig_path(@rig)
        else 
            render :edit 
        end
    end 

    def destroy 
        @rig = Rig.find(params[:id])
        @rig.destroy
        flash[:message] = "RIP #{@rig.name}!"
        redirect_to rigs_path
    end

    def deepest
        @deepest_rig = Rig.deepest
    end

    private 

        def rig_params
        params.require(:rig).permit(:name, :type, :max_depth, :min_depth, :location, :classification)
        end
end
