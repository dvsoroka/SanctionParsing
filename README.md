# SanctionParsing

sudo apt install python3.8
sudo apt install python3.8-dev python3.8-venv

sudo apt-get install build-essential python3-dev python3-pip python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0

#Create Your_Fork on GitHub from official repo
https://github.com/VeteraniusWeb2021/SanctionParsing

git clone https://github.com/Your_Fork/SanctionParsing.git

cd SanctionParsing/

# code .

python3.8 -m venv .venv
source .venv/bin/activate
(.venv)$ pip install -U pip setuptools wheel
(.venv)$ pip install -r requirements.txt

pip install django
pip install djangorestframework
pip install pygments

Create your settings_local.py
Copy data_converter/settings_local.base.py to data_converter/settings_local.py
Setup your settings in settings_local.py
Set your credentials from PostgreSQL in DATABASES section
"NAME": "your_db_name",
"USER": "your_db_user",
"PASSWORD": "your_db_password",
Migrate
(.venv)$ ./manage.py migrate
Create Superuser
(.venv)$ ./manage.py createsuperuser
Load fixtures
(.venv)$ ./manage.py loaddata category
(.venv)$ ./manage.py loaddata register
Collect static files
(.venv)$ ./manage.py collectstatic
Run server
(.venv)$ ./manage.py runserver 127.0.0.1:8000

