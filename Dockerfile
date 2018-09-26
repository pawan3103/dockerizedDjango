FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code
RUN pip install -r requirements.txt
ADD . /code/

#start.sh is file where we will write command to be executed. 
COPY ./start.sh /start.sh
RUN sed -i 's/\r//' /start.sh
RUN chmod +x /start.sh