--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: node_dependencies(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION node_dependencies(id integer) RETURNS TABLE(id integer)
    LANGUAGE sql STABLE STRICT COST 1 ROWS 100
    AS $_$
       WITH RECURSIVE
       deps AS(
         SELECT node_id, dependency_id
           FROM dependencies
           WHERE dependencies.node_id = $1
         UNION
         SELECT parent.node_id, parent.dependency_id
           FROM deps 
           JOIN dependencies AS parent ON parent.node_id = deps.dependency_id
       )    
       SELECT dependency_id FROM deps;
     $_$;


--
-- Name: node_dependents(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION node_dependents(id integer) RETURNS TABLE(id integer)
    LANGUAGE sql STABLE STRICT COST 1 ROWS 100
    AS $_$
       WITH RECURSIVE
       deps AS(
         SELECT node_id, dependency_id
           FROM dependencies
           WHERE dependency_id = $1
         UNION
         SELECT parent.node_id, parent.dependency_id 
           FROM deps
           JOIN dependencies AS parent ON deps.node_id = parent.dependency_id
       )
       SELECT node_id FROM deps
     $_$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: commands; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE commands (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    poller_id integer NOT NULL,
    state character varying(255) NOT NULL,
    arguments text,
    message text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    creator_id integer,
    updater_id integer
);


--
-- Name: commands_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE commands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: commands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE commands_id_seq OWNED BY commands.id;


--
-- Name: data_points; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE data_points (
    id integer NOT NULL,
    data_stream_id integer,
    "timestamp" timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    value double precision,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: data_points_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE data_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: data_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE data_points_id_seq OWNED BY data_points.id;


--
-- Name: data_sources; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE data_sources (
    id integer NOT NULL,
    node_id integer NOT NULL,
    plugin_id integer NOT NULL,
    data_template_id integer,
    state character varying(16) DEFAULT 'unknown'::character varying NOT NULL,
    last_polled_at timestamp without time zone,
    "interval" integer DEFAULT 300 NOT NULL,
    description text,
    arguments text,
    varbinds text,
    warning_threshold double precision,
    critical_threshold double precision,
    operator character varying(8) DEFAULT '>'::character varying,
    creator_id integer,
    updater_id integer,
    deleter_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: data_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE data_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: data_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE data_sources_id_seq OWNED BY data_sources.id;


--
-- Name: data_streams; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE data_streams (
    id integer NOT NULL,
    data_source_id integer,
    poller_id integer,
    creator_id integer,
    updater_id integer,
    deleter_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: data_streams_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE data_streams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: data_streams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE data_streams_id_seq OWNED BY data_streams.id;


--
-- Name: data_templates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE data_templates (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    plugin_id integer NOT NULL,
    "interval" integer DEFAULT 300 NOT NULL,
    warning_threshold double precision,
    critical_threshold double precision,
    operator character varying(255) DEFAULT '>'::character varying,
    description text,
    arguments text,
    creator_id integer,
    updater_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: data_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE data_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: data_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE data_templates_id_seq OWNED BY data_templates.id;


--
-- Name: dependencies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dependencies (
    id integer NOT NULL,
    node_id integer,
    dependency_id integer,
    creator_id integer,
    updater_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: dependencies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dependencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dependencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dependencies_id_seq OWNED BY dependencies.id;


--
-- Name: nodes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nodes (
    id integer NOT NULL,
    label character varying(32) NOT NULL,
    description text,
    type character varying(32),
    state character varying(16) DEFAULT 'unknown'::character varying,
    device_id integer,
    snmp_index integer,
    creator_id integer,
    updater_id integer,
    deleter_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: devices; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE devices (
    hostname character varying(255),
    ip_address inet,
    ip_forwarding boolean,
    os character varying(255),
    os_version character varying(255),
    os_type character varying(255),
    os_vendor character varying(255),
    community character varying(255),
    auth_protocol character varying(255),
    auth_password character varying(255),
    priv_protocol character varying(255),
    priv_password character varying(255),
    sys_name character varying(255),
    sys_descr character varying(255),
    sys_contact character varying(255),
    sys_location character varying(255),
    sys_objectid character varying(255),
    memory integer,
    num_cpus integer,
    snmp_version character varying(255)
)
INHERITS (nodes);


--
-- Name: events; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    poller_id integer,
    node_id integer,
    state character varying(255),
    repeats integer DEFAULT 0,
    severity character varying(255),
    description text,
    additional text,
    notes text,
    acknowledged_by_id integer,
    resolved_by_id integer,
    acknowledged_at timestamp without time zone,
    resolved_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    creator_id integer,
    updater_id integer
);


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying(255),
    parent_id integer,
    creator_id integer,
    updater_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: interfaces; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE interfaces (
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    ip_address inet,
    hostname character varying(255),
    if_speed integer,
    if_type integer,
    if_name character varying(255),
    if_alias character varying(255),
    if_descr character varying(255),
    if_promiscuous boolean,
    if_high_speed integer,
    if_admin_status character varying(255),
    physical_address macaddr,
    mtu integer,
    duplex character varying(255)
)
INHERITS (nodes);


--
-- Name: memberships; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE memberships (
    id integer NOT NULL,
    group_id integer,
    node_id integer,
    creator_id integer,
    updater_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE memberships_id_seq OWNED BY memberships.id;


--
-- Name: networks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE networks (
    id integer NOT NULL,
    address cidr,
    creator_id integer,
    updater_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: networks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE networks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: networks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE networks_id_seq OWNED BY networks.id;


--
-- Name: nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nodes_id_seq OWNED BY nodes.id;


--
-- Name: plugins; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE plugins (
    id integer NOT NULL,
    name character varying(255),
    class_name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    creator_id integer,
    updater_id integer
);


--
-- Name: plugins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE plugins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plugins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE plugins_id_seq OWNED BY plugins.id;


--
-- Name: poller_nodes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE poller_nodes (
    id integer NOT NULL,
    poller_id integer,
    node_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: poller_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE poller_nodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: poller_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE poller_nodes_id_seq OWNED BY poller_nodes.id;


--
-- Name: pollers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pollers (
    id integer NOT NULL,
    hostname character varying(255),
    port integer,
    state character varying(16) DEFAULT 'unknown'::character varying,
    queue_username character varying(32) NOT NULL,
    queue_password character varying(32) NOT NULL,
    creator_id integer,
    updater_id integer,
    deleter_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: pollers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pollers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pollers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pollers_id_seq OWNED BY pollers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: service_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE service_types (
    id integer NOT NULL,
    name character varying(255),
    default_port integer,
    default_template_id integer,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: service_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE service_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE service_types_id_seq OWNED BY service_types.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE services (
    port integer,
    service_type_id integer
)
INHERITS (nodes);


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE subscriptions (
    id integer NOT NULL,
    group_id integer,
    poller_id integer,
    node_id integer,
    state character varying(255),
    severity character varying(255),
    creator_id integer,
    updater_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE subscriptions_id_seq OWNED BY subscriptions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    admin boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY commands ALTER COLUMN id SET DEFAULT nextval('commands_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY data_points ALTER COLUMN id SET DEFAULT nextval('data_points_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY data_sources ALTER COLUMN id SET DEFAULT nextval('data_sources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY data_streams ALTER COLUMN id SET DEFAULT nextval('data_streams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY data_templates ALTER COLUMN id SET DEFAULT nextval('data_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dependencies ALTER COLUMN id SET DEFAULT nextval('dependencies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY devices ALTER COLUMN id SET DEFAULT nextval('nodes_id_seq'::regclass);


--
-- Name: state; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY devices ALTER COLUMN state SET DEFAULT 'unknown'::character varying;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY interfaces ALTER COLUMN id SET DEFAULT nextval('nodes_id_seq'::regclass);


--
-- Name: state; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY interfaces ALTER COLUMN state SET DEFAULT 'unknown'::character varying;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY memberships ALTER COLUMN id SET DEFAULT nextval('memberships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY networks ALTER COLUMN id SET DEFAULT nextval('networks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nodes ALTER COLUMN id SET DEFAULT nextval('nodes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY plugins ALTER COLUMN id SET DEFAULT nextval('plugins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY poller_nodes ALTER COLUMN id SET DEFAULT nextval('poller_nodes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pollers ALTER COLUMN id SET DEFAULT nextval('pollers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY service_types ALTER COLUMN id SET DEFAULT nextval('service_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY services ALTER COLUMN id SET DEFAULT nextval('nodes_id_seq'::regclass);


--
-- Name: state; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY services ALTER COLUMN state SET DEFAULT 'unknown'::character varying;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscriptions ALTER COLUMN id SET DEFAULT nextval('subscriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: commands_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY commands
    ADD CONSTRAINT commands_pkey PRIMARY KEY (id);


--
-- Name: data_points_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY data_points
    ADD CONSTRAINT data_points_pkey PRIMARY KEY (id);


--
-- Name: data_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY data_sources
    ADD CONSTRAINT data_sources_pkey PRIMARY KEY (id);


--
-- Name: data_streams_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY data_streams
    ADD CONSTRAINT data_streams_pkey PRIMARY KEY (id);


--
-- Name: data_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY data_templates
    ADD CONSTRAINT data_templates_pkey PRIMARY KEY (id);


--
-- Name: dependencies_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dependencies
    ADD CONSTRAINT dependencies_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (id);


--
-- Name: networks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY networks
    ADD CONSTRAINT networks_pkey PRIMARY KEY (id);


--
-- Name: nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nodes
    ADD CONSTRAINT nodes_pkey PRIMARY KEY (id);


--
-- Name: plugins_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY plugins
    ADD CONSTRAINT plugins_pkey PRIMARY KEY (id);


--
-- Name: poller_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY poller_nodes
    ADD CONSTRAINT poller_nodes_pkey PRIMARY KEY (id);


--
-- Name: pollers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pollers
    ADD CONSTRAINT pollers_pkey PRIMARY KEY (id);


--
-- Name: service_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY service_types
    ADD CONSTRAINT service_types_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_commands_on_poller_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_commands_on_poller_id ON commands USING btree (poller_id);


--
-- Name: index_data_points_on_data_stream_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_data_points_on_data_stream_id ON data_points USING btree (data_stream_id);


--
-- Name: index_data_sources_on_data_template_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_data_sources_on_data_template_id ON data_sources USING btree (data_template_id);


--
-- Name: index_data_sources_on_node_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_data_sources_on_node_id ON data_sources USING btree (node_id);


--
-- Name: index_data_sources_on_plugin_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_data_sources_on_plugin_id ON data_sources USING btree (plugin_id);


--
-- Name: index_data_streams_on_data_source_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_data_streams_on_data_source_id ON data_streams USING btree (data_source_id);


--
-- Name: index_data_streams_on_poller_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_data_streams_on_poller_id ON data_streams USING btree (poller_id);


--
-- Name: index_data_templates_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_data_templates_on_name ON data_templates USING btree (name);


--
-- Name: index_data_templates_on_plugin_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_data_templates_on_plugin_id ON data_templates USING btree (plugin_id);


--
-- Name: index_dependencies_on_dependency_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_dependencies_on_dependency_id ON dependencies USING btree (dependency_id);


--
-- Name: index_dependencies_on_node_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_dependencies_on_node_id ON dependencies USING btree (node_id);


--
-- Name: index_events_on_acknowledged_by_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_events_on_acknowledged_by_id ON events USING btree (acknowledged_by_id);


--
-- Name: index_events_on_node_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_events_on_node_id ON events USING btree (node_id);


--
-- Name: index_events_on_poller_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_events_on_poller_id ON events USING btree (poller_id);


--
-- Name: index_events_on_resolved_by_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_events_on_resolved_by_id ON events USING btree (resolved_by_id);


--
-- Name: index_events_on_severity; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_events_on_severity ON events USING btree (severity);


--
-- Name: index_events_on_state; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_events_on_state ON events USING btree (state);


--
-- Name: index_groups_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_groups_on_name ON groups USING btree (name);


--
-- Name: index_groups_on_parent_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_groups_on_parent_id ON groups USING btree (parent_id);


--
-- Name: index_memberships_on_creator_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_memberships_on_creator_id ON memberships USING btree (creator_id);


--
-- Name: index_memberships_on_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_memberships_on_group_id ON memberships USING btree (group_id);


--
-- Name: index_memberships_on_node_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_memberships_on_node_id ON memberships USING btree (node_id);


--
-- Name: index_memberships_on_updater_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_memberships_on_updater_id ON memberships USING btree (updater_id);


--
-- Name: index_nodes_on_device_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nodes_on_device_id ON nodes USING btree (device_id);


--
-- Name: index_nodes_on_label; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nodes_on_label ON nodes USING btree (label);


--
-- Name: index_nodes_on_snmp_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nodes_on_snmp_index ON nodes USING btree (snmp_index);


--
-- Name: index_nodes_on_state; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nodes_on_state ON nodes USING btree (state);


--
-- Name: index_nodes_on_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nodes_on_type ON nodes USING btree (type);


--
-- Name: index_plugins_on_class_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_plugins_on_class_name ON plugins USING btree (class_name);


--
-- Name: index_plugins_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_plugins_on_name ON plugins USING btree (name);


--
-- Name: index_poller_nodes_on_node_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_poller_nodes_on_node_id ON poller_nodes USING btree (node_id);


--
-- Name: index_poller_nodes_on_poller_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_poller_nodes_on_poller_id ON poller_nodes USING btree (poller_id);


--
-- Name: index_pollers_on_hostname; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pollers_on_hostname ON pollers USING btree (hostname);


--
-- Name: index_service_types_on_default_template_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_service_types_on_default_template_id ON service_types USING btree (default_template_id);


--
-- Name: index_subscriptions_on_creator_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subscriptions_on_creator_id ON subscriptions USING btree (creator_id);


--
-- Name: index_subscriptions_on_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subscriptions_on_group_id ON subscriptions USING btree (group_id);


--
-- Name: index_subscriptions_on_node_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subscriptions_on_node_id ON subscriptions USING btree (node_id);


--
-- Name: index_subscriptions_on_poller_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subscriptions_on_poller_id ON subscriptions USING btree (poller_id);


--
-- Name: index_subscriptions_on_severity; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subscriptions_on_severity ON subscriptions USING btree (severity);


--
-- Name: index_subscriptions_on_state; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subscriptions_on_state ON subscriptions USING btree (state);


--
-- Name: index_subscriptions_on_updater_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subscriptions_on_updater_id ON subscriptions USING btree (updater_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20120408100254');

INSERT INTO schema_migrations (version) VALUES ('20120408140245');

INSERT INTO schema_migrations (version) VALUES ('20120410090345');

INSERT INTO schema_migrations (version) VALUES ('20120410120417');

INSERT INTO schema_migrations (version) VALUES ('20120414100538');

INSERT INTO schema_migrations (version) VALUES ('20120416033922');

INSERT INTO schema_migrations (version) VALUES ('20120418102512');

INSERT INTO schema_migrations (version) VALUES ('20120422223615');

INSERT INTO schema_migrations (version) VALUES ('20120625090828');

INSERT INTO schema_migrations (version) VALUES ('20120626051005');

INSERT INTO schema_migrations (version) VALUES ('20120626052818');

INSERT INTO schema_migrations (version) VALUES ('20120626053343');

INSERT INTO schema_migrations (version) VALUES ('20120626054730');

INSERT INTO schema_migrations (version) VALUES ('20120628072301');

INSERT INTO schema_migrations (version) VALUES ('20120628072417');

INSERT INTO schema_migrations (version) VALUES ('20120628072738');

INSERT INTO schema_migrations (version) VALUES ('20120917004926');

INSERT INTO schema_migrations (version) VALUES ('20120920071352');

INSERT INTO schema_migrations (version) VALUES ('20120922222425');

INSERT INTO schema_migrations (version) VALUES ('20121010040106');