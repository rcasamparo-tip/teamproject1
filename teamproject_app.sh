#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp midterm_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python" > tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates" >> tempdir/Dockerfile
echo "COPY ./static /home/myapp/static" >> tempdir/Dockerfile
echo "COPY teamproject_app.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 8000" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/teamproject_app.py" >> tempdir/Dockerfile

cd tempdir
docker build -t teamproject .
docker run -t -d -p 8000:8000 --name teamproject teamproject
docker ps -a  

