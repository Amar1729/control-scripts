#!/env/bin/python

from bs4 import BeautifulSoup as bs
import re	

from lxml import html
import requests

def st(obj):
	try:
		return obj.attrs['class'] == ['summary']
	except:
		return False

def bs_get(url):
	page = requests.get(url)
	soup = bs(page.content, "lxml")
	first = soup.findAll("table","wikitable plainrowheaders")
	second = [ tag for tag in first[0].findAll('td') if tag.attrs ]
	third = filter(st, second)
	fourth = [ str(n.text) for n in third ]

	# Remove the quotes that Wikipedia has
	for itr,name in enumerate(fourth):
		if name[0] == '"' or name[0] == "'":
			fourth[itr] = name[1:-1]

	return fourth

def xpath_get(url):
	page = requests.get(url)
	tree = html.fromstring(page.content)
	names = tree.xpath('//td[@class="summary"]/text()')

	return names