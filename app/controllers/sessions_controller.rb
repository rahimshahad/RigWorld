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

    def google
        #find_or_create a company using the attributes auth
        @company = Company.find_or_create_by(email: auth["info"]["email"]) do |company|
          company.name = auth["info"]["first_name"]
          company.password = SecureRandom.hex(10)
        end
        if @company.save
          session[:company_id] = @company.id
          redirect_to company_path(@company)
        else
          redirect_to '/'
        end
      end
    
      private
    
      def auth
        request.env['omniauth.auth']
      end
end
