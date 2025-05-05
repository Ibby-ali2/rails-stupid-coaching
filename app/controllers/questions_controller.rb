class QuestionsController < ApplicationController
  def ask
  end

  def answer
    @answer = params[:answer].to_s
    @response = if @answer.downcase == "i am going to work"
                  "Great!"
                elsif @answer.end_with?("?")
                  "Silly question, get dressed and go to work!"
                else
                  "I don't care, get dressed and go to work!"
                end

    # Save conversation in session
    session[:conversations] ||= []
    session[:conversations] << { question: @answer, response: @response }
    session[:conversations] = session[:conversations].last(5) # Keep last 5 only

    @conversations = session[:conversations]
  end
end
