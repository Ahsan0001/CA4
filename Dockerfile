FROM python:3.11.3-slim-bullseye

COPY . .

RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev
RUN pip3 install -r requirements.txt

EXPOSE 5000

CMD ["flask", "--app", "app", "run"]
