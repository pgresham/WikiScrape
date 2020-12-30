# WikiScrape

WikiScrape
==========
Web-Driven Password Dictionary Generator Version 0.1
----------

Philip Gresham  Github:@pgresham

---
Introduction:
---------

I wrote this to get experience working with web scraping using BeautifulSoup and to generate a small proof of concept password dictionary showing how informational sites like Wikipedia can create lists of possible passwords based on a single piece of information. For example, say you wanted to crack the password for a wifi network with the SSID Seahawks-5G. The Wikipedia page for the Seattle Sehawks would have a high probablility of containing all the words/numbers that would be in a simple password (player name and jersey number combinations for instance). This program automates the process of mixing down those combinations into text files to feed to another program like Aircrack-ng or HashCat.

---
Installation:
------

**In Linux, open a terminal and type the following:**

*git clone https://github.com/pgresham/WikiScrape.git 

*cd WikiScrape

*sudo ./setup.sh

This automatically installs the dependencies that WikiScrape needs to run.

If you are installing this on Windows, you can download the wikiscrape file and follow the instructions below in Requirements. To run it type python3 wikiscrape into a command prompt in the same directory.

---
Requirements:
-------

This was written and tested on a Debian system in Python 3.x, but should work cross-platform. The followoing packages are required:

*BeautifulSoup 4
*requests

These can easily be installed with pip3 using the following commands or can be downloaded from the PyPi web repository.

*pip3 install beautifulsoup4
*pip3 install requests

It should go without saying, too, you'll need a connection to the Internet for WikiScrape to function properly.

---
Basic Operation:
--------

Running this program is fairly straightforward: 

*The main menu offers the ability to quick-start with the defaults: wikipedia.com as the site , exclude.conf for excluded words (discussed below) and _ replacing spaces in search terms. The program will prompt you for a term (if you need help with this part search WikiPedia in a web browser and copy the part after .../wiki/ into the terminal) and scrapes the main body of the site to form a list of unique words. 
The next menu allows the option to output a text file of the wordlist as it is, or in multiple combinations of the words. A word of warning: the combinations stack up fast, especially when getitng into the 3 and 4 word options. Take note of the 'unique lines loaded' output before diving in.

*After selecting your combinations (or not) you will be prompted to specify a minimum and maximum length of the phrases generated. Since pass phrases such as WPA2 require a minimum of 8 characters, throwing 2,3,or 7-character passwords into the mix will only take up time. Likewise, most passwords that can be cracked with this list will likely not be much longer than 32 characters and absurdly long strings of characters will waste not only cracking time, but also significant disk space. 

*With the list now cut down to only what is to be written, the option is given to force all uppercase, all lowercase, or write the list with capital letters falling where they will. The option to 'save as' is also given. For the sake to minimizing time spent querying Wikipedia or any site that is chosen, this option can be done multiple times on the same scrape and multiple lists can be generated.

---
Configuration:
--------

*To select another site, change the excluded.conf file, or the space character select 'Configure the generator' from the menu.

*The site (which defaults to wikipedia and can be reset to such by hitting 'enter') can be configured first. This is the base URL for your query. Should a site with a backend database be used, for instance, everything up to the query (on Google this would be &q= ) must be included. Be aware of what the search uses as its space character. Wikipedia uses _ , but + or - are popular too. You will be prompted for this with the default being _ .

*The configuration file exclude.conf is a short default set of words to exclude from the generated list.It can be directly edited by adding or removing terms from the list, each on their own line. The option is given, too, to specify a different list should a need for using one arise. Omitting the list will generate an error but has no effect on the core functionality of the program. 

*Note: as of this version 'words' containing symbols are omitted from the list by default. A line, for instance like "foo something  bar" with quotation marks would be divided into three words "foo with the open quote and bar" with the close quote being omitted and something being added to the word list. The program is hard coded as of this version to omit these and other symbol containing words from the list.
