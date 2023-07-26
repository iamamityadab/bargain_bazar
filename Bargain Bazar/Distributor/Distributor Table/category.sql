create  or replace trigger bicategory
before insert on category
for each row
declare
	cursor c1 is select * from category;
	z c1%rowtype;
begin
	if(:new.id is null) then
		raise_application_error(-20001,'Category ID should not null');
	end if;
	if(:new.id not like 'C%') then
		raise_application_error(-20002,'Category ID must starts with C');
	end if;	
end;
/