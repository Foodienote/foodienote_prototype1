module DateTimeModule
	# display time if date_created is within today (ex. 8:53 PM)
	# display date if date_created is in the past (ex. 2-15-2014)
	def comment_format(date_created)
		if date_created.nil?
			return ''
		end

		current_date = DateTime.now
		
		if current_date.midnight < date_created
			return date_created.strftime("%l:%M %p")
		else
			return date_created.strftime("%-m-%d-%Y")
		end
	end


end
