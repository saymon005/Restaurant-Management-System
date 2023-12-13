drop database link site_link;
create database link site_link
 	connect to system identified by "12345" --[[password = sqlplus password]]
	using '(DESCRIPTION =
       				   (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP) (HOST = 192.168.177.187) (PORT = 1622)))
      				   (CONNECT_DATA = (SID = XE))
    			       )' ; 
 
