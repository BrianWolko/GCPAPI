import csv

with open('.\csvFiles\hired_employees.csv', newline='',encoding='UTF-8') as csvfile:
    reader = csv.DictReader(csvfile)
#TEST if file was sucessfully loaded
    for row in reader:
        print(row)