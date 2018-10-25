FROM python:3.7
RUN mkdir /app
WORKDIR /app
COPY ./docker/develop/django/requirements.txt /app
RUN pip install -r requirements.txt
ADD . /app
#RUN cd autoregion && python manage.py collectstatic --noinput
RUN python autoregion/manage.py collectstatic --noinput
