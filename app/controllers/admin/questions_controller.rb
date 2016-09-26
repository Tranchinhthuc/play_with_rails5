class Admin::QuestionsController < Admin::Base
  def update
    question = Question.find params[:id]
    question.update_attributes(approved_status: params[:approved_status].to_sym)
    redirect_to :back
  end
end
