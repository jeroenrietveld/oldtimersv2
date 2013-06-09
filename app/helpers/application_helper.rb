module ApplicationHelper
	def create_hidden_label_field(name, f, association)
	  new_object = f.object.class.reflect_on_association(association).klass.new

		fields = f.fields_for(association, new_object, :child_index => "hidden_label") do |builder|
			render("forms/hidden_label_field", :f => builder)
		end
		a = escape_javascript(fields)

		link_to_function(name, "test(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
	end

	def fetch_latest_questions
		@questions = Question.find(:all, :order => "created_at DESC", :limit => 5)
	end
end
