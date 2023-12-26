import xml.dom.minidom
import os

parent_dir = os.path.abspath(os.path.join(os.getcwd(),"../"))
file_path = os.path.join(parent_dir,"deliveries.xml")

# parse the xml file via filepath
document = xml.dom.minidom.parse(file_path)

def get_supplies():
    # get the elements from xml
    article_list = document.getElementsByTagName("article")
    supplier_list = document.getElementsByTagName("supplier")
    name_list = document.getElementsByTagName("name")
    suppliers = {}

    for i in range(len(article_list)):
        sup_name = supplier_list[i].firstChild.nodeValue
        supplies = name_list[i].firstChild.nodeValue

        if sup_name in suppliers:
            suppliers[sup_name].append(supplies)    
        else:
            suppliers[sup_name] = [supplies]

    return suppliers

def print_supplies(suppliers):
    for name, supply in suppliers.items():
        print(f"{name} supplies: {' '.join(supply)}")

suppliers = get_supplies()
supplies = print_supplies(suppliers)

