default:
	rake db:drop
	rake db:create
	rake db:migrate
	rake load_mlab_data:all
	rake db:seed
