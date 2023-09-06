#!/bin/sh
# vim:sw=4:ts=4:et

#su-exec "$USER" python manage.py collectstatic --noinput

# Creating the first user in the system
USER_EXISTS="from django.contrib.auth import get_user_model; User = get_user_model(); exit(User.objects.exists())"
su-exec "$USER" python manage.py shell -c "$USER_EXISTS" && su-exec "$USER" python manage.py createsuperuser --noinput
su-exec "$USER" python manage.py runserver 0.0.0.0:8000"
