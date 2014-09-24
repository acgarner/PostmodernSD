require 'rack'

#form = File.read('form.html')

class HelloWorld
  def call(env)
    [200, {"Content-Type" => "text/plain"}, ["Hello from Rack!"]]

  end
end

Rack::Handler::WEBrick.run HelloWorld.new, :Port => 8080

#http://www.ruby-doc.org/stdlib-1.9.3/libdoc/webrick/rdoc/WEBrick.html ??