class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_enrolled_for_current_lesson

	def show

	end

	private

	def require_enrolled_for_current_lesson
		current_course = current_lesson.section.course
		if current_user && current_user.enrolled_in?(current_course) != true
			redirect_to course_path, :alert => "You must enroll to view this lesson."
		end
	end

	helper_method :current_lesson
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end
end
