--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 12.0

-- Started on 2019-12-05 08:55:47

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 20 (class 2615 OID 16765)
-- Name: rlormita; Type: SCHEMA; Schema: -; Owner: datama2mi181
--

CREATE SCHEMA rlormita;


ALTER SCHEMA rlormita OWNER TO datama2mi181;

SET default_tablespace = '';

--
-- TOC entry 381 (class 1259 OID 23393)
-- Name: food_company_supplier; Type: TABLE; Schema: rlormita; Owner: datama2mi181
--

CREATE TABLE rlormita.food_company_supplier (
    id integer NOT NULL,
    company_name character varying(45) NOT NULL,
    company_insurance character varying(45),
    contact_no character varying(12) NOT NULL,
    company_address character varying(45) NOT NULL
);


ALTER TABLE rlormita.food_company_supplier OWNER TO datama2mi181;

--
-- TOC entry 382 (class 1259 OID 23415)
-- Name: food_supplies; Type: TABLE; Schema: rlormita; Owner: datama2mi181
--

CREATE TABLE rlormita.food_supplies (
    stock_popcorn integer,
    stock_junkfoods integer,
    stock_burger integer,
    id integer NOT NULL,
    companyid integer NOT NULL
);


ALTER TABLE rlormita.food_supplies OWNER TO datama2mi181;

--
-- TOC entry 407 (class 1259 OID 25270)
-- Name: foodsupplies_to_deliver; Type: VIEW; Schema: rlormita; Owner: datama2mi181
--

CREATE VIEW rlormita.foodsupplies_to_deliver AS
 SELECT food_company_supplier.id,
    food_company_supplier.company_name,
    food_company_supplier.company_address,
    food_company_supplier.contact_no,
    food_supplies.companyid,
    food_supplies.stock_burger,
    food_supplies.stock_popcorn
   FROM (rlormita.food_company_supplier
     JOIN rlormita.food_supplies ON ((food_company_supplier.id = food_supplies.companyid)));


ALTER TABLE rlormita.foodsupplies_to_deliver OWNER TO datama2mi181;

--
-- TOC entry 3445 (class 0 OID 23393)
-- Dependencies: 381
-- Data for Name: food_company_supplier; Type: TABLE DATA; Schema: rlormita; Owner: datama2mi181
--

COPY rlormita.food_company_supplier (id, company_name, company_insurance, contact_no, company_address) FROM stdin;
20123	Coca-Cola	Philam Life	1654351	Quezon City, Metro Manila
23243	Universal Robina	Pru Life UK	486341	Mandaluyong, Metro Manila
23126	Gardenia Phils.	Philam Life	5324023	Biñan Laguna, Philippines
\.


--
-- TOC entry 3446 (class 0 OID 23415)
-- Dependencies: 382
-- Data for Name: food_supplies; Type: TABLE DATA; Schema: rlormita; Owner: datama2mi181
--

COPY rlormita.food_supplies (stock_popcorn, stock_junkfoods, stock_burger, id, companyid) FROM stdin;
0	0	10	12165	23126
30	30	20	5677	23243
25	25	25	1234	20123
\.


--
-- TOC entry 3300 (class 2606 OID 23397)
-- Name: food_company_supplier food_company_supplier_pkey1; Type: CONSTRAINT; Schema: rlormita; Owner: datama2mi181
--

ALTER TABLE ONLY rlormita.food_company_supplier
    ADD CONSTRAINT food_company_supplier_pkey1 PRIMARY KEY (id);


--
-- TOC entry 3302 (class 2606 OID 23419)
-- Name: food_supplies food_supplier_pkey; Type: CONSTRAINT; Schema: rlormita; Owner: datama2mi181
--

ALTER TABLE ONLY rlormita.food_supplies
    ADD CONSTRAINT food_supplier_pkey PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 23420)
-- Name: food_supplies companyid; Type: FK CONSTRAINT; Schema: rlormita; Owner: datama2mi181
--

ALTER TABLE ONLY rlormita.food_supplies
    ADD CONSTRAINT companyid FOREIGN KEY (companyid) REFERENCES rlormita.food_company_supplier(id);


-- Completed on 2019-12-05 08:55:47

--
-- PostgreSQL database dump complete
--

