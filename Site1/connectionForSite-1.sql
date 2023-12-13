drop database link site_link;
create database link site_link
 			connect to system identified by "123456" --[[password = sqlplus password]]
			using '(DESCRIPTION =
       				   (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP) (HOST = 192.168.105.17) (PORT = 1622)))
      				   (CONNECT_DATA = (SID = XE))
    			       )' ; 
 
