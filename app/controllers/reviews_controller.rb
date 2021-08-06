class ReviewsController < ApplicationController

    before_action :redirect_if_not_logged_in
    before_action :set_review, only: [:show, :edit, :update]
    before_action :redirect_if_unauthorized, only: [:edit, :update]
    
    def index
        if params[:rig_id] && @rig = Rig.find_by_id(params[:rig_id])
            @reviews = @rig.reviews
        else
            @error = "Rig not found" if params[:rig_id]
            @reviews = Review.all
        end
    end

    def new
        if params[:rig_id] && @rig = Rig.find_by_id(params[:rig_id])
            @review = @rig.reviews.build
        else
            @error = "Rig doesn't exist" if params[:rig_id]
            @review = Review.new
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
        set_review
    end

    def edit
        set_review
        redirect_to reviews_path if !@review || @review.company != current_user
    end

    def update
        set_review
        if @review.update(review_params)
            redirect_to review_path(@review)
        else
            render :edit
        end
    end
    
    private 


    def review_params
        params.require(:review).permit(:content, :rig_id)
    end

    def set_review
        @review = Review.find_by(id: params[:id])
        if !@review 
            flash[:message] = "Review was not found"
            redirect_to reviews_path
        end
    end

    def redirect_if_unauthorized
        redirect_to reviews_path if @review.company != current_user
    end

end
