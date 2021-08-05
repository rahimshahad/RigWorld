class SessionsController < ApplicationController

    def destroy
        session.clear
        redirect_to root_path
    end


    def create
        company = Company.find_by(email: params[:company][:email].downcase)
        if company && company.authenticate(params[:company][:password])
            session[:company_id] = company.id
           redirect_to  company_path(company)
        else
            flash[:message] = 'Invalid email/password combination'
            redirect_to '/login'
        end
    end
end
