import mysql.connector
from tabulate import tabulate
import random

myobj=mysql.connector.connect(host="localhost",user="root",passwd="Visheshg@2412",database="ars")
if myobj.connect:
    print(" ")
    print("✈✈✈✈WELCOME TO AIRLINE RESERVATION SYSTEM PROGRAM✈✈✈✈".center(430))                                                                
else:
    print("Database Connection Problem")

myc=myobj.cursor()

def login():
    username=input("\nEnter Your USER-ID:  ")
    password=input("\nEnter your PASSWORD: ")
    q1="select * from customer where user_id='{}'".format(username)
    myc.execute(q1)
    vg=myc.fetchall()
    
    if username=="admin" and password=="admin":
        admin()

    elif vg==[]:
        print("\nInvalid USER ID")

    elif vg[0][1]==password:
        print("\nYou have successfully logged in !!!")
        main(username)
        
    else:
        print("\nInvalid Password")
        
def main(x):
    username=x
    
    print("\nSelect any one of the below options:")
    print(" ")
    a=["1 → BOOK A TICKET"]
    b=["2 → FLIGHT INFORMATION"]
    c=["3 → BOOKING STATUS"] 
    d=["4 → EDIT YOUR PROFILE"]
    e=["5 → CANCEL YOUR BOOKING"]
    f=["6 → LOGOUT"]
    g=[a,b,c,d,e,f]
    print(tabulate(g,tablefmt="fancy_grid"))

    choice2=input("\nEnter your Choice: ")
    if choice2=='1':
        book(username)
    elif choice2=='2':
        info(username)
    elif choice2=='3':
        b_status(username)
    elif choice2=='4':
        edit(username)
    elif choice2=='5':
        cancel(username)
    elif choice2=='6':
        print("\nLogging Out")
    else:
        print("\nWrong Choice :(")
        main(username)

        
def book(x):
    try:
        count=int(input("\nEnter the Number of Passengers:"))
        for i in range(count):
            print("\n")
            print("\nPlease fill the required fields for Passenger #",i+1,sep='')
            name=input("\nEnter your Full Name:")
            if name=="":
                print("\nNo field can be empty")
                main(x)
            try:
                age=int(input("\nEnter your Age:"))
            except ValueError:
                print("\nEnter a number only !!!")
                main(x)
            gend=input("\nEnter your Gender(M/F/O):")
            if gend=="":
                print("\nNo field can be empty")
                main(x)
            adhc1=input("\nEnter your Aadhar Card No.:")
            adhc=str(adhc1)
            if adhc=="":
                print("\nNo field can be empty")
                main(x)
            print("\nOur services are available only for the following destinations:")
            q17="select Arvl from flight"
            myc.execute(q17)
            data=myc.fetchall()
            tup=('Destinations',)
            print(tabulate(data,headers=tup,tablefmt='fancy_grid'))
            
            loca1=input("\nEnter your Desired Destination: ")
            if loca1=="":
                print("\nNo field can be empty")
                main(x)
            date=input("\nEnter the date of travel(YYYY-MM-DD): ")
            if date=="":
                print("\nNo field can be empty")
                main(x)
            seatno=seat_assg(x)
    
            print("\nSelect Seating Class\n1 → Economy\n2 → Business")
            choice1=input("\nEnter your Choice: ")
            if choice1=='1':
                sclass="Economy"
            elif choice1=='2':
                sclass="Business"
            else:
                print("\nWrong Choice :(")
                main(x)

            table=''
            if loca1.lower()=="chennai":
                table="ic94"
                arvl_time='0530'
                dprt_time='0000'
            elif loca1.lower()=="dubai":
                table="id95"
                arvl_time='1400'
                dprt_time='2220'
            elif loca1.lower()=="kolkata":
                table="ik96"
                arvl_time='0845'
                dprt_time='1315'
            elif loca1.lower()=="mumbai":
                table="im97"
                arvl_time='0300'
                dprt_time='0430'
            elif loca1.lower()=="new delhi":
                table="in98"
                arvl_time='0445'
                dprt_time='0630'

            
            if table=='':
                print("\nSorry, our services are not available for",loca1)
                main(x)
            else:
                q2="insert into {} values({},'{}',{},'{}','{}','{}','{}','{}','{}','{}')".format(table,adhc,name,age,gend.upper(),date,seatno,sclass,x,dprt_time,arvl_time)
                myc.execute(q2)
                myc.execute("COMMIT")
                count+=1
                print("\nTicket Successfully Booked")
      
                print("\nYour Seat No. is",seatno)
        main(x)
        
    except ValueError:
        print("\nPlease enter a number only !!!")
        main(x)

def info(x):
    print("\nOur services are available only for the following destinations:")
    print(" ")
    q17="select Arvl from flight"
    myc.execute(q17)
    data=myc.fetchall()
    tup=('Destinations',)
    print(tabulate(data,headers=tup,tablefmt='fancy_grid'))
    flight_name=input("\nEnter your Destination:")
    q3="select * from flight where Arvl='{}'".format(flight_name)
    myc.execute(q3)
    record=myc.fetchall()
    if record==[]:
        print("\nNo flight available for '",flight_name,"' :(")
        main(x)
    else:
        heading=('Flight No.','From','To','Departure Time','Reach Time')
        print(" ")
        print(tabulate(record,headers=heading,tablefmt='fancy_grid'))
        main(x)

def b_status(x):
    loca1=input("\nEnter your Desired Destination:")
    q14="select F_No, Arvl from flight where Arvl='{}'".format(loca1.title())
    myc.execute(q14)
    check=myc.fetchall()
    if check==[]:
        print("\nEnter a correct destination")
        main(x)
    elif check[0][1]==loca1.title():
        table=check[0][0]
        q4="select * from {} where user_id='{}'".format(table,x)
        myc.execute(q4)
        status=myc.fetchall()
        headings=('Passenger ID','Name','Age','Gender','Date of Flight','Seat No.','Class','User ID','Departure Time','Reach Time')
        if status==[]:
            print("\nNo Booking for the given destination!")
            main(x)
        else:
            print("\nFollowing are the bookings under the User ID",x)
            print(" ")
            print(tabulate(status,headers=headings,tablefmt='fancy_grid'))
            main(x)
    
def edit(x):
    print("\nChoose the field you want to modify")
    print(" ")
    a=["1 → USER ID"]
    b=["2 → PASSWORD"]
    c=["3 → NAME"]
    d=["4 → CONTACT NO."]
    e=["5 → EMAIL ID"]
    f=[a,b,c,d,e]
    print(tabulate(f,tablefmt="fancy_grid"))

    choice3=input("\nEnter Your Choice: ")
    l1=['1','2','3','4','5']

    if choice3 not in l1:
        print("\nWrong choice :(")
        main(x)
    
    else:
        if choice3==l1[0]:
            field='user_id'
        elif choice3==l1[1]:
            field='passwd'
        elif choice3==l1[2]:
            field='name'
        elif choice3==l1[3]:
            field='contact'
        elif choice3==l1[4]:
            field='email'
        
        new=input("\nEnter the new data:")
        print(" ")
        q5="UPDATE customer SET {}='{}' WHERE user_id ='{}'".format(field,new,x)
        myc.execute(q5)
        myc.execute("COMMIT")

        q16="select * from customer where user_id='{}'".format(x)
        myc.execute(q16)
        vg=myc.fetchall()
        headings=('User ID','Password','Name','Contact','E-Mail ID')
        print(tabulate(vg,headers=headings,tablefmt='fancy_grid'))
        print("\nYour data has been Succesfully Updated")
        main(x)

def register():
    name=input("\nEnter your Full Name: ")
    contact=input("\nEnter your Contact No.: ")
    email=input("\nEnter your Email ID: ")
    userid=input("\nCreate User ID: ")
    password=input("\nSet a Password: ")

    q7="select * from customer where user_id='{}'".format(userid)
    myc.execute(q7)
    check=myc.fetchall()
    
    if check==[]:
        q6="insert into customer values('{}','{}','{}','{}','{}')".format(userid,password,name,contact,email)
        myc.execute(q6)
        myc.execute("COMMIT")
        print("\nUser Successfully Registered")
    elif check[0][0]==userid:
        print("\nEntered User ID",userid,"is Unavailable")
        print("\nPlease use another User ID") 

def cancel(x):
    con=input("\nDo you want to Cancel all your bookings?(y/n): ")
    if con.lower()=='y':
        loca1=input("\nEnter your Destinaton: ")
        table=''
        if loca1.lower()=="chennai":
            table="ic94"
        elif loca1.lower()=="dubai":
            table="id95"
        elif loca1.lower()=="kolkata":
            table="ik96"
        elif loca1.lower()=="mumbai":
            table="im97"
        elif loca1.lower()=="new delhi":
            table="in98"

        if table=='':
            print("\nPlease enter correct Destination")
            main(x)
        else:
            q9="select psg_id,psg_name,psg_gdr,psg_age,DOF,psg_seat,seat_class from {} where user_id='{}'".format(table,x)
            myc.execute(q9)
            status=myc.fetchall()
            headings=('Passenger ID','Name','Gender','Age','Date of Flight','Seat No.','Class')
            print(" ")
            print(tabulate(status,headers=headings,tablefmt='fancy_grid'))
            q8="delete from {} where user_id='{}'".format(table,x)
            myc.execute(q8)
            myc.execute("COMMIT")
            print("\nThe above Bookings have been Successfully Cancelled")
            main(x)
    else:
        multiple(x)  

def multiple(y):
    response=True
    while response==True:
        loca1=input("\nEnter your Destinaton: ")
        table=''
        if loca1.lower()=="chennai":
            table="ic94"
        elif loca1.lower()=="dubai":
            table="id95"
        elif loca1.lower()=="kolkata":
            table="ik96"
        elif loca1.lower()=="mumbai":
            table="im97"
        elif loca1.lower()=="new delhi":
            table="in98"

        if table=='':
            print("\nPlease enter correct Destination")
            main(y)
        else:
            name=input("\nEnter the Name of the Passenger: ")
            q9="select psg_id,psg_name,psg_gdr,psg_age,DOF,psg_seat,seat_class from {} where user_id='{}' and psg_name='{}'".format(table,y,name)
            myc.execute(q9)
            status=myc.fetchall()
            headings=('Passenger ID','Name','Gender','Age','Date of Flight','Seat No.','Class')
            print(" ")
            print(tabulate(status,headers=headings,tablefmt='fancy_grid'))
            q8="delete from {} where user_id='{}' and psg_name='{}'".format(table,y,name)
            myc.execute(q8)
            myc.execute("COMMIT")
            print("\nThe above booking has been Successfully Cancelled") 
            can=input("\nDo you want to Cancel one more booking?(y/n): ")
            if can.lower()=='y':
                response=True
            else:
                response=False
                main(y)

def seat_assg(x):
    s_com="ABC"
    s_no="0123456789"
    l1=1
    l2=2
    str1="".join(random.sample(s_com,l1))
    str2="".join(random.sample(s_no,l2))
    x=str1+str2
    return x

def admin():
    input1=input("\nEnter Flight Number:")
    q15="select F_No from flight where F_No='{}'".format(input1)
    myc.execute(q15)
    check=myc.fetchall()
    if check==[]:
        print("\nPlease Enter Correct Flight Number")
    elif check[0][0]==input1.lower():
        table=check[0][0]
        q10="select * from {}".format(input1)
        myc.execute(q10)
        info=myc.fetchall()
        headings=('Passenger ID','Name','Age','Gender','Date of Flight','Seat No.','Class','User ID','Departure Time','Reach Time')
        print("")
        print(tabulate(info,headers=headings,tablefmt='fancy_grid'))

#MAIN
while True:
    print("\nSelect any one of the given options:")
    print("")
    b=[("1 → LOGIN")]
    c=[("2 → REGISTER")]
    d=[("3 → EXIT THE PROGRAM")]
    e=[b,c,d]
    print(tabulate(e,tablefmt='fancy_grid'))
    choice=input("\nEnter your Choice:")
    if choice=='1':
        login()
    elif choice=='2':
        register()
    elif choice=='3':
        print("\nClosing the Program")
        print("\nThanks for Visiting our Site :)")
        break
    else:
        print("\nWrong Choice :( \n")

myc.close()
