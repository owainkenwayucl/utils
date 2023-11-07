#!/usr/bin/env python3

def run(command):
    import subprocess
    return subprocess.run(command, capture_output=True, encoding='UTF-8')

if __name__=="__main__":
    import sys

    command = ["aws", "ec2", "describe-instances", "--query", 'Reservations[*].Instances[].[InstanceId,Tags[?Key==`Name`]|[0].Value,Tags[?Key==`Owner`]|[0].Value,State.Name,PublicIpAddress]', "--output=table"]

    try:
        response = run(command)
        print(response.stdout)
    except:
        print(response.stderr)
        sys.exit(1)
