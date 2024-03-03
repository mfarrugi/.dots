import subprocess

def shell(*args):
    return (subprocess.check_output(args)
        .decode('ascii')
        .strip()
        .split('\n'))
