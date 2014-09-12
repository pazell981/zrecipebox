module FriendsHelper

	def pending(user_id)
		@friends_pending = Friend.where("(friend_id = ? AND status = 'pending')", user_id).count
	end
	
end
