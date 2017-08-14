ALTER TABLE dv_film
ADD CONSTRAINT positive_length CHECK (length>0);

ALTER TABLE mg_customers
ALTER COLUMN address_id SET DEFAULT 1,
ADD CONSTRAINT address_notnull CHECK (address_id IS NOT NULL);

ALTER TABLE dv_address
ALTER COLUMN address_id SET DEFAULT 2,
ADD CONSTRAINT address_notnull CHECK (address_id IS NOT NULL;