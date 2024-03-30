#! /bin/bash

echo 'Django migration is starting...'
sleep 3
python3 manage.py makemigrations
python3 manage.py migrate
echo 'Django migrations completed successfully'

echo 'Creating django superuser...'
sleep 3
echo "from django.contrib.auth.models import User; User.objects.create_superuser('aswin', 'aswin.ruppellssolutions@gmail.com', 'admin@123')" | python3 manage.py shell

echo 'strating django app'
sleep 3
gunicorn --bind 0.0.0.0:8000 tourAndTravel.wsgi:application
echo 'application started successfully'
