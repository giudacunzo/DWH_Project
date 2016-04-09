--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-04-09 09:08:48

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 9 (class 2615 OID 24667)
-- Name: AVA; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "AVA";


ALTER SCHEMA "AVA" OWNER TO postgres;

SET search_path = "AVA", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 195 (class 1259 OID 33266)
-- Name: anno_accademico; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE anno_accademico (
    codice numeric NOT NULL,
    nome_anno_x numeric,
    nome_anno_prec numeric,
    nome_anno_completo text
);


ALTER TABLE anno_accademico OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 33253)
-- Name: corso; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE corso (
    codice numeric NOT NULL,
    numero_cfu numeric,
    nome text,
    ssd text,
    codice_corso text
);


ALTER TABLE corso OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 33229)
-- Name: corso_di_studi; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE corso_di_studi (
    codice numeric NOT NULL,
    data_inizio_validita numeric,
    data_fine_validita numeric,
    nome_cds text,
    tipo_cds text,
    ha_numero_programmato text,
    numero_programmato numeric,
    nome_dipartimento text,
    codice_dipartimento numeric,
    codice_corso_di_studi numeric,
    durata_legale numeric,
    codice_ateneo text
);


ALTER TABLE corso_di_studi OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 33328)
-- Name: esame; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE esame (
    k_studente numeric NOT NULL,
    k_anno_accademico numeric NOT NULL,
    k_corso numeric NOT NULL,
    k_corso_di_studi numeric NOT NULL,
    k_tempo numeric NOT NULL,
    cfu_corso numeric,
    voto numeric
);


ALTER TABLE esame OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 57794)
-- Name: ingressi; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE ingressi (
    k_studente integer NOT NULL,
    k_corso_di_studi integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_tipo_immatricolazione integer NOT NULL,
    k_tempo integer NOT NULL,
    punteggio_test integer,
    immatricolato boolean
);


ALTER TABLE ingressi OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 41412)
-- Name: laurea; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE laurea (
    k_studente numeric NOT NULL,
    k_anno_accademico numeric NOT NULL,
    k_corso_di_studi numeric NOT NULL,
    k_tempo numeric NOT NULL,
    voto_laurea text
);


ALTER TABLE laurea OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 33264)
-- Name: seq_anno_accademico; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE seq_anno_accademico
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_anno_accademico OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 33251)
-- Name: seq_corso; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE seq_corso
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_corso OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 33218)
-- Name: seq_corso_di_studi; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE seq_corso_di_studi
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_corso_di_studi OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 25015)
-- Name: seq_studente; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE seq_studente
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_studente OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 49638)
-- Name: seq_tipo_immatricolazione; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE seq_tipo_immatricolazione
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_tipo_immatricolazione OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 41404)
-- Name: studente; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE studente (
    codice numeric NOT NULL,
    tipo_scuola_superiore text,
    voto_scuola_superiore text,
    data_nasciata text,
    anno_prima_immatricolazione text,
    titolo_di_studio_diploma text,
    coorte text,
    sesso text,
    titolo_di_studio text,
    regione_residenza text,
    provincia_residenza text,
    comune_residenza text,
    stato_residenza text,
    cittadinanza text,
    codice_fiscale text,
    nazione_diploma text,
    istituto_scuola_superiore text,
    anno_conseguimento_titolo_superiore text
);


ALTER TABLE studente OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 24813)
-- Name: tempo; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE tempo (
    codice numeric NOT NULL,
    anno numeric,
    mese numeric,
    giorno numeric
);


ALTER TABLE tempo OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 41424)
-- Name: tipo_immatricolazione; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE tipo_immatricolazione (
    codice numeric NOT NULL,
    tipo_ingresso text
);


ALTER TABLE tipo_immatricolazione OWNER TO postgres;

--
-- TOC entry 2058 (class 2606 OID 33273)
-- Name: anno_accademico_pk; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY anno_accademico
    ADD CONSTRAINT anno_accademico_pk PRIMARY KEY (codice);


--
-- TOC entry 2054 (class 2606 OID 33236)
-- Name: corso_di_studi_pk; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY corso_di_studi
    ADD CONSTRAINT corso_di_studi_pk PRIMARY KEY (codice);


--
-- TOC entry 2056 (class 2606 OID 33260)
-- Name: corso_pk; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY corso
    ADD CONSTRAINT corso_pk PRIMARY KEY (codice);


--
-- TOC entry 2060 (class 2606 OID 33335)
-- Name: esame_pk; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esame
    ADD CONSTRAINT esame_pk PRIMARY KEY (k_studente, k_anno_accademico, k_corso, k_tempo, k_corso_di_studi);


--
-- TOC entry 2068 (class 2606 OID 57798)
-- Name: ingressi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_pkey PRIMARY KEY (k_studente, k_corso_di_studi, k_anno_accademico, k_tipo_immatricolazione, k_tempo);


--
-- TOC entry 2064 (class 2606 OID 41419)
-- Name: laurea_pk; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY laurea
    ADD CONSTRAINT laurea_pk PRIMARY KEY (k_studente, k_anno_accademico, k_corso_di_studi, k_tempo);


--
-- TOC entry 2062 (class 2606 OID 41411)
-- Name: studente_pk; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY studente
    ADD CONSTRAINT studente_pk PRIMARY KEY (codice);


--
-- TOC entry 2052 (class 2606 OID 24820)
-- Name: tempo_pk; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tempo
    ADD CONSTRAINT tempo_pk PRIMARY KEY (codice);


--
-- TOC entry 2066 (class 2606 OID 41431)
-- Name: tipo_immatricolazione_pk; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tipo_immatricolazione
    ADD CONSTRAINT tipo_immatricolazione_pk PRIMARY KEY (codice);


--
-- TOC entry 2069 (class 2606 OID 57799)
-- Name: ingressi_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(codice) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2070 (class 2606 OID 57804)
-- Name: ingressi_k_corso_di_studi_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_corso_di_studi_fkey FOREIGN KEY (k_corso_di_studi) REFERENCES corso_di_studi(codice) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2071 (class 2606 OID 57809)
-- Name: ingressi_k_studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(codice) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- TOC entry 2072 (class 2606 OID 57814)
-- Name: ingressi_k_tempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_tempo_fkey FOREIGN KEY (k_tempo) REFERENCES tempo(codice) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2073 (class 2606 OID 57819)
-- Name: ingressi_k_tipo_immatricolazione_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_tipo_immatricolazione_fkey FOREIGN KEY (k_tipo_immatricolazione) REFERENCES tipo_immatricolazione(codice) ON UPDATE SET NULL ON DELETE SET NULL;


-- Completed on 2016-04-09 09:08:48

--
-- PostgreSQL database dump complete
--

