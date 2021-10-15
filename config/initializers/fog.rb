require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|

    config.fog_credentials = {
      provider:              'AWS',                            # required
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],            # required
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],            # required
      region:                'sa-east-1', 
    }
    config.fog_directory = ENV["AWS_BUCKET"]                   # required
    config.fog_public    = false     # To let CarrierWave work on Heroku
    if Rails.env.production? 
      config.fog_directory = ENV["PRODUCTION_S3_BUCKET"] 
    else config.fog_directory = ENV["DEVELOPMENT_S3_BUCKET"] 
    end
  end