#coding=utf-8
import urllib
import re

def getHtml(url):
    page = urllib.urlopen(url)
    html = page.read()
    return html

def getImg(url):
    reg =  '" src="(.+?imgsrc.+?\.jpg)"'
    imgre = re.compile(reg)
    imgList = re.findall(imgre,html)
    x = 0
    for imgUrl in imgList :
        urllib.urlretrieve(imgUrl,'%s.jpg' % x)
        x += 1
    return imgList

html = getHtml("http://tieba.baidu.com/p/5023694417")

print getImg(html)
