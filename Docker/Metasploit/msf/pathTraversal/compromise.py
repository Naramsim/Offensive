import subprocess

def attack(manager):
    process = subprocess.Popen("sh deploy.sh "+manager[0]+" "+manager[1], shell=True)
    code = process.wait()

    if code != 0:
        raise RuntimeError
