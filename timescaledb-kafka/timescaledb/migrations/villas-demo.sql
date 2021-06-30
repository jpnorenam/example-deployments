CREATE DATABASE sogno;

\c sogno

CREATE SCHEMA villas-demo;

CREATE TABLE villas-demo.topic1 (
   timestamp BIGINT NOT NULL,
   sequence BIGINT NULL,
   id SERIAL REFERENCES linnox.asset_energy_meter(id),

   voltage_a_v DOUBLE PRECISION NULL,
   voltage_b_v DOUBLE PRECISION NULL,
   voltage_c_v DOUBLE PRECISION NULL,

   current_a_a DOUBLE PRECISION NULL,
   current_b_a DOUBLE PRECISION NULL,
   current_c_a DOUBLE PRECISION NULL,
);

SELECT create_hypertable('villas-demo.topic1','timestamp', chunk_time_interval => 86400000);

CREATE TABLE linnox.asset_energy_meter (
   id SERIAL PRIMARY KEY,
   device_uuid TEXT NOT NULL,
   latitude DOUBLE PRECISION NOT NULL,
   longitude DOUBLE PRECISION NOT NULL
);
