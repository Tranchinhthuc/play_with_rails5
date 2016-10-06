class Admin::QuestionsController < Admin::Base
  def update
    question = Question.find params[:id]
    question.update_attributes(approved_status: params[:approved_status].to_sym)
    redirect_to :back
  end

  def import
    if request.method_symbol == :post
      if params[:question][:type].present?
        if params[:question][:files].present?
          FileHandling.new.import_questions params
          flash[:notice] = "Imported"
          redirect_to Rails.application.routes.url_helpers.send("admin_#{params[:question][:type].pluralize}_path")
        else
          flash[:alert] = "Please choose files"
          render :import
        end
      else
        flash[:alert] = "Please choose question type"
        render :import
      end
    end
  end
end
