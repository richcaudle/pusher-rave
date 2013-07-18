require 'rubygems'
require 'sinatra/base'
require 'yaml'
require 'pusher'

class Server < Sinatra::Base

	# set Pusher configuration
	set :public_folder, Proc.new { File.join(root, "public") }
	config = YAML.load_file('./config.yml')

	Pusher.app_id = config['pusher']['app_id']
	Pusher.key = config['pusher']['app_key']
	Pusher.secret = config['pusher']['app_secret']

	# main view action
	get '/' do
		#@app_key = config['pusher']['app_key']

		puts Pusher.get('/channels')

		erb :index
	end

	run! if app_file == $0

end