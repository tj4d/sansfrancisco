class Publication < ActiveRecord::Base
	acts_as_votable
	acts_as_taggable
end
