create  or replace trigger biproduct
before insert on product
for each row
declare
	cursor c1 is select * from product;
	z c1%rowtype;
begin
	if(:new.id is null) then
		raise_application_error(-20001,'Product ID should not null');
	end if;
	if(:new.id not like 'P%') then
		raise_application_error(-20002,'Product ID must starts with P');
	end if;	
end;
/