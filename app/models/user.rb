class User < ApplicationRecord
  def self.find_or_create_from_auth_hash(auth_hash)
  #providerはどのサービスで認証したのかを見分けるもの
   provider = auth_hash[:provider]
   uid = auth_hash[:uid]
   name = auth_hash[:info][:name]
   image_url = auth_hash[:info][:image]

   #find_or_create_by()は()の中の条件のものが見つければ取得し、なければ新しく作成するというメソッド
   self.find_or_create_by(provider: provider,uid: uid) do |user|
     user.username = name
     user.image_url = image_url
   end
  end
end
