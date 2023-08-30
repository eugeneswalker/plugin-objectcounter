FROM ecpe4s/waggle-ml:latest

COPY requirements.txt /app/
RUN pip3 install --no-cache-dir -r /app/requirements.txt

COPY app.py /app/
COPY coco.names /app/
COPY models/ /app/models
COPY utils/ /app/utils
COPY test-img.jpg /app/

ADD https://web.lcrc.anl.gov/public/waggle/models/vehicletracking/yolov7.pt /app/yolov7.pt

WORKDIR /app
ENTRYPOINT ["wrapper.sh"]
