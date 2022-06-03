ContentfulRails.configure do |config|
  config.access_token = ENV['CONTENTFUL_DELIVERY_ACCESS_TOKEN']
  config.preview_access_token = ENV['CONTENTFUL_PREVIEW_ACCESS_TOKEN']
  config.space = ENV['CONTENTFUL_SPACE_ID']
  config.eager_load_entry_mapping = false
end
