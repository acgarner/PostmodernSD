require 'rack'
require 'sqlite3'

#class	#domain object 
#attr_accessor
#def initialize(:rank, :title, :year)
#	@rank = rank
#	@title = title
#	@year = year
#end

class AlbumApp


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
		response.write(ERB.new(File.read("form.html.erb")).result(binding))
		response.finish
	end

	def render_list(request)
		
		response= Rack::Response.new
		dataArray = Array.new

		# use the albums array - sorted
		# ex of what to put in the erb file:
		# <% albums.each do |album| %>
		# <tr>
		# 	<td><%=album.rank%></td>
		#  ... etc
		#
		

		#File.open("top.html", "rb") {|form| response.write(form.read)}
		
		
		
		sortBy = request.params["sortBy"]
		rank = request.params["selectNumber"].to_i

		database = SQLite3::Database.open("albums.sqlite3.db")
		#dataArray = database.execute("SELECT * FROM albums ORDER BY #{sortBy}")
		

		if sortBy == "Name"
			#dataArray.sort! { |l, r| l[0] <=> r[0] }
		dataArray = database.execute("SELECT * FROM albums ORDER BY title")
		elsif sortBy == "Year"
			#dataArray.sort! { |l, r| l[1] <=> r[1] }
			dataArray = database.execute("SELECT * FROM albums ORDER BY year")
		end

		database.close


		#response.write("<table border=\"1\">\n")
		dataArray.each_with_index do |album, i|
			response.write("\t<tr>\n")
			counter = i + 1

			#there should be no html in the ruby by the time this is finished 
			if counter == rank
				string = "\t\t<tr class = \"highlight\">"
				string = string + "\t\t<td>" + counter.to_s + "</td>\n"
				string = string + "\t\t<td> #{album[1]} </td>\n"
				string = string + "\t\t<td> #{album[2]} </td>\n"
				response.write(string)
			else

				response.write("\t\t<td>" + counter.to_s + "</td>\n")
				response.write("\t\t<td> #{album[1]} </td>\n")
				response.write("\t\t<td> #{album[2]} </td>\n")
			end
			response.write("\t</tr>\n")
		end
		response.write("</table>\n")

		File.open("bottom.html", "rb") {|form| response.write(form.read)}
		response.finish
	end

	def render_404
		[404, {"Content-Type" => "plain/text"}, ["Nothing here!"]]
	end

end

Rack::Handler::WEBrick.run AlbumApp.new, :Port => 8080

