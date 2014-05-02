require 'sinatra'

get '/' do
	erb :layout
end

post '/' do
	data = params[:checkboxes]
	data = data[0].split(',')
	content = ""

	data.each do |pod|
		content << "pod '" + pod + "'\n"
	end
	
	podfile = "Podfile" +  Time.now.to_i.to_s
	File.open('/tmp/' + podfile, "w"){ |f| f << content }
	send_file(podfile, :filename => "Podfile")
end