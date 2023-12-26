import xml.sax
import xml.sax.handler
import os


# code to write the parsed xml in the formatted file in HTML table structure.
 
class SaxHandler(xml.sax.ContentHandler):
    def __init__(self):
        self.articles = []
        self.current_article = {}
        self.current_data = ""
        self.in_article = False

    def startElement(self, name, attrs):
        if name == "article":
            self.current_article = {"id": attrs.getValue("id")}
            self.in_article = True

    def endElement(self, name):
        if name == "article":
            self.articles.append(self.current_article)
            self.in_article = False
        elif self.in_article:
            self.current_article[name] = self.current_data.strip()
            self.current_data = ""

    def characters(self, content):
        self.current_data += content

    def generate_html(self):
        html_output = "<html><head><title>Deliveries</title></head>\n<body><h1>Deliveries</h1><hr>\n"
        html_output += "<table border=\"1\"><tr><th>Number</th><th>Article</th><th>Price</th><th>Supplier</th></tr>\n"

        for article in self.articles:
            html_output += f"<tr><td>{article.get('id')}</td><td>{article.get('name')}</td><td>{article.get('price')}</td><td>{article.get('supplier')}</td></tr>\n"

        html_output += "</table>\n</body>\n</html>"
        return html_output

handler = SaxHandler()

parent_dir = os.path.abspath(os.path.join(os.getcwd(), "../"))

# Specify the file path of the XML file using the parent directory path
file_path = os.path.join(parent_dir, "deliveries.xml")

# Parse the XML file using the handler
xml.sax.parse(file_path, handler)
html_output = handler.generate_html()

# write file to the script dir
script_directory = os.path.dirname(os.path.abspath(__file__))
html_path = os.path.join(script_directory, "formatted_deliveries.html")

# Write the formatted XML content to a file
with open(html_path, "w") as file:
    file.write(html_output)






# class DeliveriesHandler(xml.sax.ContentHandler):
#     def __init__(self):
#         self.articles = []

#     def startElement(self, name, attrs):
#         if name == "article":
#             self.current_article = {}
#             self.current_article["id"] = attrs["id"]
#         elif name in ["name", "price", "supplier"]:
#             self.current_data = name

#     def characters(self, content):
#         if self.current_data in ["name", "price", "supplier"]:
#             self.current_article[self.current_data] = content.strip()

#     def endElement(self, name):
#         if name == "article":
#             self.articles.append(self.current_article)
#         self.current_data = ""

#     def generate_html(self):
#         html = (
#             "<html><head><title>Deliveries</title></head>"
#             "<body><h1>Deliveries</h1><hr><table border='1'>"
#             "<tr><th>Number</th><th>Article</th><th>Price</th><th>Supplier</th></tr>"
#         )
#         for article in self.articles:
#             html += (
#                 f"<tr><td>{article['id']}</td>"
#                 f"<td>{article['name']}</td>"
#                 f"<td>{article['price']}</td>"
#                 f"<td>{article['supplier']}</td></tr>"
#             )
#         html += "</table></body></html>"
#         return html

# # Parsing XML file and generating HTML
# handler = DeliveriesHandler()

# parent_dir = os.path.abspath(os.path.join(os.getcwd(), "../"))

# # Specify the file path of the XML file using the parent directory path
# file_path = os.path.join(parent_dir, "deliveries.xml")

# # Parse the XML file using the handler
# xml.sax.parse(file_path, handler)
# html_output = handler.generate_html()

# # Writing HTML output to a file
# with open("deliveries.html", "w") as file:
#     file.write(html_output)
