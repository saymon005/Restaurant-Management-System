create or replace view myview(customer_id, name, address, gender) as
select Cid, CName, Address, gndr 
from Customers1 C;
select * from myview;

commit;