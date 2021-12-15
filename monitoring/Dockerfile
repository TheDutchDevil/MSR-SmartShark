FROM python:3.7

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY extract_queries.py . 

ENTRYPOINT [ "python", "extract_queries.py" ]