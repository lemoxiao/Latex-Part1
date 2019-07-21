import os
from pathlib import Path
import requests
import urllib.request
from bs4 import BeautifulSoup


path = str(Path(os.path.abspath(__file__)).parent.parent.parent)
filePath = Path(path + '/thesis-template.cls')

with open(filePath) as f:
    datafile = f.readlines()
    pkgList = list()

    for line in datafile:
        if 'RequirePackage' in line:
            pkgName = line.split('{')[-1].split('}')[0]
            print(pkgName)
            pkgList.append(pkgName)

new_pkgList = []
for pkg in pkgList:
    url = 'https://ctan.org/pkg/' + pkg
    r = requests.get(url)
    r.encoding = r.apparent_encoding
    html_content = r.text
    soup = BeautifulSoup(html_content, "html.parser")
    for tr in soup.find_all('tr'):
        if 'X Live</a>' in str(tr):
            pkgName = str(tr).split('<br')[0].split(' ')[-1]
            if pkgName not in new_pkgList:
                new_pkgList.append(pkgName)

# TODO some package names contain extra hyphens

stringOfPkg = new_pkgList[0]
for pkg in new_pkgList[1:]:
    stringOfPkg = stringOfPkg + ', ' + pkg

os.system('tlmgr --version')
os.system('tlmgr update --self')
os.system('tlmgr install ' + stringOfPkg)

