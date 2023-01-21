import os
import subprocess

# Run a system command
def command(cmd, dir='.', stderr=None):
    return subprocess.check_output(
        cmd,
        cwd=dir,
        stderr=stderr
    ).decode('utf-8').rstrip('\n')

def get_project_name():
    # Get the project, or assume prime if script is running in a non-project directory.
    project = command('get_project_from_current_directory')
    if not project:
        project = 'prime';
    return project

def get_project_path():
    user = os.getlogin()
    home = '/home/' + user
    project = get_project_name()
    project_path = home + '/git/' + project
    return project_path
