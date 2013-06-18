class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    params[:question][:categories].each do |p|
      unless p.empty?
        c = Category.find(p)
        @question.categories << c if c
      end
    end

    params[:question][:labels_attributes].each do |p|
      title = p[1][:title]
      unless title.empty?
        l = Label.create(:title => title)
        @question.labels << l if l
      end
    end

    @question.user = current_user

    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      @question.labels.build
      render template: 'general_pages/home'
    end
  end

  # PATCH/PUT /questions/1
  def update
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @question = Question.find(params[:id])
    @question.answers << @answer

    if @question.save
      redirect_to @question
    else
      render 'show'
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:title, :description)
    end

    def answer_params
      params.require(:question).require(:answers).permit(:description)
    end
end
