#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Debian 14.9-1.pgdg120+1)
-- Dumped by pg_dump version 15.3

-- Started on 2024-09-30 08:59:11

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

DROP DATABASE $PG_CUSTOM_DB;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE DATABASE $PG_CUSTOM_DB WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE $PG_CUSTOM_DB OWNER TO $PG_CUSTOM_USER;

\connect $PG_CUSTOM_DB

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: $POSTGRES_USER

--CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO $POSTGRES_USER;

--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16584)
-- Name: auditory; Type: TABLE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE TABLE public.auditory (
    id integer NOT NULL,
    message text NOT NULL,
    recipients text NOT NULL,
    total_images integer DEFAULT 0 NOT NULL,
    creation_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_user integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.auditory OWNER TO whatsapp;

--
-- TOC entry 214 (class 1259 OID 16583)
-- Name: auditory_id_seq; Type: SEQUENCE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE SEQUENCE public.auditory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auditory_id_seq OWNER TO whatsapp;

--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 214
-- Name: auditory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER SEQUENCE public.auditory_id_seq OWNED BY public.auditory.id;


--
-- TOC entry 221 (class 1259 OID 16648)
-- Name: emoticons_unicode; Type: TABLE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE TABLE public.emoticons_unicode (
    id integer NOT NULL,
    name_emoticon character varying(256) NOT NULL,
    key_emoticon character varying(256) NOT NULL,
    unicode_emoticon character varying(64) NOT NULL,
    creation_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.emoticons_unicode OWNER TO whatsapp;

--
-- TOC entry 220 (class 1259 OID 16647)
-- Name: emoticons_unicode_id_seq; Type: SEQUENCE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE SEQUENCE public.emoticons_unicode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emoticons_unicode_id_seq OWNER TO whatsapp;

--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 220
-- Name: emoticons_unicode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER SEQUENCE public.emoticons_unicode_id_seq OWNED BY public.emoticons_unicode.id;


--
-- TOC entry 217 (class 1259 OID 16601)
-- Name: properties; Type: TABLE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE TABLE public.properties (
    id integer NOT NULL,
    property_key character varying(128) NOT NULL,
    property_value character varying(512) NOT NULL,
    property_description character varying(512) NOT NULL,
    creation_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.properties OWNER TO whatsapp;

--
-- TOC entry 216 (class 1259 OID 16600)
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE SEQUENCE public.properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.properties_id_seq OWNER TO whatsapp;

--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 216
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER SEQUENCE public.properties_id_seq OWNED BY public.properties.id;


--
-- TOC entry 210 (class 1259 OID 16550)
-- Name: roles; Type: TABLE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    rol character varying(256) NOT NULL,
    creation_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.roles OWNER TO whatsapp;

--
-- TOC entry 209 (class 1259 OID 16549)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO whatsapp;

--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 209
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 213 (class 1259 OID 16577)
-- Name: tmp_messages; Type: TABLE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE TABLE public.tmp_messages (
    message_id character varying(256) NOT NULL,
    creation_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tmp_messages OWNER TO whatsapp;

--
-- TOC entry 225 (class 1259 OID 25101)
-- Name: user_allowed_agents; Type: TABLE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE TABLE public.user_allowed_agents (
    id integer NOT NULL,
    agent character varying(512) NOT NULL,
    creation_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_user integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_allowed_agents OWNER TO whatsapp;

--
-- TOC entry 224 (class 1259 OID 25100)
-- Name: user_allowed_agents_id_seq; Type: SEQUENCE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE SEQUENCE public.user_allowed_agents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_allowed_agents_id_seq OWNER TO whatsapp;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 224
-- Name: user_allowed_agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER SEQUENCE public.user_allowed_agents_id_seq OWNED BY public.user_allowed_agents.id;


--
-- TOC entry 223 (class 1259 OID 25083)
-- Name: user_allowed_ips; Type: TABLE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE TABLE public.user_allowed_ips (
    id integer NOT NULL,
    ip character varying(512) NOT NULL,
    creation_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_user integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_allowed_ips OWNER TO whatsapp;

--
-- TOC entry 222 (class 1259 OID 25082)
-- Name: user_allowed_ips_id_seq; Type: SEQUENCE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE SEQUENCE public.user_allowed_ips_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_allowed_ips_id_seq OWNER TO whatsapp;

--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 222
-- Name: user_allowed_ips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER SEQUENCE public.user_allowed_ips_id_seq OWNED BY public.user_allowed_ips.id;


--
-- TOC entry 219 (class 1259 OID 16611)
-- Name: user_properties; Type: TABLE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE TABLE public.user_properties (
    id integer NOT NULL,
    property_value character varying(512) NOT NULL,
    creation_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_property integer DEFAULT 0 NOT NULL,
    id_user integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_properties OWNER TO whatsapp;

--
-- TOC entry 218 (class 1259 OID 16610)
-- Name: user_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE SEQUENCE public.user_properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_properties_id_seq OWNER TO whatsapp;

--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 218
-- Name: user_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER SEQUENCE public.user_properties_id_seq OWNED BY public.user_properties.id;


--
-- TOC entry 212 (class 1259 OID 16560)
-- Name: users; Type: TABLE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(256) NOT NULL,
    token character varying(512) NOT NULL,
    creation_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_rol integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.users OWNER TO whatsapp;

--
-- TOC entry 211 (class 1259 OID 16559)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: $PG_CUSTOM_USER
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO whatsapp;

--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3235 (class 2604 OID 16587)
-- Name: auditory id; Type: DEFAULT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.auditory ALTER COLUMN id SET DEFAULT nextval('public.auditory_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 16651)
-- Name: emoticons_unicode id; Type: DEFAULT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.emoticons_unicode ALTER COLUMN id SET DEFAULT nextval('public.emoticons_unicode_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 16604)
-- Name: properties id; Type: DEFAULT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.properties ALTER COLUMN id SET DEFAULT nextval('public.properties_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 16553)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 25104)
-- Name: user_allowed_agents id; Type: DEFAULT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.user_allowed_agents ALTER COLUMN id SET DEFAULT nextval('public.user_allowed_agents_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 25086)
-- Name: user_allowed_ips id; Type: DEFAULT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.user_allowed_ips ALTER COLUMN id SET DEFAULT nextval('public.user_allowed_ips_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 16614)
-- Name: user_properties id; Type: DEFAULT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.user_properties ALTER COLUMN id SET DEFAULT nextval('public.user_properties_id_seq'::regclass);


--
-- TOC entry 3231 (class 2604 OID 16563)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3438 (class 0 OID 16648)
-- Dependencies: 221
-- Data for Name: emoticons_unicode; Type: TABLE DATA; Schema: public; Owner: $PG_CUSTOM_USER
--

COPY public.emoticons_unicode (id, name_emoticon, key_emoticon, unicode_emoticon, creation_date) FROM stdin;
1	AIRPLANE	AIRPLANE	2708	2023-10-03 14:20:17.909898
2	ALARM CLOCK	ALARM_CLOCK	23F0	2023-10-03 14:20:17.909898
3	ALEMBIC	ALEMBIC	2697	2023-10-03 14:20:17.909898
4	ANCHOR	ANCHOR	2693	2023-10-03 14:20:17.909898
5	AQUARIUS	AQUARIUS	2652	2023-10-03 14:20:17.909898
6	ARIES	ARIES	2648	2023-10-03 14:20:17.909898
7	ARROW POINTING RIGHTWARDS THEN CURVING DOWNWARDS	ARROW_POINTING_RIGHTWARDS_THEN_CURVING_DOWNWARDS	2935	2023-10-03 14:20:17.909898
8	ARROW POINTING RIGHTWARDS THEN CURVING UPWARDS	ARROW_POINTING_RIGHTWARDS_THEN_CURVING_UPWARDS	2934	2023-10-03 14:20:17.909898
9	ATOM SYMBOL	ATOM_SYMBOL	269B	2023-10-03 14:20:17.909898
10	BALLOT BOX WITH CHECK	BALLOT_BOX_WITH_CHECK	2611	2023-10-03 14:20:17.909898
11	BASEBALL	BASEBALL	26BE	2023-10-03 14:20:17.909898
12	BIOHAZARD SIGN	BIOHAZARD_SIGN	2623	2023-10-03 14:20:17.909898
13	BLACK CIRCLE FOR RECORD	BLACK_CIRCLE_FOR_RECORD	23FA	2023-10-03 14:20:17.909898
14	BLACK CLUB SUIT	BLACK_CLUB_SUIT	2663	2023-10-03 14:20:17.909898
15	BLACK DIAMOND SUIT	BLACK_DIAMOND_SUIT	2666	2023-10-03 14:20:17.909898
16	BLACK DOWN-POINTING DOUBLE TRIANGLE	BLACK_DOWN-POINTING_DOUBLE_TRIANGLE	23EC	2023-10-03 14:20:17.909898
17	BLACK HEART SUIT	BLACK_HEART_SUIT	2665	2023-10-03 14:20:17.909898
18	BLACK LARGE SQUARE	BLACK_LARGE_SQUARE	2B1B	2023-10-03 14:20:17.909898
19	BLACK LEFT-POINTING DOUBLE TRIANGLE WITH VERTICAL BAR	BLACK_LEFT-POINTING_DOUBLE_TRIANGLE_WITH_VERTICAL_BAR	23EE	2023-10-03 14:20:17.909898
20	BLACK LEFT-POINTING DOUBLE TRIANGLE	BLACK_LEFT-POINTING_DOUBLE_TRIANGLE	23EA	2023-10-03 14:20:17.909898
21	BLACK LEFT-POINTING TRIANGLE	BLACK_LEFT-POINTING_TRIANGLE	25C0	2023-10-03 14:20:17.909898
22	BLACK MEDIUM SMALL SQUARE	BLACK_MEDIUM_SMALL_SQUARE	25FE	2023-10-03 14:20:17.909898
23	BLACK MEDIUM SQUARE	BLACK_MEDIUM_SQUARE	25FC	2023-10-03 14:20:17.909898
24	BLACK NIB	BLACK_NIB	2712	2023-10-03 14:20:17.909898
25	BLACK QUESTION MARK ORNAMENT	BLACK_QUESTION_MARK_ORNAMENT	2753	2023-10-03 14:20:17.909898
92	LEO	LEO	264C	2023-10-03 14:20:17.909898
93	LIBRA	LIBRA	264E	2023-10-03 14:20:17.909898
26	BLACK RIGHT-POINTING DOUBLE TRIANGLE WITH VERTICAL BAR	BLACK_RIGHT-POINTING_DOUBLE_TRIANGLE_WITH_VERTICAL_BAR	23ED	2023-10-03 14:20:17.909898
27	BLACK RIGHT-POINTING TRIANGLE WITH DOUBLE VERTICAL BAR	BLACK_RIGHT-POINTING_TRIANGLE_WITH_DOUBLE_VERTICAL_BAR	23EF	2023-10-03 14:20:17.909898
28	BLACK RIGHT-POINTING TRIANGLE	BLACK_RIGHT-POINTING_TRIANGLE	25B6	2023-10-03 14:20:17.909898
29	BLACK RIGHTWARDS ARROW	BLACK_RIGHTWARDS_ARROW	27A1	2023-10-03 14:20:17.909898
30	BLACK SCISSORS	BLACK_SCISSORS	2702	2023-10-03 14:20:17.909898
31	BLACK SMALL SQUARE	BLACK_SMALL_SQUARE	25AA	2023-10-03 14:20:17.909898
32	BLACK SPADE SUIT	BLACK_SPADE_SUIT	2660	2023-10-03 14:20:17.909898
33	BLACK SQUARE FOR STOP	BLACK_SQUARE_FOR_STOP	23F9	2023-10-03 14:20:17.909898
34	BLACK SUN WITH RAYS	BLACK_SUN_WITH_RAYS	2600	2023-10-03 14:20:17.909898
35	BLACK TELEPHONE	BLACK_TELEPHONE	260E	2023-10-03 14:20:17.909898
36	BLACK UNIVERSAL RECYCLING SYMBOL	BLACK_UNIVERSAL_RECYCLING_SYMBOL	267B	2023-10-03 14:20:17.909898
37	BLACK UP-POINTING DOUBLE TRIANGLE	BLACK_UP-POINTING_DOUBLE_TRIANGLE	23EB	2023-10-03 14:20:17.909898
38	CANCER	CANCER	264B	2023-10-03 14:20:17.909898
39	CAPRICORN	CAPRICORN	2651	2023-10-03 14:20:17.909898
40	CHAINS	CHAINS	26D3	2023-10-03 14:20:17.909898
41	CHURCH	CHURCH	26EA	2023-10-03 14:20:17.909898
42	CIRCLED IDEOGRAPH CONGRATULATION	CIRCLED_IDEOGRAPH_CONGRATULATION	3297	2023-10-03 14:20:17.909898
43	CIRCLED IDEOGRAPH SECRET	CIRCLED_IDEOGRAPH_SECRET	3299	2023-10-03 14:20:17.909898
44	CIRCLED LATIN CAPITAL LETTER M	CIRCLED_LATIN_CAPITAL_LETTER_M	24C2	2023-10-03 14:20:17.909898
45	CLOUD	CLOUD	2601	2023-10-03 14:20:17.909898
46	COFFIN	COFFIN	26B0	2023-10-03 14:20:17.909898
47	COMET	COMET	2604	2023-10-03 14:20:17.909898
48	COPYRIGHT SIGN	COPYRIGHT_SIGN	00A9	2023-10-03 14:20:17.909898
49	CROSS MARK	CROSS_MARK	274C	2023-10-03 14:20:17.909898
50	CROSSED SWORDS	CROSSED_SWORDS	2694	2023-10-03 14:20:17.909898
51	CURLY LOOP	CURLY_LOOP	27B0	2023-10-03 14:20:17.909898
52	DOUBLE CURLY LOOP	DOUBLE_CURLY_LOOP	27BF	2023-10-03 14:20:17.909898
53	DOUBLE EXCLAMATION MARK	DOUBLE_EXCLAMATION_MARK	203C	2023-10-03 14:20:17.909898
54	DOUBLE VERTICAL BAR	DOUBLE_VERTICAL_BAR	23F8	2023-10-03 14:20:17.909898
55	DOWNWARDS BLACK ARROW	DOWNWARDS_BLACK_ARROW	2B07	2023-10-03 14:20:17.909898
56	EIGHT POINTED BLACK STAR	EIGHT_POINTED_BLACK_STAR	2734	2023-10-03 14:20:17.909898
57	EIGHT SPOKED ASTERISK	EIGHT_SPOKED_ASTERISK	2733	2023-10-03 14:20:17.909898
58	EJECT SYMBOL	EJECT_SYMBOL	23CF	2023-10-03 14:20:17.909898
59	ENVELOPE	ENVELOPE	2709	2023-10-03 14:20:17.909898
60	EXCLAMATION QUESTION MARK	EXCLAMATION_QUESTION_MARK	2049	2023-10-03 14:20:17.909898
61	FERRY	FERRY	26F4	2023-10-03 14:20:17.909898
62	FLAG IN HOLE	FLAG_IN_HOLE	26F3	2023-10-03 14:20:17.909898
63	FLEUR-DE-LIS	FLEUR-DE-LIS	269C	2023-10-03 14:20:17.909898
64	FOUNTAIN	FOUNTAIN	26F2	2023-10-03 14:20:17.909898
65	FUEL PUMP	FUEL_PUMP	26FD	2023-10-03 14:20:17.909898
66	FUNERAL URN	FUNERAL_URN	26B1	2023-10-03 14:20:17.909898
67	GEAR	GEAR	2699	2023-10-03 14:20:17.909898
68	GEMINI	GEMINI	264A	2023-10-03 14:20:17.909898
69	HAMMER AND PICK	HAMMER_AND_PICK	2692	2023-10-03 14:20:17.909898
70	HEAVY BLACK HEART	HEAVY_BLACK_HEART	2764	2023-10-03 14:20:17.909898
71	HEAVY CHECK MARK	HEAVY_CHECK_MARK	2714	2023-10-03 14:20:17.909898
72	HEAVY DIVISION SIGN	HEAVY_DIVISION_SIGN	2797	2023-10-03 14:20:17.909898
73	HEAVY EXCLAMATION MARK SYMBOL	HEAVY_EXCLAMATION_MARK_SYMBOL	2757	2023-10-03 14:20:17.909898
74	HEAVY HEART EXCLAMATION MARK ORNAMENT	HEAVY_HEART_EXCLAMATION_MARK_ORNAMENT	2763	2023-10-03 14:20:17.909898
75	HEAVY LARGE CIRCLE	HEAVY_LARGE_CIRCLE	2B55	2023-10-03 14:20:17.909898
76	HEAVY MINUS SIGN	HEAVY_MINUS_SIGN	2796	2023-10-03 14:20:17.909898
77	HEAVY MULTIPLICATION X	HEAVY_MULTIPLICATION_X	2716	2023-10-03 14:20:17.909898
78	HEAVY PLUS SIGN	HEAVY_PLUS_SIGN	2795	2023-10-03 14:20:17.909898
79	HELMET WITH WHITE CROSS	HELMET_WITH_WHITE_CROSS	26D1	2023-10-03 14:20:17.909898
80	HIGH VOLTAGE SIGN	HIGH_VOLTAGE_SIGN	26A1	2023-10-03 14:20:17.909898
81	HOT BEVERAGE	HOT_BEVERAGE	2615	2023-10-03 14:20:17.909898
82	HOT SPRINGS	HOT_SPRINGS	2668	2023-10-03 14:20:17.909898
83	HOURGLASS WITH FLOWING SAND	HOURGLASS_WITH_FLOWING_SAND	23F3	2023-10-03 14:20:17.909898
84	HOURGLASS	HOURGLASS	231B	2023-10-03 14:20:17.909898
85	ICE SKATE	ICE_SKATE	26F8	2023-10-03 14:20:17.909898
86	INFORMATION SOURCE	INFORMATION_SOURCE	2139	2023-10-03 14:20:17.909898
87	KEYBOARD	KEYBOARD	2328	2023-10-03 14:20:17.909898
88	LATIN CROSS	LATIN_CROSS	271D	2023-10-03 14:20:17.909898
89	LEFT RIGHT ARROW	LEFT_RIGHT_ARROW	2194	2023-10-03 14:20:17.909898
90	LEFTWARDS ARROW WITH HOOK	LEFTWARDS_ARROW_WITH_HOOK	21A9	2023-10-03 14:20:17.909898
91	LEFTWARDS BLACK ARROW	LEFTWARDS_BLACK_ARROW	2B05	2023-10-03 14:20:17.909898
94	MEDIUM BLACK CIRCLE	MEDIUM_BLACK_CIRCLE	26AB	2023-10-03 14:20:17.909898
95	MEDIUM WHITE CIRCLE	MEDIUM_WHITE_CIRCLE	26AA	2023-10-03 14:20:17.909898
96	MOUNTAIN	MOUNTAIN	26F0	2023-10-03 14:20:17.909898
97	NEGATIVE SQUARED CROSS MARK	NEGATIVE_SQUARED_CROSS_MARK	274E	2023-10-03 14:20:17.909898
98	NO ENTRY	NO_ENTRY	26D4	2023-10-03 14:20:17.909898
99	NORTH EAST ARROW	NORTH_EAST_ARROW	2197	2023-10-03 14:20:17.909898
100	NORTH WEST ARROW	NORTH_WEST_ARROW	2196	2023-10-03 14:20:17.909898
101	OPHIUCHUS	OPHIUCHUS	26CE	2023-10-03 14:20:17.909898
102	ORTHODOX CROSS	ORTHODOX_CROSS	2626	2023-10-03 14:20:17.909898
103	PART ALTERNATION MARK	PART_ALTERNATION_MARK	303D	2023-10-03 14:20:17.909898
104	PEACE SYMBOL	PEACE_SYMBOL	262E	2023-10-03 14:20:17.909898
105	PENCIL	PENCIL	270F	2023-10-03 14:20:17.909898
106	PERSON WITH BALL	PERSON_WITH_BALL	26F9	2023-10-03 14:20:17.909898
107	PICK	PICK	26CF	2023-10-03 14:20:17.909898
108	PISCES	PISCES	2653	2023-10-03 14:20:17.909898
109	RADIOACTIVE SIGN	RADIOACTIVE_SIGN	2622	2023-10-03 14:20:17.909898
110	RAISED FIST	RAISED_FIST	270A	2023-10-03 14:20:17.909898
111	RAISED HAND	RAISED_HAND	270B	2023-10-03 14:20:17.909898
112	REGISTERED SIGN	REGISTERED_SIGN	00AE	2023-10-03 14:20:17.909898
113	RIGHTWARDS ARROW WITH HOOK	RIGHTWARDS_ARROW_WITH_HOOK	21AA	2023-10-03 14:20:17.909898
114	SAGITTARIUS	SAGITTARIUS	2650	2023-10-03 14:20:17.909898
115	SAILBOAT	SAILBOAT	26F5	2023-10-03 14:20:17.909898
116	SCALES	SCALES	2696	2023-10-03 14:20:17.909898
117	SCORPIUS	SCORPIUS	264F	2023-10-03 14:20:17.909898
118	SHAMROCK	SHAMROCK	2618	2023-10-03 14:20:17.909898
119	SKIER	SKIER	26F7	2023-10-03 14:20:17.909898
120	SKULL AND CROSSBONES	SKULL_AND_CROSSBONES	2620	2023-10-03 14:20:17.909898
121	SNOWFLAKE	SNOWFLAKE	2744	2023-10-03 14:20:17.909898
122	SNOWMAN WITHOUT SNOW	SNOWMAN_WITHOUT_SNOW	26C4	2023-10-03 14:20:17.909898
123	SNOWMAN	SNOWMAN	2603	2023-10-03 14:20:17.909898
124	SOCCER BALL	SOCCER_BALL	26BD	2023-10-03 14:20:17.909898
125	SOUTH EAST ARROW	SOUTH_EAST_ARROW	2198	2023-10-03 14:20:17.909898
126	SOUTH WEST ARROW	SOUTH_WEST_ARROW	2199	2023-10-03 14:20:17.909898
127	SPARKLE	SPARKLE	2747	2023-10-03 14:20:17.909898
128	SPARKLES	SPARKLES	2728	2023-10-03 14:20:17.909898
129	STAR AND CRESCENT	STAR_AND_CRESCENT	262A	2023-10-03 14:20:17.909898
130	STAR OF DAVID	STAR_OF_DAVID	2721	2023-10-03 14:20:17.909898
131	STOPWATCH	STOPWATCH	23F1	2023-10-03 14:20:17.909898
132	SUN BEHIND CLOUD	SUN_BEHIND_CLOUD	26C5	2023-10-03 14:20:17.909898
133	TAURUS	TAURUS	2649	2023-10-03 14:20:17.909898
134	TENT	TENT	26FA	2023-10-03 14:20:17.909898
135	THUNDER CLOUD AND RAIN	THUNDER_CLOUD_AND_RAIN	26C8	2023-10-03 14:20:17.909898
136	TIMER CLOCK	TIMER_CLOCK	23F2	2023-10-03 14:20:17.909898
137	TRADE MARK SIGN	TRADE_MARK_SIGN	2122	2023-10-03 14:20:17.909898
138	UMBRELLA ON GROUND	UMBRELLA_ON_GROUND	26F1	2023-10-03 14:20:17.909898
139	UMBRELLA WITH RAIN DROPS	UMBRELLA_WITH_RAIN_DROPS	2614	2023-10-03 14:20:17.909898
140	UMBRELLA	UMBRELLA	2602	2023-10-03 14:20:17.909898
141	UP DOWN ARROW	UP_DOWN_ARROW	2195	2023-10-03 14:20:17.909898
142	UPWARDS BLACK ARROW	UPWARDS_BLACK_ARROW	2B06	2023-10-03 14:20:17.909898
143	VICTORY HAND	VICTORY_HAND	270C	2023-10-03 14:20:17.909898
144	VIRGO	VIRGO	264D	2023-10-03 14:20:17.909898
145	WARNING SIGN	WARNING_SIGN	26A0	2023-10-03 14:20:17.909898
146	WATCH	WATCH	231A	2023-10-03 14:20:17.909898
147	WAVY DASH	WAVY_DASH	3030	2023-10-03 14:20:17.909898
148	WHEEL OF DHARMA	WHEEL_OF_DHARMA	2638	2023-10-03 14:20:17.909898
149	WHEELCHAIR SYMBOL	WHEELCHAIR_SYMBOL	267F	2023-10-03 14:20:17.909898
150	WHITE EXCLAMATION MARK ORNAMENT	WHITE_EXCLAMATION_MARK_ORNAMENT	2755	2023-10-03 14:20:17.909898
151	WHITE FROWNING FACE	WHITE_FROWNING_FACE	2639	2023-10-03 14:20:17.909898
152	WHITE HEAVY CHECK MARK	WHITE_HEAVY_CHECK_MARK	2705	2023-10-03 14:20:17.909898
153	WHITE LARGE SQUARE	WHITE_LARGE_SQUARE	2B1C	2023-10-03 14:20:17.909898
154	WHITE MEDIUM SMALL SQUARE	WHITE_MEDIUM_SMALL_SQUARE	25FD	2023-10-03 14:20:17.909898
155	WHITE MEDIUM SQUARE	WHITE_MEDIUM_SQUARE	25FB	2023-10-03 14:20:17.909898
156	WHITE MEDIUM STAR	WHITE_MEDIUM_STAR	2B50	2023-10-03 14:20:17.909898
157	WHITE QUESTION MARK ORNAMENT	WHITE_QUESTION_MARK_ORNAMENT	2754	2023-10-03 14:20:17.909898
158	WHITE SMALL SQUARE	WHITE_SMALL_SQUARE	25AB	2023-10-03 14:20:17.909898
159	WHITE SMILING FACE	WHITE_SMILING_FACE	263A	2023-10-03 14:20:17.909898
160	WHITE UP POINTING INDEX	WHITE_UP_POINTING_INDEX	261D	2023-10-03 14:20:17.909898
161	WRITING HAND	WRITING_HAND	270D	2023-10-03 14:20:17.909898
162	YIN YANG	YIN_YANG	262F	2023-10-03 14:20:17.909898
\.


--
-- TOC entry 3434 (class 0 OID 16601)
-- Dependencies: 217
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: $PG_CUSTOM_USER
--

COPY public.properties (id, property_key, property_value, property_description, creation_date) FROM stdin;
1	delete.messages.cron.expression	*/5 * * * *	Cron expresion para borrar mensajes en la tabla temporal	2023-09-21 00:00:00
2	delete.messages.time.minutes	5	Tiempo en minutos para borrar los mensajes que sean mas antiguos que el valor indicado	2023-09-21 00:00:00
3	whatsapp.max.size.images.mb	2	Peso maximo en MB de las imagenes a enviar	2023-09-21 00:00:00
5	whatsapp.max.images.in.request	5	Máximo de imagenes a enviar por solicitud	2023-09-21 00:00:00
6	whatsapp.check.time.minutes	1	Tiempo en el que se contaran los mensajes enviados por cada usuario	2023-09-21 00:00:00
9	app.sender.email	SignOS	Nombre del sender que aprecera en el correo	2023-09-21 00:00:00
10	app.mq.send.email.after	10	Valor que indica a partir de que intento de conexión al MQ debe enviarse correo	2023-09-21 00:00:00
11	app.mq.time.between.retries	1	Valor que indica el tiempo para reintentar conectarse (Segundos)	2023-09-21 00:00:00
12	app.mq.send.email.each.n.tries	5	Valor que indica cada cuantos intentos se debera enviar correo	2023-09-21 00:00:00
14	app.base.url.noctopus	https://noctopus.kionetworks.com	URL de noctopus	2023-09-21 00:00:00
8	app.validate.token.in.noctopus	false	Bandera que indica si se debe validar el token en Noctopus	2023-09-21 00:00:00
4	whatsapp.max.sends.in.period	100	Máximo de envios a permitir por usuario en un periodo determinado	2023-09-21 00:00:00
7	app.support.emails	ea_engineers@kio.tech	Correo(s) de soporte de la aplicación, ejemplo correo@correo.com, correo2@correo.com	2023-09-21 00:00:00
13	app.base.url.email	https://easervices.kio.tech	URL del servicio de correos	2023-09-21 00:00:00
15	whatsapp.validate.user.origin	true	Bandera que indica si se validan los datos del request	2024-08-19 14:14:11.964362
\.


--
-- TOC entry 3427 (class 0 OID 16550)
-- Dependencies: 210
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: $PG_CUSTOM_USER
--

COPY public.roles (id, rol, creation_date) FROM stdin;
1	ADMIN	2023-09-21 13:32:36.073403
2	USER	2023-09-21 13:32:36.073403
\.


--
-- TOC entry 3430 (class 0 OID 16577)
-- Dependencies: 213
-- Data for Name: tmp_messages; Type: TABLE DATA; Schema: public; Owner: $PG_CUSTOM_USER
--

COPY public.tmp_messages (message_id, creation_date) FROM stdin;
\.


--
-- TOC entry 3442 (class 0 OID 25101)
-- Dependencies: 225
-- Data for Name: user_allowed_agents; Type: TABLE DATA; Schema: public; Owner: $PG_CUSTOM_USER
--

COPY public.user_allowed_agents (id, agent, creation_date, id_user) FROM stdin;
\.


--
-- TOC entry 3440 (class 0 OID 25083)
-- Dependencies: 223
-- Data for Name: user_allowed_ips; Type: TABLE DATA; Schema: public; Owner: $PG_CUSTOM_USER
--

COPY public.user_allowed_ips (id, ip, creation_date, id_user) FROM stdin;
\.


--
-- TOC entry 3436 (class 0 OID 16611)
-- Dependencies: 219
-- Data for Name: user_properties; Type: TABLE DATA; Schema: public; Owner: $PG_CUSTOM_USER
--

COPY public.user_properties (id, property_value, creation_date, id_property, id_user) FROM stdin;
1	5000	2023-09-25 11:19:39.706254	4	1
2	500	2023-12-05 22:21:31.872933	4	7
15	25	2024-04-05 17:58:45.11713	5	6
16	false	2024-08-19 14:16:17.699469	15	1
17	false	2024-08-19 14:16:17.699469	15	2
18	false	2024-08-19 14:16:17.699469	15	4
19	false	2024-08-19 14:16:17.699469	15	5
20	false	2024-08-19 14:16:17.699469	15	6
21	false	2024-08-19 14:16:17.699469	15	7
22	false	2024-08-19 14:16:17.699469	15	9
\.


--
-- TOC entry 3429 (class 0 OID 16560)
-- Dependencies: 212
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: $PG_CUSTOM_USER
--

COPY public.users (id, email, token, creation_date, id_rol) FROM stdin;
1	signos@kio.tech	aQv0Dg70JNDGDtfimLxeVIKZoDSRxu	2023-09-21 13:32:53.997836	1
2	automation@kio.tech	kLp6ILt4LvJO5enT6u33HHzYBLVBWn	2023-09-21 12:38:46.542	2
4	test-whatsapp@kio.tech	kI6iJ3xqFz6bMeLpDWoRZvtjnEpQbH	2023-09-27 01:03:03.041602	2
5	ticketing@kio.tech	yUCAJMvdVKWOLWymgIxVKowinwidPG	2023-10-10 16:22:18.84761	2
6	mtrujillo@kio.tech	6iJ3TqFz6bMeLdfhYSdoRZ9765tjnEpJbH	2023-11-17 18:40:16.592903	2
7	fulfillment@kio.tech	aQv0Dg70JNDGDtfimLxeVIKZoDSRxu	2023-12-05 21:23:56.264666	2
9	noctopus@kio.tech	CFFcyRuQgkACVOLPeEMDOFewdqdOTw	2024-05-20 18:37:22.243472	2
\.


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 214
-- Name: auditory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $PG_CUSTOM_USER
--

SELECT pg_catalog.setval('public.auditory_id_seq', 93400, true);


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 220
-- Name: emoticons_unicode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $PG_CUSTOM_USER
--

SELECT pg_catalog.setval('public.emoticons_unicode_id_seq', 162, true);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 216
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $PG_CUSTOM_USER
--

SELECT pg_catalog.setval('public.properties_id_seq', 15, true);


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 209
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $PG_CUSTOM_USER
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 224
-- Name: user_allowed_agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $PG_CUSTOM_USER
--

SELECT pg_catalog.setval('public.user_allowed_agents_id_seq', 1, false);


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 222
-- Name: user_allowed_ips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $PG_CUSTOM_USER
--

SELECT pg_catalog.setval('public.user_allowed_ips_id_seq', 1, false);


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 218
-- Name: user_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $PG_CUSTOM_USER
--

SELECT pg_catalog.setval('public.user_properties_id_seq', 22, true);


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $PG_CUSTOM_USER
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- TOC entry 3264 (class 2606 OID 16593)
-- Name: auditory pk_auditory_id; Type: CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.auditory
    ADD CONSTRAINT pk_auditory_id PRIMARY KEY (id);


--
-- TOC entry 3272 (class 2606 OID 16656)
-- Name: emoticons_unicode pk_emoticons_unicode_id; Type: CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.emoticons_unicode
    ADD CONSTRAINT pk_emoticons_unicode_id PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 16609)
-- Name: properties pk_properties_id; Type: CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT pk_properties_id PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 16556)
-- Name: roles pk_roles_id; Type: CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT pk_roles_id PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 16582)
-- Name: tmp_messages pk_tmp_messages_message_id; Type: CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.tmp_messages
    ADD CONSTRAINT pk_tmp_messages_message_id PRIMARY KEY (message_id);


--
-- TOC entry 3278 (class 2606 OID 25110)
-- Name: user_allowed_agents pk_user_allowed_agents_id; Type: CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.user_allowed_agents
    ADD CONSTRAINT pk_user_allowed_agents_id PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 25092)
-- Name: user_allowed_ips pk_user_allowed_ips_id; Type: CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.user_allowed_ips
    ADD CONSTRAINT pk_user_allowed_ips_id PRIMARY KEY (id);


--
-- TOC entry 3268 (class 2606 OID 16619)
-- Name: user_properties pk_user_properties_id; Type: CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.user_properties
    ADD CONSTRAINT pk_user_properties_id PRIMARY KEY (id);


--
-- TOC entry 3258 (class 2606 OID 16568)
-- Name: users pk_users_id; Type: CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_users_id PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 16558)
-- Name: roles roles_rol_key; Type: CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_rol_key UNIQUE (rol);


--
-- TOC entry 3280 (class 2606 OID 25112)
-- Name: user_allowed_agents uq_user_allowed_agents; Type: CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.user_allowed_agents
    ADD CONSTRAINT uq_user_allowed_agents UNIQUE (id_user, agent);


--
-- TOC entry 3276 (class 2606 OID 25094)
-- Name: user_allowed_ips uq_user_allowed_ips; Type: CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.user_allowed_ips
    ADD CONSTRAINT uq_user_allowed_ips UNIQUE (id_user, ip);


--
-- TOC entry 3270 (class 2606 OID 16633)
-- Name: user_properties uq_user_property; Type: CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.user_properties
    ADD CONSTRAINT uq_user_property UNIQUE (id_user, id_property);


--
-- TOC entry 3260 (class 2606 OID 16570)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3286 (class 2606 OID 25113)
-- Name: user_allowed_agents user_allowed_agents_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.user_allowed_agents
    ADD CONSTRAINT user_allowed_agents_user_fk FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- TOC entry 3285 (class 2606 OID 25095)
-- Name: user_allowed_ips user_allowed_ips_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.user_allowed_ips
    ADD CONSTRAINT user_allowed_ips_user_fk FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- TOC entry 3282 (class 2606 OID 16595)
-- Name: auditory user_auditory_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.auditory
    ADD CONSTRAINT user_auditory_user_fk FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- TOC entry 3283 (class 2606 OID 16621)
-- Name: user_properties user_properties_property_fk; Type: FK CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.user_properties
    ADD CONSTRAINT user_properties_property_fk FOREIGN KEY (id_property) REFERENCES public.properties(id);


--
-- TOC entry 3284 (class 2606 OID 16627)
-- Name: user_properties user_properties_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.user_properties
    ADD CONSTRAINT user_properties_user_fk FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- TOC entry 3281 (class 2606 OID 16572)
-- Name: users user_rol_fk; Type: FK CONSTRAINT; Schema: public; Owner: $PG_CUSTOM_USER
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_rol_fk FOREIGN KEY (id_rol) REFERENCES public.roles(id);

GRANT ALL ON DATABASE $PG_CUSTOM_DB TO $PG_CUSTOM_USER;

--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-09-30 08:59:13

--
-- PostgreSQL database dump complete
--
EOSQL
