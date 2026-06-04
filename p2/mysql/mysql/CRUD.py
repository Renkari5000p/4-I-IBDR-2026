
from MyDataBase import MyDatabase
from Constants import Constants

class CRUD:
    const = Constants()
    conn = MyDatabase(
            const.decrypt(Constants.e_host),
            int(const.decrypt(Constants.e_port)),
            const.decrypt(Constants.e_database),
            const.decrypt(Constants.e_user),
            const.decrypt(Constants.e_password)
        )
    
    def create_profile(self):
        sql  = '''create table profile (
        idx int not null primary key,
          name varchar(50) not null,
          alias varchar(50) not null,
            token varchar (50) not null,
              birthdate date not null,
              email varchar (50) not null, 
              lang_code varchar(50) not null,
                `routine` varchar(50) not null,
                alarm int not null,
                  inactivity_time time not null,
                  inactivity_type time not null
                  )'''
        result = self.conn.query(sql)
        print(result)

    def get_profile(self):
        sql = "SELECT idx, name, alias, token, birthdate, email, lang_code, `routine`, alarm, inactivity_time, inactivity_type" \
        " FROM defaultdb.profiles;"
        result = self.conn.query(sql) 
        print(result)

    def set_profile(self, name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type):
        sql = "INSERT INTO defaultdb.profiles " \
        "(idx, name, alias, token, birthdate, email, lang_code, `routine`, alarm, inactivity_time, inactivity_type) " \
        "VALUES(0, '{1,carlos,Renkari5000p,040904,123,carlos@,py,work and school,5:00,2h,papaya}', '{1,job,rolloatomico,530,050409,job@,c++,martubation and sex,4:00,05,}', '{}', {}, '{}', '{}', {}, {}, {}, {});".format(
            name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type
            )

    def update_profile(self, name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type, idx):
        sql = "UPDATE defaultdb.profiles " \
        "SET name='{}', alias='{}', token='{}', birthdate={}, email='{}', lang_code='{}', `routine`={}, alarm={}, inactivity_time={}, inactivity_type={} " \
        "WHERE idx={};".format(
            name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type, idx
            )

    def delete_profile(self, idx):
        sql = "DELETE FROM defaultdb.profiles " \
        "WHERE idx={};".format(idx)
crud=CRUD()
#crud.create_profile()
crud.set_profile('carlos','Renkari5000p','04-09-04','123','carlos@','py','work and school',str(5),,)