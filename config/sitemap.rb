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
  add root_path, priority: 0.7, changefreq: 'daily'
  add lookbacks_path
  add reviews_path
  add log_out_path
  add new_lookback_path
  add "/auth/google_oauth2"
end