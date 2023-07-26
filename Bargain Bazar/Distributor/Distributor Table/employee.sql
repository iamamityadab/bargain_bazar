create  or replace trigger biemployee
before insert on employee
for each row
declare
	cursor c1 is select * from employee;
	z c1%rowtype;
begin
	if(:new.id is null) then
		raise_application_error(-20001,'Employee id should not null');
	end if;
	if(:new.id not like 'E%') then
		raise_application_error(-20002,'Employee id must starts with E');
	end if;
	for z in c1
	loop
		if(z.id=:new.id)then
			raise_application_error(-20003,'Employee id already exist');
		end if;	
	end loop;
end;
/