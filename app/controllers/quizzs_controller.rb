class QuizzsController < ApplicationController
protect_from_forgery
 

  # GET /quizzs
  # GET /quizzs.json
  def index
    @quizzs = Quizz.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quizzs }
    end
  end

  # GET /quizzs/1
  # GET /quizzs/1.json
  def show
    @quizz = Quizz.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quizz }
    end
  end

  # GET /quizzs/new
  # GET /quizzs/new.json
  def new
    @quizz = Quizz.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quizz }
    end
  end

  # GET /quizzs/1/edit
  def edit
    @quizz = Quizz.find(params[:id])
  end

  # POST /quizzs
  # POST /quizzs.json
  def create
    @quizz = Quizz.new(params[:quizz])

    respond_to do |format|
      if @quizz.save
        format.html { redirect_to @quizz, alert: 'Quizz was successfully created.' }
        format.json { render json: @quizz, status: :created, location: @quizz }
      else
        format.html { render action: "new_quizz" }
        format.json { render json: @quizz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quizzs/1
  # PUT /quizzs/1.json
  def update
   @quizz = Quizz.find(params[:quizz][:id])

    @quizz.update_attributes(params[:quizz])
    flash[:alert] = "Quizz was successfully Updated"
    redirect_to(:back)
  end

  # DELETE /quizzs/1
  # DELETE /quizzs/1.json
  def destroy
    @quizz = Quizz.find(params[:id])
    @quizz.destroy

    flash[:notice] = "You deleted the question successfully."
    redirect_to(:back)
  end
# GET /quizzs/answerwing/1

def questions
@quizzs = Quizz.all
end


# GET /quizzs/answer/1
def answer
@quizz = Quizz.find(params[:id]) 
end

# PUT /quizzs/questions/1
# PUT /quizzs/questions/1.xml
def check
  @quizz = Quizz.find(params[:id])
  @user = User.find(session[:user_id])
   $i = Result.where(" userid= ? AND questionid = ?", @user.username, @quizz.id).count
   if $i == 0
     @result = Result.create(userid: @user.username, questionid: @quizz.id, status: "Y") 
     @user.exam_attempted
      if @quizz.correctAns == params[:correctAns]
        @user.right_answer
      end
      redirect_to :questions
  else
      flash.now[:error] = 'You have already answered this question!! Go for next question' 
      render :answer
 end
  
end


def percentage
 if session[:user_id] == nil
  redirect_to :root
 else
 @user = User.find(session[:user_id])
 @total = Quizz.all.size
 $i = Result.where(" userid= ?",@user.username).count
 if $i > 0
    @finalgrade = (@user.count * 100) / @total 
    @user.update_attribute :count,@finalgrade
    render :results, :locals => {:user => @user.username, :percent => @finalgrade}
  else
    flash.now[:alert] = "Please answer atleast 1 Question"
    redirect_to :questions
  end
    session[:user_id] = nil
  end
end


end

