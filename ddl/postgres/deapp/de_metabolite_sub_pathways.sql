--
-- Name: de_metabolite_sub_pathways; Type: TABLE; Schema: deapp; Owner: -
--
CREATE TABLE de_metabolite_sub_pathways (
    id bigint NOT NULL,
    gpl_id character varying(50) NOT NULL,
    sub_pathway_name character varying(200) NOT NULL,
    super_pathway_id bigint
);
--
-- Type: REF_CONSTRAINT; Owner: DEAPP; Name: SYS_C0010760
--
ALTER TABLE de_metabolite_sub_pathways ADD FOREIGN KEY (super_pathway_id)
 REFERENCES de_metabolite_super_pathways(id);

--
-- Name: de_metabolite_sub_pathway_pk; Type: CONSTRAINT; Schema: deapp; Owner: -
--
ALTER TABLE ONLY de_metabolite_sub_pathways
    ADD CONSTRAINT de_metabolite_sub_pathway_pk PRIMARY KEY (id);