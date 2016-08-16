class User < ActiveRecord::Base
	def self.from_omniauth(auth)
	  user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)
	  user.provider = auth["provider"]
	  user.uid = auth["uid"]
	  user.name = auth["info"]["name"]
	  user.location = auth["info"]["location"]
	  user.image_url = auth["info"]["image"].sub("_normal", "")
	  user.url = auth["info"]["urls"]["Twitter"]

	  user.save
	  user
	end

	acts_as_voter
end