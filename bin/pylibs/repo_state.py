import json
import os
from pylibs.helpers import command

# Get the branch for a particular repo.
def get_branch(repo):
    return command('git branch --show-current'.split(' '), dir=repo)

# Get the hash of the latest commit on current branch for a particular repo.
def get_hash(repo):
    return command('git rev-parse HEAD'.split(' '), dir=repo)

# Get a list of checked out branches of repos which exist in:
# ~/git/ and also ~/git/<project>/vendor/finao/
def get_repo_state():
    user = os.getlogin()
    project = command('get_project_from_current_directory')
    if not project:
        project = 'prime'
    home = '/home/' + user

    # List only those packages required in composer.json
    with open(home + '/git/' + project + '/composer.json', 'r') as cj:
        cj_contents = json.loads(cj.read())
    reqs = cj_contents['require']
    pkg_reqs = {k: v for k, v in reqs.items() if k.startswith('finao')}
    pkg_paths = [home + '/git/' + p.split('/')[1] for p in pkg_reqs.keys()]

    # Remove vendor packages that don't exists in ~/git/ as a repo.
    pkg_repos = list(filter(os.path.exists, pkg_paths))
    
    # Get branch names for each package repo.
    branches = list(map(get_branch, pkg_repos))
    hashes = list(map(get_hash, pkg_repos))
    infos = list(map(
        lambda p: {'branch': p[0], 'hash': p[1]},
        list(zip(branches, hashes))
    ))
    return dict(zip(pkg_repos, infos))

def get_repo_state_except_masters():
    states = get_repo_state()
    no_master_branches = dict(
        filter(lambda b: b[1]['branch'] != 'master', states.items())
    )
    return no_master_branches
