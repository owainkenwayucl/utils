#!/usr/bin/env python3

def run(command):
    import subprocess
    return subprocess.run(command, capture_output=True, encoding='UTF-8')

def empty_get(data, key):
    if key not in data.keys():
        return ""
    else:
        return str(data[key]).strip()

def pad(s, w):
    r = len(s)
    s = s + ((w-r) * " ")
    return s

# This routine draws a table from a list of dicts. It's horrifying.
# In my defence I'm extremely sick while writing this.
def draw_table(data):
    table = ""
    columns = {}
    for a  in data:
        k = a.keys()
        for b in k:
            if b not in columns.keys():
                columns[b] = len(b)
            if len(a[b]) > columns[b]:
                columns[b] = len(a[b])

    tw = 2
    for a in columns.keys():
        tw = tw + columns[a] + 3
    tw = tw -1 
    line = tw*"-"+"\n"
    table = table + line 
    table = table + "| "
    for a in columns.keys():
        table = table + pad(a, columns[a]) + " | "
    table = table + " \n"
    table = table + line
    for b in data:
        table = table + "| "
        for a in columns.keys():
            table = table + pad(empty_get(b,a), columns[a]) + " | "
        table = table + " \n" 
    table = table + line
    return table

def process_json(js):
    import json
    arr = json.loads(js)
    r = []

    rkeys = ["ID", "Name", "Owner", "Status", "IP address"]
    for a in arr:
        ld = {}
        for b in range(len(rkeys)):
            t = a[b]
            if t == None:
                t = "-"
            ld[rkeys[b]] = t
        r.append(ld)

    return r

if __name__=="__main__":
    import sys

    command = ["aws", "ec2", "describe-instances", "--query", 'Reservations[*].Instances[].[InstanceId,Tags[?Key==`Name`]|[0].Value,Tags[?Key==`Owner`]|[0].Value,State.Name,PublicIpAddress]', "--output=json"]


    try:
        response = run(command)
        js = response.stdout

    except:
        print(response.stderr)
        sys.exit(1)

    print(draw_table(process_json(js)))