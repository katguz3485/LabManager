module UserHelperHelper

  def avatar_path(avatar)
    avatar || image_path('labManagerLogo.png')
  end


end