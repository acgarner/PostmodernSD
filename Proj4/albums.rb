require 'rack'

class AlbumApp

  def call(env)
  	request= Rack::Request.new(env)
  	case request.path
  	when "/form" then render_form(request)
  	when "/list" then render_list(request)
  	else render_404
  end
end

	def render_form(request)
		response= Rack::Response.new
		File.open("top.html", "rb") {|form| response.write(form.read)}
		File.open("form_top.html", "rb") {|form| response.write(form.read)}
		(1..100).each {|i| response.write("<option value= \"#{i}\">#{i}</option>\n")}
		File.open("form_bottom.html", "rb") {|form| response.write(form.read)}
		File.open("bottom.html", "rb") {|form| response.write(form.read)}
		response.finish
	end

	def render_list(request)
		
		response= Rack::Response.new
		splitLineArray = Array.new

		File.open("top.html", "rb") {|form| response.write(form.read)}
		#response.write("Album Titles and Your Selection! \n \n")
		File.open("top_100_albums.txt", "r").each do |line|
   			split_line=line.split(",")
   			splitLineArray.push(split_line)
   		
   		response.write(split_line)

   			puts split_line + "\n"
   			

		#File.open("list.html", "rb") {|form| response.write(form.read)}
   			#split_line.each do |split_line|
   			#response.write(split_line)
   			#response.write("\n")
   			#end 


   			#http://stackoverflow.com/questions/9752512/ruby-array-to-html-table

		end		
		File.open("bottom.html", "rb") {|form| response.write(form.read)}
#http://stackoverflow.com/questions/10490204/capture-dynamic-list-to-an-array-using-ruby
		#response.write(contents)
		response.finish
	end

	def render_404
		[404, {"Content-Type" => "plain/text"}, ["Nothing here!"]]
	end




end

Rack::Handler::WEBrick.run AlbumApp.new, :Port => 8080

