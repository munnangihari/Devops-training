--
-- PostgreSQL database dump
--

\restrict qWJDaHL076h48kYh2HVguYm3mwnECj7ktsPHE0QmXT4WvI3AILCCaYxLS7tOOe2

-- Dumped from database version 16.15 (Debian 16.15-1.pgdg13+2)
-- Dumped by pg_dump version 16.15 (Debian 16.15-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: recovery_test; Type: TABLE; Schema: public; Owner: recoveryuser
--

CREATE TABLE public.recovery_test (
    id integer NOT NULL,
    message text
);


ALTER TABLE public.recovery_test OWNER TO recoveryuser;

--
-- Data for Name: recovery_test; Type: TABLE DATA; Schema: public; Owner: recoveryuser
--

COPY public.recovery_test (id, message) FROM stdin;
1	database-recovery-success
\.


--
-- Name: recovery_test recovery_test_pkey; Type: CONSTRAINT; Schema: public; Owner: recoveryuser
--

ALTER TABLE ONLY public.recovery_test
    ADD CONSTRAINT recovery_test_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict qWJDaHL076h48kYh2HVguYm3mwnECj7ktsPHE0QmXT4WvI3AILCCaYxLS7tOOe2

