from cryptography.fernet import Fernet
import base64

class Constants:
    e_host = 
    e_port = 
    e_database = 
    e_user =
    e_password  = 

    host =
    port = 
    database = 
    user = 
    password  = 
    

    def generate_and_save_key(self, key_filename="secret.key"):
        """Generates a key and saves it to a file."""
        key = Fernet.generate_key()
        with open(key_filename, "wb") as key_file:
            key_file.write(key)
        print(f"New key generated and saved to {key_filename}")

    def load_key(self, key_filename="secret.key"):
        """Loads the key from the current directory's file."""
        return open("secret.key", "rb").read()
    
    
    def encrypt(self, string):
        # You only need to run this once to create the key file
        #self.generate_and_save_key() 
        # Load the key from the file
        key = self.load_key()
        f = Fernet(key)
        # Strings must be encoded to bytes before encryption
        encoded_string = string.encode()
        # Encrypt the bytes
        encrypted_bytes = f.encrypt(encoded_string)
        # The result is bytes, often stored or transmitted as a base64 encoded string
        return base64.urlsafe_b64encode(encrypted_bytes).decode('utf-8')

    def decrypt(self, string):
        key = self.load_key()
        f = Fernet(key)
        encoded_string = string.encode()
        decrypted_bytes = f.decrypt(base64.urlsafe_b64decode(encoded_string).decode('utf-8'))
        return decrypted_bytes.decode()


const = Constants()
print(f"Encrypted host : {const.encrypt(Constants.host)}")
print(f"Encrypted port : {const.encrypt(Constants.port)}")
print(f"Encrypted database : {const.encrypt(Constants.database)}")
print(f"Encrypted user : {const.encrypt(Constants.user)}")
print(f"Encrypted password : {const.encrypt(Constants.password)}")


#print(f"Original Host : {const.decrypt(Constants.e_host)}")
#print(f"Original Port : {const.decrypt(Constants.e_port)}")
#print(f"Original Database : {const.decrypt(Constants.e_database)}")
#print(f"Original User : {const.decrypt(Constants.e_user)}")
#print(f"Original password : {const.decrypt(Constants.e_password)}")