import xml.dom.minidom
import os

parent_dir = os.path.abspath(os.path.join(os.getcwd(),"../"))
file_path = os.path.join(parent_dir,"deliveries.xml")

# parse the xml file via filepath
document = xml.dom.minidom.parse(file_path)

# get the elements from xml
article_list = document.getElementsByTagName("article")
name_list = document.getElementsByTagName("name")
price_list = document.getElementsByTagName("price")
supplier_list = document.getElementsByTagName("supplier")

# html table
html_table = "<html><head><title>Deliveries</title></head>\n<body><h1>Deliveries</h1><hr>\n" 
html_table += "<table border=\"1\"><tr><th>Number</th><th>Article</th><th>Price</th><th>Supplier</th></tr>\n"

# Iterate through the articles and retrieve the attributes and the child element values
for i in range(len(article_list)):
    article_id = article_list[i].getAttribute("id")
    article_name = name_list[i].firstChild.nodeValue
    article_price = price_list[i].firstChild.nodeValue
    article_supplier = supplier_list[i].firstChild.nodeValue
    html_table += f"<tr><td>{article_id}</td><td>{article_name}</td><td>{article_price}</td><td>{article_supplier}</td></tr>\n"

html_table += "</table>\n</body>\n</html>"

# write file to the script dir
script_directory = os.path.dirname(os.path.abspath(__file__))
html_path = os.path.join(script_directory, "dom_deliveries.html")

# Write the formatted XML content to a file
with open(html_path, "w") as file:
    file.write(html_table)


