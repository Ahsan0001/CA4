FROM python:3.8.2-alpine

COPY . .

RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev
RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["flask", "--app", "app", "run"]
