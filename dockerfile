## docker build . -t e-amuse:main
## docker run -dp 8000:8000 e-amuse:main

FROM python:3.11-alpine

RUN apk update && apk add git curl p7zip
RUN git clone https://github.com/drmext/MonkeyBusiness.git /opt/e-amusement/

WORKDIR /opt/e-amusement/

RUN pip install -r requirements.txt
RUN curl -JLO https://github.com/drmext/BounceTrippy/releases/download/v0.0.3-alpha/MonkeyBusiness-webui-alpha-0.3.7z
RUN 7z x MonkeyBusiness-webui-alpha-0.3.7z
# COPY main.5b1e10f5.js ./webui/static/js/

EXPOSE 8000:8000

ENTRYPOINT ["python3", "pyeamu.py"]
