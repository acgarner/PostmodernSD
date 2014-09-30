require 'rack'

class AlbumApp


	#domain object 
#attr_accessor
#def initialize(:rank, :title, :year)
#	@rank
#	@title
#	@year
#end

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
		dataArray = Array.new

		File.open("top.html", "rb") {|form| response.write(form.read)}
		#response.write("Album Titles and Your Selection! \n \n")
		File.open("top_100_albums.txt", "r").each do |line|
   			split_line = line.chomp.split(", ")
   			dataArray.push(split_line)
   		#how do I input this string into a 2D array?
   		#do i need to use a table to display this data (in html)?
   		

		end
		# TODO: sort an array based on the 
		response.write("<table border=\"1\">\n")
		dataArray.each_with_index do |album, i|
			response.write("\t<tr>\n")
			response.write("\t\t<td>" + (i + 1).to_s + "</td>\n")
			response.write("\t\t<td>" + album[0] + "</td>\n")
			response.write("\t\t<td>" + album[1] + "</td>\n")
			response.write("\t</tr>\n")
		end
		response.write("</table>\n")

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

