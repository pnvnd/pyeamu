## docker build . -t e-amuse:main
## docker run -p 8000:8000 e-amuse:main

FROM python:3.11-alpine

RUN apk update && apk add git curl p7zip
RUN git clone https://github.com/drmext/MonkeyBusiness.git /opt/e-amusement/

WORKDIR /opt/e-amusement/

RUN pip install -U -r requirements.txt
RUN curl -JLO https://github.com/drmext/BounceTrippy/releases/download/v0.0.1-alpha/MonkeyBusiness-ddr-webui-alpha.7z
RUN 7z x MonkeyBusiness-ddr-webui-alpha.7z

EXPOSE 8000:8000

ENTRYPOINT python pyeamu.py