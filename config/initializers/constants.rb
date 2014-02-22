PDFKit.configure do |config|
  config.wkhtmltopdf = 'C:\html2pdf\wkhtmltopdf.exe'
  config.default_options = {
    :page_size => 'Legal',
    :print_media_type => true
  }
  # Use only if your external hostname is unavailable on the server.
  config.root_url = "http://localhost:3000" 
end


Balanced.configure('ak-test-24GmUMXzqB8reJ3TViwfPhELd4utn2RuU')