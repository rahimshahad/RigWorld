class CompaniesController < ApplicationController

    def new 
        @company = Company.new
    end


    def create 
        @company = Company.create(comp_params)
        redirect_to company_path(@company)
    end

    def show 
        @company = Company.find_by_id(params[:id])
    end 



    private
    def comp_params
        params.require(:company).permit(:name, :email, :password)
    end

end
