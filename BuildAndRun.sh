
unzip WebServer426
cd WebServer426
./run.sh &
cd ..

# sudo docker build -t template3dp .
unzip template3dp
sudo docker load < template3dp.tar
sudo docker run --rm -ti --network=host --gpus=all template3dp -PixelStreamingIP=127.0.0.1 -PixelStreamingPort=8888		# run container for image with tag=template3dp, automatically clean up the container on exit, allocate a pseudo-tty for the container process, use the Docker host network stack

sudo docker image rm template3dp
rm template3dp.tar
sudo kill -9 $(ps aux | grep 'cirrus' | grep -v 'grep' | awk '{print $2}')
rm -rf WebServer426
