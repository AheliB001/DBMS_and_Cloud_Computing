import urllib.request
import json
import urllib.parse

"""cred_file = "/home/ibab/proxy_creds.txt"
proxy = "Aheli%4014344@proxy.ibab.ac.in:3128"

with open(cred_file, "r") as f:
    username = f.readline().strip()
    pwd = f.readline().strip()

user = urllib.parse.quote(username, safe='')
pwd = urllib.parse.quote(pwd, safe='')

proxy_url = f"http://{user}:{pwd}@{proxy}"

proxy_handler = urllib.request.ProxyHandler({
    "http": proxy_url,
    "https": proxy_url
})

opener = urllib.request.build_opener(proxy_handler)
urllib.request.install_opener(opener)
"""

API_URL = "http://api.genome.ucsc.edu/list/ucscGenomes"
OUT_FILE = "/home/ibab/ucscGenomes.json"


try:
    with urllib.request.urlopen(API_URL) as response:
        raw = response.read().decode("utf-8")
        data = json.loads(raw)
        print(data)

    with open(OUT_FILE, "w") as f:
        json.dump(data, f, indent=2)

    print(f"Saved ucsc Genomes data to {OUT_FILE}")

except Exception as e:
    print("Error occurred:", e)