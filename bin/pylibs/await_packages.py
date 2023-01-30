#!/usr/bin/python3

# Await packages: poll repos site until the packages have been created for every
# package repo under ~/git/ including its latest commit.

import os
import re
import subprocess
import time
from pylibs.repo_state import get_repo_state_except_masters
from pylibs.helpers import command

# Receives a string containing a HTML link
# Returns a structured version
def link_to_dict(link):
    url_search = re.search(r'href="(.*?)"', link)
    title_search = re.search(r'title="(.*?)"', link)
    text = re.search(r'>(.*?)</a>', link).group(1)
    result = {
        'text': text,
        'original': link
    }
    if url_search:
        result['url'] = url_search.group(1)
    if title_search:
        result['title'] = title_search.group(1)
    return result

# Scrape package information from repo site
def scrape_packages():
    repos_url = command('config repos_url'.split(' '))
    repos_user = command('config repos_user'.split(' '))
    repos_pass = command('config repos_pass'.split(' '))
    html = command(
        ['curl', '-u', repos_user + ':' + repos_pass, repos_url],
        stderr=subprocess.DEVNULL
    )
    links = re.findall(r'(<a.*?</a>)', html)
    structured_links = list(map(link_to_dict, links))
    return structured_links

# Check if latest commit of all branches is available, block if not.
# Returns a list of dicts containing metadata of all links on packages site.
def get_links(no_master_branches):
    links = []
    while True:
        links = scrape_packages()

        # Create a list of boolean, True if package available, False if not.
        pkgs_available = list(map(
            lambda x: len(list(filter(
                lambda a: a['title'] == x['hash'] if 'title' in a else False, 
                links
            ))) > 0,
            no_master_branches.values()
        ))
        if all(pkgs_available):
            break
        else:

            # Print packages which are not yet available.
            unavailables = list(filter(
                lambda a: not a[1],
                list(zip(no_master_branches.keys(), pkgs_available))
            ))
            for unavailable in unavailables:
                print(unavailable[0] + ' not yet available.')

            print('Trying again after 10s...')
            time.sleep(10)

def await_packages(no_masters=None):
    no_master_branches = get_repo_state_except_masters() if no_masters == None else no_masters
    get_links(no_master_branches)
    print('All packages are available!')

