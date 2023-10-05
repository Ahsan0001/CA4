FROM python:3.11.3-slim-bullseye

COPY . .

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install -r requirements.txt

EXPOSE 5000

CMD ["flask", "--app", "app", "run"]
