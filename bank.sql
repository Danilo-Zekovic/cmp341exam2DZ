--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: a_c; Type: TABLE; Schema: public; Owner: danilo; Tablespace: 
--

CREATE TABLE a_c (
    ssn character varying NOT NULL,
    acctno integer NOT NULL
);


ALTER TABLE a_c OWNER TO danilo;

--
-- Name: account; Type: TABLE; Schema: public; Owner: danilo; Tablespace: 
--

CREATE TABLE account (
    acctno integer NOT NULL,
    balance numeric,
    type character varying,
    branchnum integer
);


ALTER TABLE account OWNER TO danilo;

--
-- Name: bank; Type: TABLE; Schema: public; Owner: danilo; Tablespace: 
--

CREATE TABLE bank (
    code character varying NOT NULL,
    name character varying,
    addr character varying
);


ALTER TABLE bank OWNER TO danilo;

--
-- Name: bank_branch; Type: TABLE; Schema: public; Owner: danilo; Tablespace: 
--

CREATE TABLE bank_branch (
    addr character varying,
    branchno integer NOT NULL,
    codeb character varying
);


ALTER TABLE bank_branch OWNER TO danilo;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: danilo; Tablespace: 
--

CREATE TABLE customer (
    phone integer,
    ssn character varying NOT NULL,
    name character varying,
    addr character varying
);


ALTER TABLE customer OWNER TO danilo;

--
-- Name: l_c; Type: TABLE; Schema: public; Owner: danilo; Tablespace: 
--

CREATE TABLE l_c (
    ssn character varying NOT NULL,
    loanno integer NOT NULL
);


ALTER TABLE l_c OWNER TO danilo;

--
-- Name: loan; Type: TABLE; Schema: public; Owner: danilo; Tablespace: 
--

CREATE TABLE loan (
    loanno integer NOT NULL,
    amount numeric,
    type character varying,
    branchnum integer
);


ALTER TABLE loan OWNER TO danilo;

--
-- Data for Name: a_c; Type: TABLE DATA; Schema: public; Owner: danilo
--

COPY a_c (ssn, acctno) FROM stdin;
\.


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: danilo
--

COPY account (acctno, balance, type, branchnum) FROM stdin;
\.


--
-- Data for Name: bank; Type: TABLE DATA; Schema: public; Owner: danilo
--

COPY bank (code, name, addr) FROM stdin;
\.


--
-- Data for Name: bank_branch; Type: TABLE DATA; Schema: public; Owner: danilo
--

COPY bank_branch (addr, branchno, codeb) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: danilo
--

COPY customer (phone, ssn, name, addr) FROM stdin;
\.


--
-- Data for Name: l_c; Type: TABLE DATA; Schema: public; Owner: danilo
--

COPY l_c (ssn, loanno) FROM stdin;
\.


--
-- Data for Name: loan; Type: TABLE DATA; Schema: public; Owner: danilo
--

COPY loan (loanno, amount, type, branchnum) FROM stdin;
\.


--
-- Name: a_c_pkey; Type: CONSTRAINT; Schema: public; Owner: danilo; Tablespace: 
--

ALTER TABLE ONLY a_c
    ADD CONSTRAINT a_c_pkey PRIMARY KEY (ssn, acctno);


--
-- Name: account_pkey; Type: CONSTRAINT; Schema: public; Owner: danilo; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (acctno);


--
-- Name: bank_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: danilo; Tablespace: 
--

ALTER TABLE ONLY bank_branch
    ADD CONSTRAINT bank_branch_pkey PRIMARY KEY (branchno);


--
-- Name: bank_pkey; Type: CONSTRAINT; Schema: public; Owner: danilo; Tablespace: 
--

ALTER TABLE ONLY bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (code);


--
-- Name: customer_pkey; Type: CONSTRAINT; Schema: public; Owner: danilo; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (ssn);


--
-- Name: l_c_pkey; Type: CONSTRAINT; Schema: public; Owner: danilo; Tablespace: 
--

ALTER TABLE ONLY l_c
    ADD CONSTRAINT l_c_pkey PRIMARY KEY (ssn, loanno);


--
-- Name: loan_pkey; Type: CONSTRAINT; Schema: public; Owner: danilo; Tablespace: 
--

ALTER TABLE ONLY loan
    ADD CONSTRAINT loan_pkey PRIMARY KEY (loanno);


--
-- Name: account_branchnum_fkey; Type: FK CONSTRAINT; Schema: public; Owner: danilo
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_branchnum_fkey FOREIGN KEY (branchnum) REFERENCES bank_branch(branchno);


--
-- Name: bank_branch_codeb_fkey; Type: FK CONSTRAINT; Schema: public; Owner: danilo
--

ALTER TABLE ONLY bank_branch
    ADD CONSTRAINT bank_branch_codeb_fkey FOREIGN KEY (codeb) REFERENCES bank(code);


--
-- Name: loan_branchnum_fkey; Type: FK CONSTRAINT; Schema: public; Owner: danilo
--

ALTER TABLE ONLY loan
    ADD CONSTRAINT loan_branchnum_fkey FOREIGN KEY (branchnum) REFERENCES bank_branch(branchno);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

