class Authorization < ActiveRecord::Base
  belongs_to :user

  validates :provider, :uid, :presence => true

  
  def self.find_or_create(auth_hash)
    unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      user = User.create :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"],
             :password => auth_hash.extra.raw_info.id, :avatar => auth_hash["info"]["image"],
              :location => auth_hash.extra.raw_info.locale, :age => auth_hash.extra.raw_info.age_range["min"],
              :gender => auth_hash.extra.raw_info.gender
      auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end
 
    auth
  end
end
