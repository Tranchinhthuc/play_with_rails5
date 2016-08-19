class AnswerSheetsController < ApplicationController
  include StandardActions

  def index
    standard_index
  end

  def show
    standard_show
  end

  def new
    @examination = Examination.find params[:examination_id]
    @questions = (params[:answer_sheet_type] == "listening") ? @examination.listening.questions : @examination.reading.questions 
    if params[:answer_sheet_type] == "listening"
      @questions_by_part = {
        part_one: @questions.where(type: "PartOne"),
        part_two: @questions.where(type: "PartTwo"),
        part_three: @questions.where(type: "PartThree"),
        part_four: @questions.where(type: "PartFour")
      }
    else
      @questions_by_part = {
        part_five: @questions.where(type: "PartFive"),
        part_six: @questions.where(type: "PartSix"),
        part_seven_one: @questions.where(type: "PartSevenOne"),
        part_seven_two: @questions.where(type: "PartSevenTwo")
      }
    end
    standard_new
  end

  def create
    @examination = Examination.find params[:examination_id]
    @answer_sheet = @examination.answer_sheets.build permit_params
    byebug
    if @answer_sheet.save
      redirect_to answer_sheet_path(@answer_sheet)
    else
      @questions = (params[:answer_sheet_type] == "listening") ? @examination.listening.questions : @examination.reading.questions 
      render "new"
    end
  end

  private
  def permit_params
    params.fetch(:answer_sheet, {}).permit(answers_attributes: [:id, :option_id])
  end
end
