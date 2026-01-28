from lxml import etree

xml_file = "book.xml"
xsd_file = "book.xsd"

#loading xml
with open(xsd_file, "rb") as f:
    schema_root = etree.XML(f.read())

schema = etree.XMLSchema(schema_root)

#loading xml
xml_doc = etree.parse(xml_file)

#validating
if schema.validate(xml_doc):
    print("XML is VALID according to given XSD")
else:
    print("XML is INVALID according to given XSD")
    for error in schema.error_log:
        print(error.message)

