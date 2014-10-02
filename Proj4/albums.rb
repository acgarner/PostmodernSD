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
  	when "/list.css" then render_css(request)
  	else render_404
  end
end

	def render_css(request)
		response= Rack::Response.new
		response.write(File.read("list.css"))
		response.finish
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
		
		File.open("top_100_albums.txt", "r").each do |line|
   			split_line = line.chomp.split(", ")
   			dataArray.push(split_line)
		end
		# TODO: sort an array based on the request parameter called sortBy

		sortBy = request.params["sortBy"]
		rank = request.params["selectNumber"].to_i

		if sortBy == "Name"
			dataArray.sort! { |l, r| l[0] <=> r[0] }
		elsif sortBy == "Year"
			dataArray.sort! { |l, r| l[1] <=> r[1] }
		end
		


		response.write("<table border=\"1\">\n")
		dataArray.each_with_index do |album, i|
			response.write("\t<tr>\n")
			counter = i + 1


			if counter == rank
				string = "\t\t<tr class = \"highlight\">"
				string = string + "\t\t<td>" + counter.to_s + "</td>\n"
				string = string + "\t\t<td>" + album[0] + "</td>\n"
				string = string + "\t\t<td>" + album[1] + "</td>\n"
				response.write(string)
			else

				response.write("\t\t<td>" + counter.to_s + "</td>\n")
				response.write("\t\t<td>" + album[0] + "</td>\n")
				response.write("\t\t<td>" + album[1] + "</td>\n")
			end
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

