FROM python:3.7
RUN mkdir /app
WORKDIR /app
COPY ./docker/product/django/requirements.txt /app
RUN pip install -r requirements.txt
ADD . /app
RUN python autoregion/manage.py collectstatic --noinput
