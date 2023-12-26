import xml.sax
import xml.sax.handler
import os
import pprint

# code to write the duplicate products in parsed xml into the xml file and validating it with xsd 
pp = pprint.PrettyPrinter(width=100)

class SaxHandler(xml.sax.ContentHandler):
    def __init__(self):
        self.duplicate_products = []
        self.products = []
        self.details = "" 
        self.in_article = False

    def startElement(self,name,attrs):
        if name == "article":
            self.current_product = {"id": attrs.getValue("id")}
            self.in_article = True

    def endElement(self, name):
        if name == "article":
            self.products.append(self.current_product)
            self.in_article = False
        elif self.in_article:
            self.current_product[name] = self.details.strip()
            self.details = ""

    def characters(self, content):
        self.details += content

    def duplicateIdsArrayObjs(self):
        encountered_ids = set()
        for product in self.products:
            product_id = product['id']
            if product_id in encountered_ids:
                self.duplicate_products.append({
                    'id':product_id, 
                    'name':product['name'], 
                    'price':product['price'], 
                    'supplier':product['supplier']
                })
            else:
                encountered_ids.add(product_id)

        return self.duplicate_products
    
    def generateXml(self, products):
        xml = '<?xml version="1.0" encoding="UTF-8"?>\n'
        xml += '<deliveries xmlns="urn:myspace:deliveries" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:myspace:deliveries ../deliveries.xsd">\n'
        for product in products:
            xml += f"<article id='{product['id']}'>\n"
            for key, value in product.items():
                if key != 'id':
                    xml += f"   <{key}>{value}</{key}>\n"
            xml += "</article>\n"
        xml += "</deliveries>"
        return xml

handler = SaxHandler()

parent_dir = os.path.abspath(os.path.join(os.getcwd(), "../"))

# Specify the file path of the XML file using the parent directory path
file_path = os.path.join(parent_dir, "deliveries.xml")

# Parse the XML file using the handler
xml.sax.parse(file_path, handler)
# array of duplicates in the XML file
duplicatesArray = handler.duplicateIdsArrayObjs()
#generate xml using the duplicatesArray
duplicateXML = handler.generateXml(duplicatesArray)

# check 
# pp.pprint(duplicateXML)
# pp.pprint(duplicatesArray)

# write file to the script dir
script_directory = os.path.dirname(os.path.abspath(__file__))
xml_path = os.path.join(script_directory, "duplicate_deliveries.xml")

# Write the formatted XML content to a file
with open(xml_path, "w") as file:
    file.write(duplicateXML)