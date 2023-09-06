#!/bin/sh

sleep 10

if [ "$DATABASE" = "postgres" ]
then
    echo "Ждём постгрешечку..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "Постгрешечка, родненькая, стартанула"
fi

python manage.py flush --no-input
python manage.py migrate
python manage.py createcachetable
python manage.py collectstatic  --noinput
gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000

if [ "$DJANGO_SUPERUSER_USERNAME" ]; then
  python manage.py createsuperuser \
    --noinput \
    --username "$DJANGO_SUPERUSER_USERNAME" \
    --email $DJANGO_SUPERUSER_EMAIL
fi

exec "$@"
