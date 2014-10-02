class FeedbackController < ApplicationController

  def index
    @feedback = Yoolk::Form::Feedback.new
  end

  def create
    @feedback = Yoolk::Form::Feedback.new(feedback_params)

    if @feedback.valid?
      redirect_to feedback_index_path, notice: 'Thank you for submitting your feedback.'
    else
      render :index
    end
  end

  private

    def feedback_params
      params.require(:feedback).permit(:name, :sender, :body)
    end
end