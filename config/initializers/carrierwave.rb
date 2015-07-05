# config/initializers/carrierwave.rb
 
CarrierWave.configure do |config|
	config.storage = :aws
	config.aws_bucket = ENV["AWS_BUCKET"]
	config.aws_acl = :public_read

  config.aws_credentials = {                        # required
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY"],                        # required
    :aws_secret_access_key  => ENV["AWS_SECRET_KEY"]                         # required
  }
                       # required
end