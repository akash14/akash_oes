module ApplicationHelper
	def full_title(page_title)
		base_title = "Online Exam - the place you want to kill yourself."
		if page_title.empty?
			base_title
		else 
			"#{base_title} | #{page_title}"
		end
	end

  def show_field_error(model, field)
    s=""

    if !model.errors[field].empty?
      s =
        <<-EOHTML
           <div id="error_message">
             #{model.errors[field][0]}
           </div>
        EOHTML
    end

    s.html_safe
  end

end
