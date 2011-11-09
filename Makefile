default:
	rake db:drop
	rake db:create
	rake db:migrate
	rake db:seed
	rake load_mlab_data:all
	rake load_transparencyreport_data:all
