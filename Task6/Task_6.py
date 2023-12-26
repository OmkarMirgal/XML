import xml.dom.minidom
import random, os

parent_dir = os.path.abspath(os.path.join(os.getcwd(),"../"))
file_path = os.path.join(parent_dir,"deliveries.xml")

# parse the xml file via filepath
document = xml.dom.minidom.parse(file_path)

# get the elements from xml
article_list = document.getElementsByTagName("article")
name_list = document.getElementsByTagName("name")
price_list = document.getElementsByTagName("price")
supplier_list = document.getElementsByTagName("supplier")
article = {}

# get duplicate ids from xml 
def get_duplicateIds():
    
    duplicate_articles = {}
    for i in range(len(article_list)):
        article_id = article_list[i].getAttribute("id")        
        article_name = name_list[i].firstChild.nodeValue
        article_price = price_list[i].firstChild.nodeValue
        article_supplier = supplier_list[i].firstChild.nodeValue

        article_data = {
            "id": article_id,
            "name": article_name,
            "price": article_price,
            "supplier" : article_supplier
        }
        if article_id in article:
            # duplicate_articles[article_id].append(article_data)
            duplicate_articles.setdefault(article_id, []).append(article_data)
        else: 
            article[article_id] = article_data

    return duplicate_articles

def fix_duplicateIds(duplicates):
    for duplicate in duplicates.values():
        for  duplicate_id in duplicate:
            # Generate a random ID
            new_id = random_id(article)
            duplicate_id["id"] = f'{new_id}'
            article[duplicate_id["id"]] = duplicate_id

    return article

def generate_fixed_xml(article):
    xml_output = ""
    xml_output += '<?xml version="1.0" encoding="UTF-8"?>\n'
    xml_output += '<deliveries xmlns="urn:myspace:deliveries" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:myspace:deliveries ../deliveries.xsd">\n'

    for value in article.values():
        xml_output += f"   <article id='{value['id']}'>\n"
        for key, value in value.items():
            if key != 'id':
                xml_output += f"      <{key}>{value}</{key}>\n"
        xml_output += "   </article>\n"
    xml_output += "</deliveries>"
    return xml_output

def random_id(article): 
    new_id = random.randint(10000, 99999)
    
    # Ensure the new ID is unique and not in articles' keys
    while new_id in article.keys():
        new_id = random.randint(10000, 99999)
    
    return new_id

duplicates = get_duplicateIds()
fixed = fix_duplicateIds(duplicates)
# print(fixed)
fixed_xml = generate_fixed_xml(article)
# print(fixed_xml)


# write file to the script dir
script_directory = os.path.dirname(os.path.abspath(__file__))
xml_path = os.path.join(script_directory, "fixed_deliveries.xml")

# Write the formatted XML content to a file
with open(xml_path, "w") as file:
    file.write(fixed_xml)
















#duplicates
# {
#     '7866': [   
#         {'id': '7866', 'name': 'cherries', 'price': '17.67', 'supplier': 'Krause Inc.'},
#         {'id': '7866', 'name': 'cherries', 'price': '16.45', 'supplier': 'Hoeller Inc.'}, 
#         {'id': '7866', 'name': 'cherries', 'price': '12.45', 'supplier': 'Richard Inc.'}
#     ],
#     '3526': [
#         {'id': '3526', 'name': 'apple', 'price': '9.54', 'supplier': 'Mertes Inc.'}
#     ]
# }


#fixed article with random ids to the duplicates 
# {
#     #existing unique article ids
#     '3526': {'id': '3526', 'name': 'apple', 'price': '8.97', 'supplier': 'Krause Inc.'}, 
#     '7866': {'id': '7866', 'name': 'cherries', 'price': '10.45', 'supplier': 'Helbig Inc.'}, 
#     '4444': {'id': '4444', 'name': 'apple', 'price': '12.67', 'supplier': 'Liebig Inc.'}, 
#     '7868': {'id': '7868', 'name': 'cabbage', 'price': '3.20', 'supplier': 'Hoeller Inc.'}, 
#     '3245': {'id': '3245', 'name': 'bpineapple', 'price': '15.67', 'supplier': 'Hoeller Inc.'}, 
#     '6745': {'id': '6745', 'name': 'cabbage', 'price': '3.10', 'supplier': 'Reinhardt Inc.'}, 
#     '7789': {'id': '7789', 'name': 'pineapple', 'price': '8.60', 'supplier': 'Richard Inc.'}, 
    
#     #duplicateIds fixed with random numbers unique to existing article ids
#     '33490': {'id': '33490', 'name': 'cherries', 'price': '17.67', 'supplier': 'Krause Inc.'}, 
#     '11439': {'id': '11439', 'name': 'cherries', 'price': '16.45', 'supplier': 'Hoeller Inc.'}, 
#     '85963': {'id': '85963', 'name': 'cherries', 'price': '12.45', 'supplier': 'Richard Inc.'}, 
#     '17760': {'id': '17760', 'name': 'apple', 'price': '9.54', 'supplier': 'Mertes Inc.'}
# }