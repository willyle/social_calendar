module ProfilesHelper
	def full_name
		if @profile.first_name.nil? || @profile.first_name == ""
			@profile.user.username
		elsif @profile.last_name.nil? || @profile.last_name == ""
			@profile.first_name
		else
			@profile.first_name + " " + @profile.last_name
		end
	end
end
