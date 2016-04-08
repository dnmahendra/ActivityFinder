Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["FB_APP_ID"], ENV["FB_APP_SECRET"], :scope =>'public_profile,user_about_me,user_birthday',
   info_fields: 'id,name,email,age_range,locale,gender'
end