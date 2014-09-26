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
		File.open("form_top.html", "rb") {|form| response.write(form.read)}
		(1..100).each {|i| response.write("<option value= \"#{i}\">#{i}</option>\n")}
		File.open("form_bottom.html", "rb") {|form| response.write(form.read)}
		response.finish
	end

	def render_list(request)
		#initializing variables and functions
		#@contents = Array.new
		response= Rack::Response.new

		response.write("Album Titles and Your Selection! \n \n")
		File.open("top_100_albums.txt", "r").each do |line|
   			split_line=line.split(",")
   			response.write(split_line)
		end		
		#contents = txtFile.read

		#puts contents 
		
		#contents = string.split("\n")
		#contents.each do |num|
   		#	puts num
		#	end		

#http://stackoverflow.com/questions/10490204/capture-dynamic-list-to-an-array-using-ruby
		#response.write(contents)
		
		#logic for array:
		#for (i=1; i<=101; i++)
		#	{
				#print the number associated with the song number
		#		#print out the song title
		#	}

		#figure out a way to put the list in to an array, split on the comma? 
		#then highlight the appropriate line?
		
		
		response.finish
	end

	def render_404
		[404, {"Content-Type" => "plain/text"}, ["Nothing here!"]]
	end

end

Rack::Handler::WEBrick.run AlbumApp.new, :Port => 8080

