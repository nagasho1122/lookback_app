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
  add for_customer_articles_path, priority: 0.7, changefreq: 'daily'

  Article.where(status: 1).find_each do |article|
    add for_customer_article_path(article), priority: 0.7, lastmod: article.updated_at, changefreq: 'daily'
  end
end