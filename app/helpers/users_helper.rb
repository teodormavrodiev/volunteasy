module UsersHelper
  def avatar_for_user(user)
    if user.has_photo?
      user.photo.fullpath
    else
      'http://www.oldpotterybarn.co.uk/wp-content/uploads/2015/06/default-medium.png'
    end
  end
end
