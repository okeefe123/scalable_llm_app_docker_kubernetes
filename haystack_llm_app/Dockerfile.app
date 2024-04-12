FROM python:3.10-slim
#FROM nvidia/cuda:12.4.1-runtime-ubuntu20.04

WORKDIR streamlit/

COPY streamlit/requirements.txt ./requirements.txt

RUN apt-get update && apt-get install -y --no-install-recommends \
        python3-pip \
        ca-certificates \
        netbase \
        && rm -rf /var/lib/apt/lists/*

#RUN apt-get install -y retry
#RUN until pip3 install --default-timeout=300 -r requirements.txt; do echo Retrying; done
RUN pip install --default-timeout=1000 -r requirements.txt

COPY streamlit/ .

# ARG OPENAI_API_KEY
# ENV OPENAI_API_KEY=$OPENAI_API_KEY

#COPY streamlit/db_api.py ./db_api.py

EXPOSE 8501

#COPY . .

#ENTRYPOINT ["streamlit", "run"]
RUN pwd
RUN ls

CMD ["streamlit", "run", "app.py"]