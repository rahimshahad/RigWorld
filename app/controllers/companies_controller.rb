class CompaniesController < ApplicationController

   
    def new 
        @company = Company.new
    end


    def create 
        @company = Company.new(comp_params)
        if @company.save
            session[:company_id] = @company.id
             redirect_to company_path(@company)
        else
            render :new
        end
    end

    def show 
        redirect_if_not_logged_in
        @company = Company.find_by_id(params[:id])
        redirect_to '/' if !@company
    end 



    private
    def comp_params
        params.require(:company).permit(:name, :email, :password)
    end

end
