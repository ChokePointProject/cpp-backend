default:
	rake db:drop
	rake db:create
	rake db:migrate
	rake db:fixtures:load
	rake load_mlab_data:all
