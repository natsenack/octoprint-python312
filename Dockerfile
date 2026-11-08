FROM python:3.12-slim-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc g++ git \
    libffi-dev libssl-dev \
    libjpeg-dev zlib1g-dev \
    libusb-1.0-0 libudev1 \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir "OctoPrint==1.11.8"

EXPOSE 5000

CMD ["octoprint", "serve", "--iknowwhatimdoing", "--host", "0.0.0.0", "--port", "5000", "--basedir", "/data/octoprint"]
