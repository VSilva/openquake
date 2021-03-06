--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: hazardcalculation; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE hazardcalculation (
    hcid integer NOT NULL,
    hcshortname character(20),
    hcname character varying(50),
    hcdesc character varying(100),
    hcstarttimestamp timestamp without time zone,
    hcendtimestamp timestamp without time zone,
    hcprobdettag character(1),
    hcgemgentag boolean,
    hcareapolygon character varying(5120),
    hcareamultipolygon character varying(5120),
    hcremarks character varying(255),
    hibmid integer,
    hilmid integer,
    hilmpid integer,
    evid integer,
    hscode character(10) NOT NULL,
    cocode character(10) NOT NULL,
    hcpgareapolygon geometry,
    hcpgareamultipolygon geometry,
    CONSTRAINT enforce_dims_hcpgareamultipolygon CHECK ((st_ndims(hcpgareamultipolygon) = 2)),
    CONSTRAINT enforce_dims_hcpgareapolygon CHECK ((st_ndims(hcpgareapolygon) = 2)),
    CONSTRAINT enforce_geotype_hcpgareamultipolygon CHECK (((geometrytype(hcpgareamultipolygon) = 'MULTIPOLYGON'::text) OR (hcpgareamultipolygon IS NULL))),
    CONSTRAINT enforce_geotype_hcpgareapolygon CHECK (((geometrytype(hcpgareapolygon) = 'POLYGON'::text) OR (hcpgareapolygon IS NULL))),
    CONSTRAINT enforce_srid_hcpgareamultipolygon CHECK ((st_srid(hcpgareamultipolygon) = 4326)),
    CONSTRAINT enforce_srid_hcpgareapolygon CHECK ((st_srid(hcpgareapolygon) = 4326))
);


--
-- Name: TABLE hazardcalculation; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE hazardcalculation IS 'Hazard Calculation';


--
-- Name: COLUMN hazardcalculation.hcid; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN hazardcalculation.hcid IS 'Hazard Calculation Id';


--
-- Name: COLUMN hazardcalculation.hcshortname; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN hazardcalculation.hcshortname IS 'Hazard Calc Short Name';


--
-- Name: COLUMN hazardcalculation.hcname; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN hazardcalculation.hcname IS 'Hazard Calc Short Name';


--
-- Name: COLUMN hazardcalculation.hcdesc; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN hazardcalculation.hcdesc IS 'Hazard Calc Description';


--
-- Name: COLUMN hazardcalculation.hcstarttimestamp; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN hazardcalculation.hcstarttimestamp IS 'Date when Hazard Calculation made, TimeStamp without TimeZone';


--
-- Name: COLUMN hazardcalculation.hcprobdettag; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN hazardcalculation.hcprobdettag IS 'Hazard Calculation Probabilistic Deterministic Tag, ''P'' or ''T''';


--
-- Name: COLUMN hazardcalculation.hcgemgentag; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN hazardcalculation.hcgemgentag IS 'Hazard Calculation GEM Generated Tag, true (generated by GEM) or false (previously generated)';


--
-- Name: COLUMN hazardcalculation.hcareapolygon; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN hazardcalculation.hcareapolygon IS 'Hazard Calculation Area Polygon';


--
-- Name: COLUMN hazardcalculation.hcareamultipolygon; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN hazardcalculation.hcareamultipolygon IS 'Added 12 Mar 2010';


--
-- Name: COLUMN hazardcalculation.hcremarks; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN hazardcalculation.hcremarks IS 'Hazard Calculation Remarks';


--
-- Name: COLUMN hazardcalculation.evid; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN hazardcalculation.evid IS 'Event id given by system, auto generate?';


--
-- Name: COLUMN hazardcalculation.hscode; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN hazardcalculation.hscode IS 'Hazard Software Code';


--
-- Name: COLUMN hazardcalculation.cocode; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN hazardcalculation.cocode IS 'Calculation Owner Code';


--
-- Name: hazardcalculation_hcid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE hazardcalculation_hcid_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: hazardcalculation_hcid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE hazardcalculation_hcid_seq OWNED BY hazardcalculation.hcid;


--
-- Name: hcid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE hazardcalculation ALTER COLUMN hcid SET DEFAULT nextval('hazardcalculation_hcid_seq'::regclass);


--
-- Name: hazardcalculation_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY hazardcalculation
    ADD CONSTRAINT hazardcalculation_pkey PRIMARY KEY (hcid);


--
-- Name: hazardcalculation_hcpgareapolygon_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX hazardcalculation_hcpgareapolygon_idx ON hazardcalculation USING gist (hcpgareapolygon);


--
-- Name: hazardcalculation_hibmid_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX hazardcalculation_hibmid_idx ON hazardcalculation USING btree (hibmid);


--
-- Name: hazardcalculation_hilmid_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX hazardcalculation_hilmid_idx ON hazardcalculation USING btree (hilmid);


--
-- Name: hazardcalculation_hilmpid_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX hazardcalculation_hilmpid_idx ON hazardcalculation USING btree (hilmpid);


--
-- Name: fk_hazardcalculation_4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY hazardcalculation
    ADD CONSTRAINT fk_hazardcalculation_4 FOREIGN KEY (hilmpid) REFERENCES hilmpath(hilmpid);


--
-- Name: fk_hazardcalculation_5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY hazardcalculation
    ADD CONSTRAINT fk_hazardcalculation_5 FOREIGN KEY (cocode) REFERENCES calculationowner(cocode);


--
-- Name: fk_hazardcalculation_6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY hazardcalculation
    ADD CONSTRAINT fk_hazardcalculation_6 FOREIGN KEY (hscode) REFERENCES hazardsoftware(hscode);


--
-- Name: fk_hazardcalculation_7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY hazardcalculation
    ADD CONSTRAINT fk_hazardcalculation_7 FOREIGN KEY (hibmid) REFERENCES hazardinputbasicmodel(hibmid);


--
-- Name: fk_hazardcalculation_8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY hazardcalculation
    ADD CONSTRAINT fk_hazardcalculation_8 FOREIGN KEY (evid) REFERENCES event(evid);


--
-- Name: fk_hazardcalculation_9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY hazardcalculation
    ADD CONSTRAINT fk_hazardcalculation_9 FOREIGN KEY (hilmid) REFERENCES hazardinputltreemodel(hilmid);


--
-- Name: hazardcalculation; Type: ACL; Schema: public; Owner: -
--

REVOKE ALL ON TABLE hazardcalculation FROM PUBLIC;
REVOKE ALL ON TABLE hazardcalculation FROM postgres;
GRANT ALL ON TABLE hazardcalculation TO postgres;
GRANT SELECT ON TABLE hazardcalculation TO gemuser;


--
-- PostgreSQL database dump complete
--

