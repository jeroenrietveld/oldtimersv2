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

	def user_level(level)
		return Rank.find_by_level(level).name
	end

	def next_level(level)
		rank = Rank.find_by_level(level+1)

		unless rank == nil
			return rank.name
		end

		return "Max"
	end

	def level_progression(level, current_points)
		next_rank = Rank.find_by_level(level+1)

		unless next_rank == nil
			required_points = next_rank.required_points - current_points
			return 100 - ((required_points.to_f / next_rank.required_points.to_f) * 100).to_i
		end

		return "asd"
	end
end
