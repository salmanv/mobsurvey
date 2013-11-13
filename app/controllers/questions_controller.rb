class QuestionsController < ApplicationController


#loading a question from the databse by its ID. The choices for the question are stored in an instance variable for later access in our views
def show
	@question = Question.find(params[:id])
	@chocies = @question.choices

end


# The answer action inside this questions controller takes a user's response to the questions and stores it in the database

# an answer is simply a combination of a questions ID and a chioce ID
def answer
	@choice = Choice.find(:first, :conditions => {:id => params[:id]})
	@answer = Answer.create(:question_id => @choice.question_id, :choice_id => @choice.id)
#In the above code, we find the choice int he databse by its id. we then are creating an answer object that is comprised of the questios_id
#and the ID we get from the choice object. 

		if Question.last == @choice.question
			render :action => "Thank You"
		else
			question = Question.find(:first, :conditions => {:position => (@choice.question.position + 1)})
			redirect_to question_path(:id => question.id)
		end
	end

	#After a user answers a question, and if it is the last question that we have stored in the DB (retrieved with Question.last)
	#we render the 'thank you' view. Else, if not the last question then we are going to find the eqution with a postion of the current quetsions position 
	#Plus 1 --> then we will redirect to the show action for that quesiton with the RESTful rails helper method of questions_path

