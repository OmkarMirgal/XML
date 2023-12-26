# Write a SAX parser, that re-prints the XML document, but creates the indentation with a 3-space indent.

# Note: Actually solve the task using xml.sax and xml.sax.SaxHandler, not using any other XML module!

# Hint: The actual xml file currently uses tabs for indentation.

# Use the following code as a starting point:



import xml.sax
import xml.sax.handler
import os



# code to write the parsed xml in the formatted file with 3 indentation space.
class SaxHandler(xml.sax.handler.ContentHandler):
    def __init__(self):
        self.depth = 0  # Track the depth of elements
        self.xml_output = ""  # String to hold formatted XML

    def startElement(self,name,attrs):
        attribute_str = ''.join([f' {attr_name}="{"urn:myspace:deliveries ../deliveries.xsd" if attr_name == "xsi:schemaLocation" else attr_value}"' for attr_name, attr_value in attrs.items()]) # iterate attrs and create string of key-value pairs of all attributes and also check and update the xsd path to validate the xml
        self.xml_output += "\n" + "   " * self.depth + f"<{name}{attribute_str}>"
        self.depth += 1 # Increment depth for nested elements

    def endElement(self, name):
        self.depth -= 1  # Decrement depth after handling an element
        if name == "article":
            self.xml_output += "\n" + "   " * self.depth + f"</{name}>"  # Indent based on depth
        else:    
            self.xml_output += "" * self.depth + f"</{name}>"  # Indent based on depth

    def characters(self, content):
        content = content.strip()
        if content:
            self.xml_output += "" * (self.depth + 1) + f"{content}"  # Append content with appropriate indentation

handler = SaxHandler()

parent_dir = os.path.abspath(os.path.join(os.getcwd(), "../"))

# Specify the file path of the XML file using the parent directory path
file_path = os.path.join(parent_dir, "deliveries.xml")

# Parse the XML file using the handler
xml.sax.parse(file_path, handler)

#write file to the script path
script_directory = os.path.dirname(os.path.abspath(__file__))
script_path = os.path.join(script_directory, "formatted_deliveries.xml")

# Write the formatted XML content to a file
with open(script_path, "w") as file:
    file.write('<?xml version="1.0" encoding="UTF-8"?>\n')
    file.write(handler.xml_output)










#code to just parse the xml with 3 indentation space
# class SaxHandler(xml.sax.handler.ContentHandler):
#     def __init__(self):
#         self.depth = 0  # Track the depth of elements
        
#     def startElement(self, name, attrs):
#         print("   " * self.depth + f"<{name}", end="")  # Start element tag with attributes
#         for attr_name, attr_value in attrs.items():
#             print(f' {attr_name}="{attr_value}"', end="")
#         print(">")
#         self.depth += 1  # Increment depth for nested elements

#     def endElement(self, name):
#         self.depth -= 1  # Decrement depth after handling an element
#         print("   " * self.depth + f"</{name}>")  # Indent based on depth

#     def characters(self, content):
#         content = content.strip()
#         if content:
#             print("   " * (self.depth + 1) + content)  # Print content with appropriate indentation

# handler = SaxHandler()

# parent_dir = os.path.abspath(os.path.join(os.getcwd(), "../"))

# # Specify the file path of the XML file using the parent directory path
# file_path = os.path.join(parent_dir, "deliveries.xml")

# # Parse the XML file using the handler
# xml.sax.parse(file_path, handler)
