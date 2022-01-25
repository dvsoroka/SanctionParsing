--��������� ���� ������� �� ����� json � ���� �������(� from ����� ������� ���������� ��� ������������� ���� � �����)

drop procedure sanctions.sp_fill_entities_with_json();

���� � json �� �������� ������

create or replace procedure sanctions.sp_fill_entities_with_json()
language plpgsql as
$$
begin
		create temporary table  temp_json (value json) on commit drop;
		copy temp_json from 'D:\Downloads\veteranius\veteranius-vcs\vcs\SanctionParsing\SanctionParsing\dba\Entities.json';
		insert into sanctions.entities
			(select 
				value->>'caption',
				array[value->>'datasets'],
				value->>'first_seen',
				value->>'id',
				value->>'last_seen',
				array[value->>'referents'],
				value->>'schema',
				value->>'target'
					from temp_json);
end;
$$;

call sanctions.sp_fill_entities_with_json();
SQL Error [22P02]: ������: �������� ��������� ��� ���� json
  Detail: ����������� ����� ������� ������.
  Where: ������ JSON, ������ 1: ...-61"], "schema": "Organization", "target": true},
COPY temp_json, ������ 1, ������� value: "[{"caption": "Ministu00e9rio do Interior", "datasets": ["eu_fsf"], "first_seen": "2021-09-26T14:52:1..."
SQL-��������: "copy temp_json from 'D:\Downloads\veteranius\veteranius-vcs\vcs\SanctionParsing\SanctionParsing\dba\Entities.json'"
������� PL/pgSQL sanctions.sp_fill_entities_with_json(), ������ 4, �������� SQL-��������

--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
���� � ����� ����� �������� � json �� �������� ������

create table  temp_json (value text);
		copy temp_json from 'D:\Downloads\veteranius\veteranius-vcs\vcs\SanctionParsing\SanctionParsing\dba\Entities.json';
	insert into sanctions.entities(
				caption ,
				datasets  ,
				first_seen ,
				id ,
				last_seen ,
				referents  ,
				schema ,
				target )
					(select 
						value->>'caption',
						array[value->>'datasets'],
						value->>'first_seen',
						value->>'id',
						value->>'last_seen',
						array[value->>'referents'],
						value->>'schema',
						value->>'target'
							from      (select value::json from temp_json)as t);
--						
--						SQL Error [22P02]: ������: �������� ��������� ��� ���� json
--  Detail: ����������� ����� ������� ������.
--  Where: ������ JSON, ������ 1: ...-61"], "schema": "Organization", "target": true}


delete from sanctions.entities ;

select * from sanctions.entities e ;

create or replace procedure sanctions.sp_fill_entities_with_json(in_json_entities json)
language plpgsql as
$$
begin
	insert into sanctions.entities (
	caption,
	datasets,
	first_seen,
	id,
	last_seen,
	referents,
	schema,
	target)
		(select * from json_to_recordset
	($1) as x
	(caption text,
	datasets text array,
	first_seen text,
	id text,
	last_seen text,
	referents text array,
	schema text,
	target text));
end;
$$;

call sanctions.sp_fill_entities_with_json('[{"caption": "Minist\u00e9rio do Interior", "datasets": ["eu_fsf"], "first_seen": "2021-09-26T14:52:11", "id": "NK-2QtbU49vp9LkfKRjd8WQni", "last_seen": "2021-12-19T03:03:11", "referents": ["eu-fsf-eu-3074-61"], "schema": "Organization", "target": true},
{"caption": "Fajr Aviation Composite Industries", "datasets": ["eu_fsf"], "first_seen": "2021-09-26T14:52:11", "id": "NK-28X5jMopMz2jCXsUDUJczU", "last_seen": "2021-12-19T03:03:11", "referents": ["eu-fsf-eu-2001-61"], "schema": "Organization", "target": true},
{"caption": "Sergei Ivanovich MENYAILO", "datasets": ["eu_fsf"], "first_seen": "2021-09-26T14:52:11", "id": "NK-2CHqNtWeErMHi5i8RPCqC7", "last_seen": "2021-12-19T03:03:11", "referents": ["eu-fsf-eu-5896-7"], "schema": "Person", "target": true},
{"caption": "Abdolsamad KHORAMABADI", "datasets": ["eu_fsf"], "first_seen": "2021-09-26T14:52:11", "id": "NK-2DzyaDxjobuVwcDTps4VSJ", "last_seen": "2021-12-19T03:03:11", "referents": ["eu-fsf-eu-2978-90"], "schema": "Person", "target": true},
{"caption": "Samuel FERNANDES", "datasets": ["eu_fsf"], "first_seen": "2021-09-26T14:52:11", "id": "NK-2EnNuyDr5SWKXLH8bpSjok", "last_seen": "2021-12-19T03:03:11", "referents": ["eu-fsf-eu-3021-64"], "schema": "Person", "target": true},
{"caption": "Igor Viacheslavovich LIUBOVITSKI", "datasets": ["eu_fsf"], "first_seen": "2021-12-04T03:03:14", "id": "NK-2Mdk9YADKMyneyjdhWMtwn", "last_seen": "2021-12-19T03:03:11", "referents": ["eu-fsf-eu-6701-76"], "schema": "Person", "target": true},
{"caption": "IRGC", "datasets": ["eu_fsf"], "first_seen": "2021-09-26T14:52:11", "id": "NK-2PacmNpiLUmoz4XD2mSt7A", "last_seen": "2021-12-19T03:03:11", "referents": ["eu-fsf-eu-2078-17"], "schema": "Organization", "target": true},
{"caption": "Korea United Development Bank", "datasets": ["eu_fsf"], "first_seen": "2021-09-26T14:52:11", "id": "NK-2Qo8ydZ5zPR5Se5GidfVsG", "last_seen": "2021-12-19T03:03:11", "referents": ["eu-fsf-eu-4103-55"], "schema": "Organization", "target": true},
{"caption": "Al-Kaida v Iraku", "datasets": ["eu_fsf"], "first_seen": "2021-09-26T14:52:11", "id": "NK-2T3S8Hu29ktYnKSTgQp2wL", "last_seen": "2021-12-19T03:03:11", "referents": ["eu-fsf-eu-1163-58"], "schema": "Organization", "target": true},
{"caption": "MATSA (Mohandesi Toseh Sokht Atomi Company)", "datasets": ["eu_fsf"], "first_seen": "2021-09-26T14:52:11", "id": "NK-2VSxJneqvnUDT2D5iv2i2x", "last_seen": "2021-12-19T03:03:11", "referents": ["eu-fsf-eu-2649-60"], "schema": "Organization", "target": true},
{"caption": "Abdulhai Salek", "datasets": ["eu_fsf"], "first_seen": "2021-09-26T14:52:11", "id": "NK-2XAfkJ9t2UuWnoRG5EBoYu", "last_seen": "2021-12-19T03:03:11", "referents": ["eu-fsf-eu-780-23"], "schema": "Person", "target": true},
{"caption": "Tarif AKHRAS", "datasets": ["eu_fsf"], "first_seen": "2021-09-26T14:52:11", "id": "NK-2Yynnq5prSoe8NX8Zjb8i4", "last_seen": "2021-12-19T03:03:11", "referents": ["eu-fsf-eu-2828-23"], "schema": "Person", "target": true},
{"caption": "Vladimir Stepanovich ALEXSEYEV", "datasets": ["eu_fsf"], "first_seen": "2021-09-26T14:52:11", "id": "NK-2ZUrGJDocRY3AQBHSbpKg5", "last_seen": "2021-12-19T03:03:11", "referents": ["eu-fsf-eu-4908-14"], "schema": "Person", "target": true}]');
