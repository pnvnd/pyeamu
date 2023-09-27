## docker build . -t e-amuse:latest
## docker run -p 8000:8000 e-amuse:latest

FROM python:3.11-alpine --platform=$BUILDPLATFORM

RUN apk update && apk add git curl p7zip
RUN git clone https://github.com/drmext/MonkeyBusiness.git /opt/e-amusement/

WORKDIR /opt/e-amusement/

RUN pip install -U -r requirements.txt
RUN curl -LJO https://github.com/drmext/BounceTrippy/releases/download/v0.0.2-alpha/MonkeyBusiness-ddr-iidx-gita-webui-alpha.7z
RUN 7z x MonkeyBusiness-ddr-iidx-gita-webui-alpha.7z

EXPOSE 8000:8000

ENTRYPOINT python pyeamu.py