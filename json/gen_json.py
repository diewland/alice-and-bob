import csv, json
from pprint import pprint as pp

CSV_PATH    = "./alice-and-bob.csv"
JSON_PATH   = "../../alice-and-bob-assets/json/{}.json"
IMG_PATH    = "https://diewland.github.io/alice-and-bob-assets/assets/GNS_{:02}_50.png"
ENGINE      = "Jigsaw Engine"
METADATA    = {
  "name"        : "***",
  "description" : "***",
  "image"       : "***",
  "attributes"  : "***",
  "compiler"    : ENGINE,
}

TRAITS = [
    "Gen",
    "Class",
    "Type",
    "Accessory",
    "Event",
    "Gang",
]

with open(CSV_PATH) as csvfile:
    rows = csv.DictReader(csvfile)
    for row in rows:
        id = int(row["ID"])

        # craft attributes
        attrs = []
        for t in TRAITS:
            v = row[t]
            if v != "":
                attrs.append({
                    "trait_type": t,
                    "value": v,
                })

        METADATA["name"]        = row["Name"]
        METADATA["description"] = row["Desc"]
        METADATA["image"]       = IMG_PATH.format(id)
        METADATA["attributes"]  = attrs

        # write json file
        outpath = JSON_PATH.format(id)
        with open(outpath, "w") as f:
            json.dump(METADATA, f)
            print(outpath)
