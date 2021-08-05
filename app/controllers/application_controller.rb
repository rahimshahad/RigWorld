class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?


    private

        def current_user
            @current_user ||= Company.find_by_id(session[:company_id]) if session[:company_id]
        end

        def logged_in?
            !!session[:company_id]
        end

        def redirect_if_not_logged_in
            redirect_to '/' if !logged_in?
        end
end
