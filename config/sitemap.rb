SitemapGenerator::Sitemap.default_host = 'https://mocamoca-lookbackapp.herokuapp.com'
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['AWS_BUCKET']}"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  ENV['AWS_BUCKET'],
  aws_access_key_id: ENV['AWS_ACCESS_KEY'],
  aws_secret_access_key: ENV['AWS_SECRET_KEY'],
  aws_region: ENV['AWS_REGION'],
)

SitemapGenerator::Sitemap.create do
  add root_path, changefreq: 'weekly', priority: 0.5
  add lookbacks_path, changefreq: 'daily', priority: 0.9 
  add reviews_path, changefreq: 'daily', priority: 0.9 
  add log_out_path, changefreq: 'weekly', priority: 0.5
  add new_lookback_path, changefreq: 'weekly', priority: 0.5
  
  User.all.each do |user|
    add user_path(user), changefreq: 'daily'
  end
  
  Lookback.all.each do |lookback|
    add lookback_path(lookback), priority: 0.9, lastmod: lookback.update_at, changefreq: 'daily'
    add edit_lookback_path(lookback), priority: 0.9, lastmod: lookback.update_at, changefreq: 'daily'
  end
  
end