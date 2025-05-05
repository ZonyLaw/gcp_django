# main.py
from config.wsgi import application  # adjust if your wsgi path is different

if __name__ == "__main__":
    from gunicorn.app.wsgiapp import run
    run()
