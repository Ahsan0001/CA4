FROM python:3.8.2-alpine

COPY . .

RUN pip install -r requirements.txt
EXPOSE 5000

CMD ["flask", "--app", "app", "run"]
