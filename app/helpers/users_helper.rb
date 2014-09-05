module UsersHelper

	# Returns the Gravatar (http://gravatar.com/) for the given user.
	def gravatar_for(user, options = { size: 50 })
		if user.uid.nil? 
			gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
			size = options[:size]
			gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
			image_tag(gravatar_url, alt: user.name, class: "gravatar")		
		else
			gravatar_id = user.uid
			size = options[:size]
			gravatar_url = "http://graph.facebook.com/#{gravatar_id}/picture?type=square"
			image_tag(gravatar_url, alt: user.name, class: "gravatar")
		end

	end
end
