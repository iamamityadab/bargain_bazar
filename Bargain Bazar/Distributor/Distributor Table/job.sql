create  or replace trigger bijob
before insert on job
for each row
declare
	cursor c1 is select * from job;
	z c1%rowtype;
begin
	if(:new.job_id is null) then
		raise_application_error(-20001,'Job id should not null');
	end if;
	if(:new.salary not between 10000 and 50000) then
		raise_application_error(-20004,'Job salary must between 10000 and 50000');
	end if;
	if(:new.job_id not like 'E%') then
		raise_application_error(-20002,'Job id must starts with E');
	end if;
	for z in c1
	loop
		if(z.job_id=:new.job_id)then
			raise_application_error(-20003,'Job id already exist');
		end if;	
	end loop;
end;
/

