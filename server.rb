require 'rubygems'
require 'sinatra/base'
require 'yaml'

class Server < Sinatra::Base

	# set Pusher configuration
	set :public_folder, Proc.new { File.join(root, "public") }
	config = YAML.load_file('./config.yml')

	# main view action
	get '/' do
		@app_key = config['pusher']['app_key']

		erb :index
	end

	run! if app_file == $0

end