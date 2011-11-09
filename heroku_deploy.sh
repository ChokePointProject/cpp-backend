#! /bin/bash
git push heroku master
heroku pg:reset SHARED_DATABASE --confirm hollow-meadow-4829
heroku rake db:migrate
heroku rake db:seed
heroku rake load_mlab_data:all
heroku rake load_transparencyreport_data:all
