require 'webrick'

server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}

server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'exam.html.erb')

server.mount('/bad_quality.cgi', WEBrick::HTTPServlet::CGIHandler, 'bad_quality.rb')

server.mount('/not_self.cgi', WEBrick::HTTPServlet::CGIHandler, 'not_self.rb')

server.start
