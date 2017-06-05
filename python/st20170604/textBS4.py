# _*_ coding:utf-8_*_
from bs4 import BeautifulSoup
html = '<div>好好的<div>'
soup = BeautifulSoup(html,'html.parser')
print (soup)
