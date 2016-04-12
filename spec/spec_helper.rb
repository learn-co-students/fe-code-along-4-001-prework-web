GreenOnion.configure do |c|
  c.skins_dir = './spec/skins'
  c.driver = :selenium
end

def create_screenshots
  GreenOnion.skin_visual('http://localhost:8000/index.html')
  GreenOnion.skin_visual('http://localhost:8000/real-estate-listings.html')
  GreenOnion.skin_visual('http://localhost:8000/market-report.html')
  GreenOnion.skin_visual('http://localhost:8000/new-properties.html')
  GreenOnion.skin_visual('http://localhost:8000/contact.html')
end

def start_server_thread
  @server_thread = Thread.new do 
    root = Dir.pwd
    server = WEBrick::HTTPServer.new :Port => 8000, :DocumentRoot => root
    trap 'INT' do server.shutdown end
    server.start
  end
  sleep 2
end

def exit_server_thread
  @server_thread.exit
end