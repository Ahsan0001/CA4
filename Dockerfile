FROM python:3.8.2-alpine

COPY . .

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -r requirements.txt


EXPOSE 5000

CMD ["flask", "--app", "app", "run"]
