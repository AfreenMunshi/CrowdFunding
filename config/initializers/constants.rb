PDFKit.configure do |config|
  config.wkhtmltopdf = '/home/afreen/.rvm/rubies/ruby-2.0.0-p353/bin/wkhtmltopdf'
  config.default_options = {
    :page_size => 'Legal',
    :print_media_type => true
  }
  # Use only if your external hostname is unavailable on the server.
  config.root_url = "http://localhost:3000"
end


Balanced.configure('ak-test-24GmUMXzqB8reJ3TViwfPhELd4utn2RuU')
