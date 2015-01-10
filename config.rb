###
# Blog settings
###

set :slim, pretty: true

set :blog_title, 'Krep Blog'

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

Time.zone = 'Paris'

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = ''

  blog.permalink = "/articles/{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  blog.sources = "/articles/{year}/{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = 'article'
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  # blog.tag_template = "tag.html"
  # blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# activate :directory_indexes
activate :webp

activate :deploy do |deploy|
  deploy.method = :git
  # deploy.remote = 'git@github.com:krep/krep.github.io.git'
  deploy.remote = 'https://${ENV['GH_TOKEN']}@github.com/krep/krep.github.io.git'
  deploy.branch = 'master'
end

# Methods defined in the helpers block are available in templates
helpers do
  def page_title(tab: false)
    unless tab
      return current_page.data.title unless current_page.data.title.nil?
      return current_article.title if !current_article.nil? && current_article.title
    else
      return current_page.data.title + " &ndash; " + blog_title unless current_page.data.title.nil?
      return current_article.title + " &ndash; " + blog_title if !current_article.nil? && current_article.title
    end

    return blog_title
  end
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  ignore 'stylesheets/base/README.*'
  ignore 'stylesheets/layout/README.*'
  ignore 'stylesheets/modules/README.*'
  ignore 'stylesheets/states/README.*'
end
