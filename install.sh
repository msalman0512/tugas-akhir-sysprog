# install.sh
sudo apt install xinit
sudo apt-get install python3
sudo apt install python3-pip

pip3 install scikit-build
python3 -m pip install --upgrade pip
pip3 install opencv-python

chmod 777 app.sh
chmod 777 stream_video.py
chmod 777 take_video.py
chmod 777 take_picture.py
chmod 777 take_picture_and_get_status.py
chmod 777 haarcascade_frontalface_default.xml
