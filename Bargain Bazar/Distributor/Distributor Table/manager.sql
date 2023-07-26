create  or replace trigger bimanager
before insert on manager
for each row
declare
	cursor c1 is select * from manager;
	z c1%rowtype;
begin
	if(:new.fname is null) then
		raise_application_error(-20001,'Manager Fname should not null');
	end if;
	if(:new.lname is null) then
		raise_application_error(-20002,'Manager Fname should not null');
	end if;
	
end;