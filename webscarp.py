import requests
# from io import BytesIO
# import lxml.html
from bs4 import BeautifulSoup
from PIL import Image
import pytesseract as pytess
pytess.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'
import mysql.connector
from datetime import datetime, date

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database="webscraping"
)
mycursor = mydb.cursor()
sql = "INSERT INTO drt_cases_list (diary_no, case_type, case_no, dof, applicant_name, respondent_name, application_advocate, respondent_advocate) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"

# now = datetime.now()

session = requests.Session()
# print(f" Session start : {session}")
captchaResponse = session.get("https://drt.gov.in/front/captcha.php")

with open('captchaimage.jpg', 'wb') as f:
    f.write(captchaResponse.content)
    
img = Image.open('captchaimage.jpg')
captchaText = pytess.image_to_string(img)
# print(captchaText)

url = "https://drt.gov.in/front/page1_advocate.php"
headers = {"user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36"}
post_data = {"method": "POST", "schemaname": "11", "name":"kapil","answer":int(captchaText),"submit11":"Search"}

r = session.post(url, data = post_data, headers = headers)

htmlContent = r.content

htmlsoup = BeautifulSoup(htmlContent, 'html.parser')

tableContent = htmlsoup.find('table', attrs={"width":"550px"}) #htmlsoup.find_all('div', class_='col-md-12')

# for tableheading in tableContent('thead'):
#     tableHeadingTr = tableheading.find('tr').text
    # print(tableHeadingTr)
    
rowdata = []
caseDetails = []
for tableBody in tableContent('tbody'):
    tableBodyTr = tableBody.find_all('tr')
    for bodyRows in tableBodyTr:
        diaryNo = bodyRows.find_all('td')[0].text.replace('\n', '')
        case_no = bodyRows.find_all('td')[1].text.replace('\n', '')
        dof = bodyRows.find_all('td')[2].text.replace('\n', '')
        dof = dof.replace(" ", "")
        formatted_date = datetime.strptime(dof, '%d/%m/%Y')
        applicant_name = bodyRows.find_all('td')[3].text.replace('\n', '')
        respondent_name = bodyRows.find_all('td')[4].text.replace('\n', '')
        application_advocate = bodyRows.find_all('td')[5].text.replace('\n', '')
        respondent_advocate = bodyRows.find_all('td')[6].text.replace('\n', '')
        case_details_link = bodyRows.find_all('td')[7]
        casehref = case_details_link.find('a').get('href')
        casehref = casehref.split("'")
        caseDetails.append(casehref[1])
        case_type = ''
        rowdata.append((diaryNo, case_type, case_no, formatted_date, applicant_name, respondent_name, application_advocate, respondent_advocate))

# we can add case details data here #
caseDeatilsUrl = ''
for drtcase in caseDetails:
    # print(drtcase)
    caseDeatilsUrl = 'https://drt.gov.in/drtlive/Misdetailreport.php?no=' + drtcase
    caser = session.post(caseDeatilsUrl, headers = headers)

    casehtmlContent = caser.content

    casehtmlsoup = BeautifulSoup(casehtmlContent, 'html.parser')
    condensedtableContent = casehtmlsoup.find_all('table')
    condensedtableContent1 = condensedtableContent[2]
    condensedTr = condensedtableContent1.find_all('tr')
    for condensedbodyRows in condensedTr:
            courtName1 = condensedbodyRows.find_all('td')
            # print(courtName1)
            # with open('htmlcontent.html', 'w') as f:
            #     f.write(f"{courtName1}")
    


mycursor.executemany(sql, rowdata)
mydb.commit()

# print(f" Session end : {session}")

# print(tableHeadingTr)


