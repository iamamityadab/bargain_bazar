create  or replace trigger bilocation
before insert on location
for each row
declare
	cursor c1 is select * from location;
	z c1%rowtype;
begin
	if(:new.id is null) then
		raise_application_error(-20001,'Location id should not null');
	end if;
	if(:new.id not like 'L%') then
		raise_application_error(-20002,'Location id must starts with L');
	end if;
	for z in c1
	loop
		if(z.id=:new.id)then
			raise_application_error(-20003,'Location id already exist');
		end if;	
	end loop;
end;
/