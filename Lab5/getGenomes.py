#!/usr/bin/env python3

import json

print("Content-Type: text/html\n")

print("<html>")
print("<head><title>Genome List</title></head>")
print("<body>")
print("<h2>Available UCSC Genomes</h2>")

try:
    with open("/var/www/data/ucscGenomes.json", "r") as f:
        data = json.load(f)

    genomes = data.get("ucscGenomes", {})

    print("<ul>")
    for genome_id, genome_info in genomes.items():
        common = genome_info.get("organism", "Unknown")
        scientific = genome_info.get("scientificName", "Unknown")

        print(
            f"<li> {common} : {common} ({scientific})</li>"
        )
    print("</ul>")

except Exception as e:
    print("<p>Error reading genome data</p>")
    print(f"<pre>{e}</pre>")

print("</body>")
print("</html>")
