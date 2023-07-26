create  or replace trigger bisupplier
before insert on supplier
for each row
declare
	cursor c1 is select * from supplier;
	z c1%rowtype;
begin
	if(:new.id is null) then
		raise_application_error(-20001,'Supplier ID should not null');
	end if;
	if(:new.id not like 'S%') then
		raise_application_error(-20002,'Supplier ID must starts with S');
	end if;	
end;
/
