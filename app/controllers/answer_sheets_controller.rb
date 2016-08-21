class AnswerSheetsController < ApplicationController
  include StandardActions
  load_and_authorize_resource

  def index
    @answer_sheets = current_user.answer_sheets
  end

  def show
    standard_show
    @examination = @answer_sheet.examination
    @questions = (@answer_sheet.answer_sheet_type == "listening") ? @examination.listening.questions : @examination.reading.questions
    @questions_by_part = questions_by_part @questions, @answer_sheet.answer_sheet_type
  end

  def new
    @examination = Examination.find params[:examination_id]
    @questions = (params[:answer_sheet_type] == "listening") ? @examination.listening.questions : @examination.reading.questions
    @questions_by_part = questions_by_part @questions, params[:answer_sheet_type]
    standard_new
  end

  def create
    @examination = Examination.find params[:examination_id]
    @answer_sheet = @examination.answer_sheets.build permit_params
    @answer_sheet.examinee = current_user
    if @answer_sheet.save
      redirect_to answer_sheet_path(@answer_sheet)
    else
      @questions = (answer_sheet.answer_sheet_type == "listening") ? @examination.listening.questions : @examination.reading.questions
      @questions_by_part = questions_by_part @questions, answer_sheet.answer_sheet_type
      render "new"
    end
  end

  private
  def permit_params
    params.fetch(:answer_sheet, {}).permit(:answer_sheet_type, answers_attributes: [:id, :option_id])
  end

  def questions_by_part questions, answer_sheet_type
    if answer_sheet_type == "listening"
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
  end
end
