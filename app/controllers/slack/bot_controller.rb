class Slack::BotController < ApplicationController
	def reply
		render json: "Hello World"
	end
end