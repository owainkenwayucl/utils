#!/usr/bin/env python3

def run(command):
    import subprocess
    return subprocess.run(command, capture_output=True, encoding='UTF-8')

# Validate what we get back from aws as I just don't trust them.
def check_address(r):
    parts = r.split(".")

    assert(len(parts)==4)
    oct1 = int(parts[0])
    oct2 = int(parts[1])
    oct3 = int(parts[2])
    oct4 = int(parts[3])
    assert oct1 <=255
    assert oct2 <=255
    assert oct3 <=255
    assert oct4 <=255
    assert oct1 >=0
    assert oct2 >=0
    assert oct3 >=0
    assert oct4 >=0

    o = f"{oct1}.{oct2}.{oct3}.{oct4}"
    return o

if __name__=="__main__":
    import sys

    if ((len(sys.argv) == 3) and (sys.argv[1].strip()) == "validate"):
        s = sys.argv[2]
        sys.stderr.write(f"Validating string \"{s}\"... ")
        a = check_address(s)
        sys.stderr.write("Success\n")
        sys.exit(0)

    if len(sys.argv) == 1:
        sys.stderr.write(f"Usage: {sys.argv[0]} <host-id>\n")
        sys.exit(1)
    if len(sys.argv) > 2:
        sys.stderr.write("Too many arguments\n")
        sys.exit(2)
    
    host_id = sys.argv[1]
    r = run(["aws", "ec2", "describe-instances", "--instance-ids",f"{host_id}","--query",'Reservations[*].Instances[*].PublicIpAddress',"--output", "text"]).stdout.strip()

    if r == "":
        sys.stderr.write(f"ERROR: No IP address found for {host_id} \n")
        sys.exit(3)

    print(check_address(r))

