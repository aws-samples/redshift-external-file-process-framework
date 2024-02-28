-- DROP FUNCTION rdsftetl.fn_chk_date(varchar, varchar);

CREATE OR REPLACE FUNCTION rdsftetl.fn_chk_date(date_str varchar, format varchar)
	RETURNS int4
	LANGUAGE plpythonu
	IMMUTABLE
AS $$
	
import datetime
try:
    if not date_str or date_str.strip() == '':
        return 0
    datetime.datetime.strptime(date_str, format)
    return 0
except ValueError:
    return 1

$$
;
