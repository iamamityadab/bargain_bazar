create  or replace trigger bicustomer
before insert on customer
for each row
declare
	cursor c1 is select * from customer;
	z c1%rowtype;
begin
	if(:new.id is null) then
		raise_application_error(-20001,'Customer id should not null');
	end if;
	if(:new.id not like 'C%') then
		raise_application_error(-20002,'Customer id must starts with C');
	end if;
	for z in c1
	loop
		if(z.id=:new.id)then
			raise_application_error(-20003,'Customer id already exist');
		end if;	
	end loop;
end;
/