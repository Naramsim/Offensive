import argparse

def parseArguments():
    parser = argparse.ArgumentParser(description="Automation of the CVE 2008-2938 vulnerability exploit. This script first obtains a manager account by parsing the tomcat-users.xml, and then executes an instance of Metasploit to attack the server through the compromised account.")
    parser.add_argument("address", nargs=1, type=str, help="the address of the server to attack (bare ip xor domain name)")
    return parser.parse_args()

def getIp(args):
    return args.address[0]
