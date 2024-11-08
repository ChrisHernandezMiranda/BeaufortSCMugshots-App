--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: arrest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arrest (
    id integer NOT NULL,
    inmate_id integer,
    agency character varying(255),
    officer character varying(255),
    booking_number character varying(50),
    last_updated timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.arrest OWNER TO postgres;

--
-- Name: arrest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.arrest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.arrest_id_seq OWNER TO postgres;

--
-- Name: arrest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.arrest_id_seq OWNED BY public.arrest.id;


--
-- Name: inmate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inmate (
    id integer NOT NULL,
    last_name character varying(100),
    first_name character varying(100),
    middle_name character varying(255),
    street character varying(255),
    city_state_zip character varying(255),
    race_gender character varying(50),
    sex character varying(10),
    date_of_birth date,
    age integer,
    height character varying(10),
    weight character varying(10),
    booking_number character varying(50),
    booked_date date,
    booked_time time without time zone,
    release_date date,
    release_time time without time zone,
    mugshot_url text,
    last_updated timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.inmate OWNER TO postgres;

--
-- Name: inmate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inmate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inmate_id_seq OWNER TO postgres;

--
-- Name: inmate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inmate_id_seq OWNED BY public.inmate.id;


--
-- Name: offense; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offense (
    id integer NOT NULL,
    arrest_id integer,
    offense_code character varying(50),
    offense_description text,
    offense_location text,
    bond_amount numeric(12,2),
    court character varying(255),
    last_updated timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.offense OWNER TO postgres;

--
-- Name: offense_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.offense_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.offense_id_seq OWNER TO postgres;

--
-- Name: offense_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.offense_id_seq OWNED BY public.offense.id;


--
-- Name: arrest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arrest ALTER COLUMN id SET DEFAULT nextval('public.arrest_id_seq'::regclass);


--
-- Name: inmate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inmate ALTER COLUMN id SET DEFAULT nextval('public.inmate_id_seq'::regclass);


--
-- Name: offense id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offense ALTER COLUMN id SET DEFAULT nextval('public.offense_id_seq'::regclass);


--
-- Data for Name: arrest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.arrest (id, inmate_id, agency, officer, booking_number, last_updated) FROM stdin;
11981	12051	Beaufort County Sheriff's Ofc	Petitt, A	    49759	2024-11-07 22:00:03.880197
11982	12052	Beaufort PD	Arroyo, A	    48820	2024-11-07 22:00:03.893093
11983	12053	Beaufort County Sheriff's Ofc	Aaron, M	    49587	2024-11-07 22:00:03.895464
11984	12054	Beaufort PD	Clementoni, A	    49801	2024-11-07 22:00:03.89802
11985	12055	Port Royal PD	Mangione, J	    48910	2024-11-07 22:00:03.899954
11986	12056	Beaufort County Sheriff's Ofc	Ahrens, A	    49007	2024-11-07 22:00:03.902191
11987	12057	Beaufort County Sheriff's Ofc	Snyder, R	    49224	2024-11-07 22:00:03.903892
11988	12058	Beaufort County Sheriff's Ofc	Lawson, Mo	    49399	2024-11-07 22:00:03.90587
11989	12059	Beaufort County Sheriff's Ofc	Lee, Ben	    48850	2024-11-07 22:00:03.907572
11990	12060	Jasper County Detention	Orr	    49269	2024-11-07 22:00:03.909867
11991	12061	Port Royal PD	Simmons, Ru	    49571	2024-11-07 22:00:03.911601
11992	12062	Beaufort County Detention		    48830	2024-11-07 22:00:03.913849
11993	12063	Beaufort PD	Palmer, R	    48929	2024-11-07 22:00:03.915715
11994	12064	Beaufort PD	Jackson, J	    49778	2024-11-07 22:00:03.919436
11995	12065	Beaufort PD	Lynch, C	    49794	2024-11-07 22:00:03.921339
11996	12066	Beaufort PD	Humphries, M	    49802	2024-11-07 22:00:03.923363
11997	12067	Port Royal PD	Simmons, Ru	    49288	2024-11-07 22:00:03.925881
11998	12068	Port Royal PD	Hogue, J	    49503	2024-11-07 22:00:03.930146
11999	12069	Port Royal PD	Mangione, J	    49506	2024-11-07 22:00:03.931807
12000	12070	Beaufort County Sheriff's Ofc	Niedergall, B	    48835	2024-11-07 22:00:03.933588
12001	12071	Port Royal PD	Garvin, M	    49041	2024-11-07 22:00:03.935319
12002	12072	Beaufort PD	Thompson, L	    49207	2024-11-07 22:00:03.937359
12003	12073	Beaufort County Sheriff's Ofc	Carolus, R	    49441	2024-11-07 22:00:03.939218
12004	12074	Beaufort County Sheriff's Ofc	Phillips, D	    49567	2024-11-07 22:00:03.941549
12005	12075	Beaufort County Sheriff's Ofc	Phillips, D	    49569	2024-11-07 22:00:03.943811
12006	12076	Beaufort PD	Humphries, M	    49800	2024-11-07 22:00:03.94624
12007	12077	Beaufort PD	Palacios, K	    49659	2024-11-07 22:00:03.949703
12008	12078	Beaufort County Sheriff's Ofc	Goodson, D	    49665	2024-11-07 22:00:03.952285
12009	12079	Beaufort County Sheriff's Ofc	Webb, J	    49790	2024-11-07 22:00:03.954423
12010	12080	Beaufort PD	Palacios, K	    49795	2024-11-07 22:00:03.956233
12011	12081	South Carolina Highway Patrol	COON	    49524	2024-11-07 22:00:03.958264
12012	12082	South Carolina Highway Patrol	BACON	    49192	2024-11-07 22:00:03.961208
12013	12083	Beaufort PD	Lynch, C	    49258	2024-11-07 22:00:03.963373
12014	12084	Beaufort PD	Fontaine, L	    49452	2024-11-07 22:00:03.965544
12015	12085	Beaufort County Sheriff's Ofc	Swinehamer, D	    49584	2024-11-07 22:00:03.968342
12016	12086	Beaufort County Sheriff's Ofc	Weaver, J	    49090	2024-11-07 22:00:03.970696
12017	12087	South Carolina Highway Patrol	Gargiulo, M	    49464	2024-11-07 22:00:03.972995
12018	12088	South Carolina Highway Patrol	DEGNER	    49540	2024-11-07 22:00:03.976682
12019	12089	Jasper County Detention	Orr	    49268	2024-11-07 22:00:03.980792
12020	12090	Probation Parole	Shytle, D	    49217	2024-11-07 22:00:03.9831
12021	12091	Beaufort PD	Wadman, W	    48731	2024-11-07 22:00:03.984852
12022	12092	Bluffton PD	Pagano, G	    48939	2024-11-07 22:00:03.987308
12023	12093	Bluffton PD	Pagano, G	    49043	2024-11-07 22:00:03.989245
12024	12094	Beaufort County Sheriff's Ofc	Erickson, M	    48768	2024-11-07 22:00:03.99154
12025	12095	South Carolina Highway Patrol	BACON	    48924	2024-11-07 22:00:03.995114
12026	12096	Beaufort County Sheriff's Ofc	Crowley, W	    49618	2024-11-07 22:00:03.997146
12027	12097	South Carolina Highway Patrol	CASTILLO	    49273	2024-11-07 22:00:03.999058
12028	12098	Jasper County Detention		    49318	2024-11-07 22:00:04.00064
12029	12099	South Carolina Highway Patrol	Bacon, M	    48753	2024-11-07 22:00:04.002612
12030	12100	Beaufort County Sheriff's Ofc	Anderson, Ch	    49215	2024-11-07 22:00:04.004297
12031	12101	Beaufort County Sheriff's Ofc	Perkins, M	    49022	2024-11-07 22:00:04.008517
12032	12102	South Carolina Highway Patrol	CASTILLO	    48909	2024-11-07 22:00:04.011344
12033	12104	Bluffton PD	Pasquale, S	    48973	2024-11-07 22:00:04.014925
12034	12105	Beaufort County Sheriff's Ofc	Aaron, M	    48869	2024-11-07 22:00:04.016571
12035	12106	Beaufort County Detention	Padgett, Lee	    48829	2024-11-07 22:00:04.019268
12036	12107	Probation Parole	Shytle, D	    49719	2024-11-07 22:00:04.02089
12037	12108	Beaufort County Sheriff's Ofc	Ray, Z	    49360	2024-11-07 22:00:04.023358
12038	12109	Beaufort County Sheriff's Ofc	Swinehamer, D	    49034	2024-11-07 22:00:04.026103
12039	12110	Beaufort PD	Wadman, W	    49639	2024-11-07 22:00:04.027665
12040	12111	Beaufort County Sheriff's Ofc	Lawson, Mo	    49421	2024-11-07 22:00:04.029387
12041	12112	Beaufort PD	Arroyo, A	    48979	2024-11-07 22:00:04.031877
12042	12113	Beaufort County Sheriff's Ofc	Clouse, J	    48796	2024-11-07 22:00:04.034717
12043	12114	Beaufort County Sheriff's Ofc	Weinberg, K	    48744	2024-11-07 22:00:04.038748
12044	12115	SLED	GREGG, R.	    49408	2024-11-07 22:00:04.040869
12045	12116	Beaufort County Sheriff's Ofc	Anderson, Tyler	    49456	2024-11-07 22:00:04.043354
12046	12117			    49396	2024-11-07 22:00:04.045368
12047	12118	Beaufort County Sheriff's Ofc	Anderson, Ch	    48844	2024-11-07 22:00:04.047504
12048	12119	Beaufort County Sheriff's Ofc	Anderson, Ch	    49289	2024-11-07 22:00:04.049881
12049	12120	Beaufort County Sheriff's Ofc	Petruzzi, Z	    49257	2024-11-07 22:00:04.052496
12050	12121	Beaufort County Sheriff's Ofc	Clouse, J	    49173	2024-11-07 22:00:04.055657
12051	12122	Beaufort County Sheriff's Ofc	Corcoran, C	    49033	2024-11-07 22:00:04.057522
12052	12123	Bluffton PD		    49457	2024-11-07 22:00:04.059887
12053	12124	Beaufort PD	Wadman, W	    49450	2024-11-07 22:00:04.061701
12054	12125	Beaufort PD	Rice, R	    49694	2024-11-07 22:00:04.065341
12055	12126	Beaufort County Sheriff's Ofc	Weinberg, K	    49554	2024-11-07 22:00:04.066995
12056	12127	Beaufort County Sheriff's Ofc	Seronka, Chad	    49234	2024-11-07 22:00:04.068913
12057	12128	Beaufort County Sheriff's Ofc	Street, J	    49117	2024-11-07 22:00:04.07049
12058	12130	South Carolina Highway Patrol	Castillo	    49077	2024-11-07 22:00:04.072776
12059	12131	SC Dept of Corrections	STEVENS	    48913	2024-11-07 22:00:04.077372
12060	12132	Beaufort County Sheriff's Ofc	Kline, D	    48873	2024-11-07 22:00:04.079181
12061	12133	Beaufort County Sheriff's Ofc	Clouse, J	    49119	2024-11-07 22:00:04.081292
12062	12134	Beaufort County Sheriff's Ofc	Weaver, J	    49072	2024-11-07 22:00:04.084536
12063	12135	Jasper County Detention		    49317	2024-11-07 22:00:04.08714
12064	12136	Beaufort PD	Taylor, Jos	    49670	2024-11-07 22:00:04.08914
12065	12137	Probation Parole	Shytle, D	    49302	2024-11-07 22:00:04.09153
12066	12138	Beaufort PD	Setian, Ashley	    48782	2024-11-07 22:00:04.093772
12067	12139	Beaufort County Sheriff's Ofc	D'Adamo, G	    49747	2024-11-07 22:00:04.096592
12068	12140	Beaufort PD	Miller, C	    49036	2024-11-07 22:00:04.09827
12069	12141	Beaufort PD	Thompson, L	    49797	2024-11-07 22:00:04.100429
12070	12142	Beaufort County Sheriff's Ofc	Weinberg, K	    49501	2024-11-07 22:00:04.102101
12071	12143	Beaufort County Sheriff's Ofc	Niedergall, B	    49469	2024-11-07 22:00:04.104071
12072	12144	Beaufort County Sheriff's Ofc	Street, J	    49769	2024-11-07 22:00:04.106052
12073	12145	Beaufort County Sheriff's Ofc	Entrup, D	    49629	2024-11-07 22:00:04.107904
12074	12146	Beaufort County Sheriff's Ofc	Walker, D	    49014	2024-11-07 22:00:04.110228
12075	12147	Beaufort County Sheriff's Ofc	Aaron, M	    48793	2024-11-07 22:00:04.112328
12076	12148	Bluffton PD	Nelson, B	    48890	2024-11-07 22:00:04.115268
12077	12149	Beaufort County Sheriff's Ofc	Lopez-Solera, J	    49807	2024-11-07 22:00:04.117303
12078	12150	Beaufort County Sheriff's Ofc	Toomey, S	    48736	2024-11-07 22:00:04.121102
12079	12151	Beaufort County Sheriff's Ofc	Lee, Ben	    49470	2024-11-07 22:00:04.12602
12080	12152	Beaufort PD	Humphries, M	    48891	2024-11-07 22:00:04.128126
12081	12153	Beaufort County Sheriff's Ofc	Becker, G	    49643	2024-11-07 22:00:04.130162
12082	12154	Beaufort County Sheriff's Ofc	Lawson, Mo	    49139	2024-11-07 22:00:04.131816
12083	12155	Port Royal PD	Blanco, T	    49461	2024-11-07 22:00:04.133968
12084	12156	Beaufort County Sheriff's Ofc	Lacey, T	    49333	2024-11-07 22:00:04.135818
12085	12157	Beaufort County Sheriff's Ofc	Lacey, T	    49076	2024-11-07 22:00:04.137666
12086	12158	Beaufort County Sheriff's Ofc	Becker, G	    49711	2024-11-07 22:00:04.141018
12087	12160	Beaufort County Sheriff's Ofc	Street, J	    48977	2024-11-07 22:00:04.145198
12088	12161	Beaufort County Sheriff's Ofc	Street, J	    49664	2024-11-07 22:00:04.147767
12089	12162	Beaufort PD	Martinez, Es	    49284	2024-11-07 22:00:04.150397
12090	12163	Beaufort County Sheriff's Ofc	Anderson, Ch	    49108	2024-11-07 22:00:04.153565
12091	12164	South Carolina Highway Patrol	COON	    48986	2024-11-07 22:00:04.155384
12092	12165	Beaufort PD	Danyov, M	    48952	2024-11-07 22:00:04.157738
12093	12166	Beaufort County Sheriff's Ofc	Phillips, D	    49496	2024-11-07 22:00:04.160648
12094	12167	Beaufort County Sheriff's Ofc	Clouse, J	    48972	2024-11-07 22:00:04.162832
12095	12168	Beaufort PD	Palacios, K	    48993	2024-11-07 22:00:04.164483
12096	12169	Bluffton PD		    49690	2024-11-07 22:00:04.166345
12097	12170	Bluffton PD		    48908	2024-11-07 22:00:04.168676
12098	12171	Beaufort County Sheriff's Ofc	Oelschlager, D	    49186	2024-11-07 22:00:04.171533
12099	12172	Beaufort County Sheriff's Ofc	Gray, W	    49115	2024-11-07 22:00:04.175039
12100	12173	Beaufort County Sheriff's Ofc	Takais, G	    49432	2024-11-07 22:00:04.178391
12101	12174	Beaufort County Sheriff's Ofc	Lawson, Mo	    49704	2024-11-07 22:00:04.180555
12102	12175	Beaufort County Sheriff's Ofc	Lawson, Mo	    49703	2024-11-07 22:00:04.182693
12103	12176	Beaufort County Sheriff's Ofc	Cochenour, A	    48882	2024-11-07 22:00:04.184785
12104	12177			    49393	2024-11-07 22:00:04.187369
12105	12178	Beaufort County Sheriff's Ofc	Phillips, D	    49465	2024-11-07 22:00:04.189354
12106	12179	Beaufort County Sheriff's Ofc	Lopez-Solera, J	    49206	2024-11-07 22:00:04.192151
12107	12180	Bluffton PD		    49367	2024-11-07 22:00:04.194588
12108	12181	Beaufort County Sheriff's Ofc	Aaron, M	    49687	2024-11-07 22:00:04.196999
12109	12182	Bluffton PD	Nelson, B	    48734	2024-11-07 22:00:04.198915
12110	12183	Beaufort County Sheriff's Ofc	Seronka, Chad	    49735	2024-11-07 22:00:04.20129
12111	12184	Beaufort County Sheriff's Ofc	Partridge, C	    49616	2024-11-07 22:00:04.203142
12112	12185	South Carolina Highway Patrol	ROMAGNINO	    49488	2024-11-07 22:00:04.205243
12113	12186	Beaufort County Sheriff's Ofc	Lawson, Mo	    49183	2024-11-07 22:00:04.206953
12114	12187	State Transport Police	DEWEESE, BR	    49562	2024-11-07 22:00:04.209528
12115	12188	Port Royal PD	Gonzalez, P	    49338	2024-11-07 22:00:04.213139
12116	12189	Beaufort County Sheriff's Ofc	Aaron, M	    49538	2024-11-07 22:00:04.215216
12117	12190	Beaufort County Sheriff's Ofc	Cleveland, K	    49630	2024-11-07 22:00:04.217956
12118	12191	Port Royal PD	Curry, N	    49779	2024-11-07 22:00:04.220041
12119	12192	Beaufort County Sheriff's Ofc	Snyder, R	    48769	2024-11-07 22:00:04.222347
12120	12193	Beaufort County Sheriff's Ofc	Walker, D	    49547	2024-11-07 22:00:04.224437
12121	12194	Beaufort PD	Anis, H	    49556	2024-11-07 22:00:04.227334
12122	12195	Port Royal PD	Mangione, J	    49196	2024-11-07 22:00:04.22981
12123	12196	South Carolina Highway Patrol	HIGGINS	    49706	2024-11-07 22:00:04.232287
12124	12197	Beaufort County Sheriff's Ofc	Lopez-Solera, J	    48722	2024-11-07 22:00:04.234463
12125	12198	Beaufort County Sheriff's Ofc	Clouse, M	    49730	2024-11-07 22:00:04.236539
12126	12199	Beaufort County Sheriff's Ofc	Seronka, Chad	    48774	2024-11-07 22:00:04.239425
12127	12200	Bluffton PD	Nelson, B	    49796	2024-11-07 22:00:04.241312
12128	12201	Beaufort County Sheriff's Ofc	D'Adamo, G	    49739	2024-11-07 22:00:04.243337
12129	12202	Beaufort County Sheriff's Ofc	Carolus, R	    49402	2024-11-07 22:00:04.245207
12130	12203	Probation Parole	Shytle, D	    49518	2024-11-07 22:00:04.247411
12131	12204	Beaufort PD	Taylor, Jos	    49157	2024-11-07 22:00:04.249265
12132	12205	Beaufort County Sheriff's Ofc	Lepori, Zach	    49070	2024-11-07 22:00:04.252326
12133	12206	Beaufort PD	Setian, Ashley	    48778	2024-11-07 22:00:04.255318
12134	12207	Beaufort County Sheriff's Ofc	Phillips, D	    49765	2024-11-07 22:00:04.257071
12135	12208	Beaufort County Sheriff's Ofc	Snyder, R	    49295	2024-11-07 22:00:04.259022
12136	12209	Beaufort County Sheriff's Ofc	Street, J	    49167	2024-11-07 22:00:04.261505
12137	12210	Beaufort County Sheriff's Ofc	Lee, Ben	    49511	2024-11-07 22:00:04.263795
12138	12211	Beaufort County Sheriff's Ofc	Huggins, M	    48976	2024-11-07 22:00:04.266419
12139	12212	Beaufort County Sheriff's Ofc	Perkins, M	    48855	2024-11-07 22:00:04.267971
12140	12213	Beaufort County Sheriff's Ofc	Perkins, M	    48854	2024-11-07 22:00:04.270056
12141	12214	Beaufort County Sheriff's Ofc	Corcoran, C	    49520	2024-11-07 22:00:04.273391
12142	12215	Beaufort County Sheriff's Ofc	Seronka, Chad	    49210	2024-11-07 22:00:04.27588
12143	12216	Beaufort County Sheriff's Ofc	Seronka, Chad	    49723	2024-11-07 22:00:04.277885
12144	12217	Beaufort County Sheriff's Ofc	Perkins, M	    48834	2024-11-07 22:00:04.279816
12145	12218	Beaufort PD	Thompson, L	    48742	2024-11-07 22:00:04.281779
12146	12219	Beaufort County Detention	Scott, Jesse	    49066	2024-11-07 22:00:04.284091
12147	12220	Beaufort County Sheriff's Ofc	Swinehamer, D	    48911	2024-11-07 22:00:04.286198
12148	12221	Beaufort County Sheriff's Ofc	Perkins, M	    49595	2024-11-07 22:00:04.289275
12149	12222	Beaufort County Sheriff's Ofc	Ahrens, A	    49341	2024-11-07 22:00:04.292453
12150	12223	Beaufort County Sheriff's Ofc	Harvat, A	    48827	2024-11-07 22:00:04.296028
12151	12224	Beaufort County Sheriff's Ofc	Weinberg, K	    49620	2024-11-07 22:00:04.297864
12152	12225	Beaufort County Sheriff's Ofc	Harvat, A	    49640	2024-11-07 22:00:04.300904
12153	12226	Beaufort County Sheriff's Ofc	D'Adamo, G	    49525	2024-11-07 22:00:04.302831
12154	12227	Beaufort County Sheriff's Ofc	Cochenour, A	    48932	2024-11-07 22:00:04.305296
12155	12228	Beaufort County Sheriff's Ofc	Niedergall, B	    49762	2024-11-07 22:00:04.308174
12156	12229	South Carolina Highway Patrol	Castillo, J.	    48729	2024-11-07 22:00:04.31043
12157	12230	Beaufort PD	Danyov, M	    49075	2024-11-07 22:00:04.315178
12158	12231	Port Royal PD	FraireGalindo,K	    49156	2024-11-07 22:00:04.317719
12159	12232	Beaufort County Sheriff's Ofc	Clouse, J	    48786	2024-11-07 22:00:04.32011
12160	12233	Beaufort County Sheriff's Ofc	Seronka, Chad	    49281	2024-11-07 22:00:04.323366
12161	12234	Beaufort County Sheriff's Ofc	Aaron, M	    49351	2024-11-07 22:00:04.325414
12162	12235	Beaufort County Sheriff's Ofc	Harvat, A	    49279	2024-11-07 22:00:04.327455
12163	12236	Beaufort County Sheriff's Ofc	Perkins, M	    48947	2024-11-07 22:00:04.32996
12164	12237	Beaufort County Sheriff's Ofc	Harvat, A	    49449	2024-11-07 22:00:04.332119
12165	12238	Beaufort County Sheriff's Ofc	Noack, M	    49743	2024-11-07 22:00:04.333852
12166	12239	Port Royal PD	Simmons, Ru	    49081	2024-11-07 22:00:04.33583
12167	12240	Bluffton PD	Moore, C	    49426	2024-11-07 22:00:04.338731
12168	12241	Bluffton PD	Cooler, K	    49233	2024-11-07 22:00:04.340463
12169	12242	Beaufort County Detention	Scott, Jesse	    49714	2024-11-07 22:00:04.344368
12170	12243	Beaufort County Sheriff's Ofc	D'Adamo, G	    48803	2024-11-07 22:00:04.346643
12171	12244	Beaufort County Sheriff's Ofc	Petrone, J	    48917	2024-11-07 22:00:04.349294
12172	12245	South Carolina Highway Patrol	COON	    48991	2024-11-07 22:00:04.35196
12173	12246	Bluffton PD		    48885	2024-11-07 22:00:04.353998
12174	12247	Beaufort County Detention	Scott, Jesse	    48823	2024-11-07 22:00:04.355491
12175	12248	Beaufort PD	Snyder, E	    49781	2024-11-07 22:00:04.357622
12176	12249	South Carolina Highway Patrol	CUATA	    49371	2024-11-07 22:00:04.359694
12177	12250	Beaufort County Sheriff's Ofc	Parnell, R	    49728	2024-11-07 22:00:04.361502
12178	12251	Port Royal PD	Curry, N	    49228	2024-11-07 22:00:04.363246
12179	12252	Beaufort County Sheriff's Ofc	Lopez-Solera, J	    48764	2024-11-07 22:00:04.364763
12180	12253	Beaufort PD	Miller, C	    48852	2024-11-07 22:00:04.367321
12181	12254	Port Royal PD	Garvin, M	    49517	2024-11-07 22:00:04.368792
12182	12255	Bluffton PD	Pagano, G	    49771	2024-11-07 22:00:04.370888
12183	12256	Bluffton PD	King, E	    49243	2024-11-07 22:00:04.372582
12184	12257	Beaufort County Sheriff's Ofc	Weinberg, K	    49611	2024-11-07 22:00:04.37441
12185	12258	Beaufort County Sheriff's Ofc	Whitlock, Z	    49607	2024-11-07 22:00:04.378787
12186	12259	Bluffton PD	Ramirez, R	    49598	2024-11-07 22:00:04.380689
12187	12260	Beaufort County Sheriff's Ofc	PENUNS	    49716	2024-11-07 22:00:04.382337
12188	12261	Beaufort County Sheriff's Ofc	Cochenour, A	    49064	2024-11-07 22:00:04.383984
12189	12262	Beaufort County Sheriff's Ofc	Lawson, Mo	    48811	2024-11-07 22:00:04.387292
12190	12263	Beaufort County Sheriff's Ofc	Anderson, Ch	    49370	2024-11-07 22:00:04.388996
12191	12264	Port Royal PD	Shaw, S	    49489	2024-11-07 22:00:04.390649
12192	12265	Beaufort County Sheriff's Ofc	Goodson, D	    49346	2024-11-07 22:00:04.395156
12193	12266	Beaufort PD	Brainerd, J	    49012	2024-11-07 22:00:04.396649
12194	12267	Beaufort PD	Humphries, M	    49074	2024-11-07 22:00:04.398633
12195	12268	Beaufort County Sheriff's Ofc	Takais, G	    48776	2024-11-07 22:00:04.400895
12196	12269	Port Royal PD	Mangione, J	    49466	2024-11-07 22:00:04.403585
12197	12270	Beaufort PD	Bullington, D	    48951	2024-11-07 22:00:04.405118
12198	12271	Bluffton PD		    48969	2024-11-07 22:00:04.40698
12199	12272	Bluffton PD	Quarti, J	    48970	2024-11-07 22:00:04.409265
12200	12273	Beaufort County Sheriff's Ofc	Aaron, M	    49226	2024-11-07 22:00:04.411424
12201	12274	South Carolina Highway Patrol	COON	    48765	2024-11-07 22:00:04.413397
12202	12275	Beaufort PD	Snyder, E	    49423	2024-11-07 22:00:04.415655
12203	12276	Beaufort County Sheriff's Ofc	Aaron, M	    48800	2024-11-07 22:00:04.417159
12204	12277	Beaufort County Sheriff's Ofc	Lee, Ben	    49052	2024-11-07 22:00:04.418937
12205	12278	Beaufort County Sheriff's Ofc	Snyder, R	    49663	2024-11-07 22:00:04.420946
12206	12279	Beaufort County Sheriff's Ofc	Petitt, A	    49340	2024-11-07 22:00:04.422626
12207	12280	Beaufort County Sheriff's Ofc	Ray, Z	    49454	2024-11-07 22:00:04.424411
12208	12281	Beaufort County Sheriff's Ofc	Seronka, Chad	    49229	2024-11-07 22:00:04.426729
12209	12282	Beaufort County Sheriff's Ofc	Aaron, M	    49352	2024-11-07 22:00:04.42836
12210	12283	Beaufort County Sheriff's Ofc	Anderson, Ch	    49171	2024-11-07 22:00:04.429885
12211	12284	Beaufort County Sheriff's Ofc	Lee, Ben	    49634	2024-11-07 22:00:04.432298
12212	12285	Beaufort County Sheriff's Ofc	Aaron, M	    49349	2024-11-07 22:00:04.434597
12213	12286	Beaufort County Detention	Scott, Jesse	    49708	2024-11-07 22:00:04.43647
12214	12287	Beaufort County Sheriff's Ofc	Walker, D	    48893	2024-11-07 22:00:04.438443
12215	12288	Bluffton PD	Brown, Athen	    48912	2024-11-07 22:00:04.440777
12216	12289	Beaufort County Sheriff's Ofc	Clouse, M	    49549	2024-11-07 22:00:04.44343
12217	12290	Beaufort County Sheriff's Ofc	Lepori, Zach	    49028	2024-11-07 22:00:04.446196
12218	12291	Beaufort County Sheriff's Ofc	Partridge, C	    48860	2024-11-07 22:00:04.44792
12219	12292	Dept Natural Resources	ALEXANDER, A.	    49662	2024-11-07 22:00:04.449606
12220	12293	Beaufort County Sheriff's Ofc	D'Adamo, G	    49298	2024-11-07 22:00:04.452673
12221	12294	Beaufort PD	Miller, C	    49287	2024-11-07 22:00:04.454392
12222	12295	Port Royal PD	Garvin, M	    48950	2024-11-07 22:00:04.456356
12223	12296	Beaufort County Sheriff's Ofc	Ahrens, A	    49600	2024-11-07 22:00:04.45903
12224	12297	Beaufort County Sheriff's Ofc	Seronka, Chad	    49772	2024-11-07 22:00:04.460846
12225	12298	Beaufort County Sheriff's Ofc	D'Adamo, G	    49376	2024-11-07 22:00:04.463551
12226	12299	Port Royal PD	Gonzalez, P	    49236	2024-11-07 22:00:04.465145
12227	12300	Beaufort County Sheriff's Ofc	Seronka, Chad	    49017	2024-11-07 22:00:04.467241
12228	12301	Beaufort County Sheriff's Ofc	Lacey, T	    49143	2024-11-07 22:00:04.468989
12229	12302	Beaufort County Sheriff's Ofc	Cleveland, K	    49648	2024-11-07 22:00:04.470848
12230	12303	Beaufort PD	Humphries, M	    49392	2024-11-07 22:00:04.472629
12231	12304	Beaufort County Sheriff's Ofc	Stuckey, J	    49374	2024-11-07 22:00:04.474434
12232	12305	Beaufort PD	Snyder, E	    49777	2024-11-07 22:00:04.476657
12233	12306	Beaufort County Sheriff's Ofc	Perkins, M	    49785	2024-11-07 22:00:04.478355
12234	12307	Beaufort County Sheriff's Ofc	Lawson, Mo	    49555	2024-11-07 22:00:04.47975
12235	12308	Beaufort County Sheriff's Ofc	Meehan, R	    48802	2024-11-07 22:00:04.48274
12236	12309	Probation Parole	Shytle, D	    49112	2024-11-07 22:00:04.484826
12237	12310	Beaufort County Sheriff's Ofc	Aaron, M	    48809	2024-11-07 22:00:04.48656
12238	12311	Jasper County Detention	Benjamin	    49386	2024-11-07 22:00:04.488267
12239	12312	Beaufort County Sheriff's Ofc	Lopez-Solera, J	    49642	2024-11-07 22:00:04.489715
12240	12313	Port Royal PD	Curry, N	    49169	2024-11-07 22:00:04.491947
12241	12314	Bluffton PD	Nass, A	    48906	2024-11-07 22:00:04.495191
12242	12315	Beaufort County Sheriff's Ofc	Summers, K	    49761	2024-11-07 22:00:04.497296
12243	12316	Jasper County Detention		    49316	2024-11-07 22:00:04.499202
12244	12317	Beaufort PD	Palmer, R	    48797	2024-11-07 22:00:04.501135
12245	12318	Port Royal PD	Curry, N	    49583	2024-11-07 22:00:04.502734
12246	12319	Beaufort County Sheriff's Ofc	Petruzzi, Z	    48836	2024-11-07 22:00:04.504683
12247	12320	Beaufort County Sheriff's Ofc	Lee, Ben	    49412	2024-11-07 22:00:04.506952
12248	12321	Beaufort PD	Rice, R	    48760	2024-11-07 22:00:04.509124
12249	12322	Beaufort County Sheriff's Ofc	Seronka, Chad	    49721	2024-11-07 22:00:04.511797
12250	12323	Bluffton PD	Ramirez, R	    49015	2024-11-07 22:00:04.513997
12251	12324	Bluffton PD		    49510	2024-11-07 22:00:04.516285
12252	12325	Dept Natural Resources	DAVENPORT	    49609	2024-11-07 22:00:04.517923
12253	12326	Beaufort County Sheriff's Ofc	Perkins, M	    49585	2024-11-07 22:00:04.52656
12254	12327	Beaufort County Sheriff's Ofc	Anderson, Ch	    49163	2024-11-07 22:00:04.528036
12255	12328	Beaufort County Sheriff's Ofc	Partridge, C	    49758	2024-11-07 22:00:04.529656
12256	12329	Beaufort County Sheriff's Ofc	Oelschlager, D	    49727	2024-11-07 22:00:04.532077
12257	12330	Port Royal PD	Kirby, K	    48975	2024-11-07 22:00:04.534295
12258	12331	Beaufort County Sheriff's Ofc	Kelleher, J	    49311	2024-11-07 22:00:04.536515
12259	12332	Beaufort PD	Anis, H	    49406	2024-11-07 22:00:04.538028
12260	12333	Beaufort County Sheriff's Ofc	Roell, C	    49433	2024-11-07 22:00:04.541117
12261	12334	Beaufort County Sheriff's Ofc	Guidone, V	    49636	2024-11-07 22:00:04.543705
12262	12335	Beaufort County Sheriff's Ofc	Snider, J	    49658	2024-11-07 22:00:04.546214
12263	12336	Jasper County Detention		    49329	2024-11-07 22:00:04.550802
12264	12337	Beaufort County Sheriff's Ofc	Guidone, V	    49578	2024-11-07 22:00:04.552822
12265	12338	Beaufort PD	Wadman, W	    48727	2024-11-07 22:00:04.555402
12266	12339	Jasper County Detention		    49322	2024-11-07 22:00:04.560359
12267	12340	Beaufort County Sheriff's Ofc	Walker, D	    49579	2024-11-07 22:00:04.562267
12268	12341	Beaufort County Sheriff's Ofc	Dickman, J	    49097	2024-11-07 22:00:04.564235
12269	12342	Beaufort County Sheriff's Ofc	Perkins, M	    49309	2024-11-07 22:00:04.566922
12270	12343	South Carolina Highway Patrol	CASTILLO	    49553	2024-11-07 22:00:04.56904
12271	12344	Beaufort County Sheriff's Ofc	Takais, G	    48892	2024-11-07 22:00:04.571377
12272	12345	Beaufort County Sheriff's Ofc	Street, J	    49783	2024-11-07 22:00:04.57444
12273	12346	Beaufort PD	Thompson, L	    49021	2024-11-07 22:00:04.576878
12274	12347	Beaufort PD	Thompson, L	    49462	2024-11-07 22:00:04.578841
12275	12348	Jasper County Detention	Orr	    49271	2024-11-07 22:00:04.58201
12276	12349	Beaufort County Sheriff's Ofc	Perkins, M	    49384	2024-11-07 22:00:04.584186
12277	12350	Beaufort County Sheriff's Ofc	Seronka, Chad	    49737	2024-11-07 22:00:04.587463
12278	12351	Beaufort County Sheriff's Ofc	D'Adamo, G	    49297	2024-11-07 22:00:04.589252
12279	12352	Beaufort County Sheriff's Ofc	Kelleher, J	    49312	2024-11-07 22:00:04.592418
12280	12353	Beaufort PD	Palmer, R	    48754	2024-11-07 22:00:04.594625
12281	12354	Bluffton PD	Schaefer, S	    49029	2024-11-07 22:00:04.59775
12282	12355	Beaufort County Sheriff's Ofc	Takais, G	    49572	2024-11-07 22:00:04.599928
12283	12356	Port Royal PD	Blanco, T	    49557	2024-11-07 22:00:04.601964
12284	12357	Beaufort County Sheriff's Ofc	Lee, Ben	    49005	2024-11-07 22:00:04.60391
12285	12358	Beaufort County Sheriff's Ofc	Lacey, T	    49804	2024-11-07 22:00:04.607052
12286	12359	Beaufort County Sheriff's Ofc	Weinberg, K	    49246	2024-11-07 22:00:04.609464
12287	12360	Beaufort County Sheriff's Ofc	Lawson, Mo	    49544	2024-11-07 22:00:04.611228
12288	12361	Beaufort County Sheriff's Ofc	Guidone, V	    49535	2024-11-07 22:00:04.613661
12289	12362	Beaufort County Sheriff's Ofc	Lee, Ben	    48963	2024-11-07 22:00:04.615267
12290	12363	Jasper County Detention		    49324	2024-11-07 22:00:04.617269
12291	12364	Beaufort County Sheriff's Ofc	Moore, Rick	    49193	2024-11-07 22:00:04.619234
12292	12365	Bluffton PD	Reinl, J	    49760	2024-11-07 22:00:04.622152
12293	12366	Bluffton PD	Lamm, A	    49185	2024-11-07 22:00:04.624012
12294	12367	Port Royal PD	Hogue, J	    48898	2024-11-07 22:00:04.626899
12295	12368	Beaufort County Sheriff's Ofc	Cochenour, A	    48875	2024-11-07 22:00:04.628599
12296	12369	Beaufort County Sheriff's Ofc	Guidone, V	    49113	2024-11-07 22:00:04.631319
12297	12370			    49394	2024-11-07 22:00:04.633757
12298	12371	Beaufort County Sheriff's Ofc	Cochenour, A	    49073	2024-11-07 22:00:04.63536
12299	12372	Beaufort County Sheriff's Ofc	Partridge, C	    49134	2024-11-07 22:00:04.638162
12300	12373	Beaufort County Sheriff's Ofc	Cochenour, A	    49597	2024-11-07 22:00:04.639973
12301	12374	Jasper County Detention	Orr	    49272	2024-11-07 22:00:04.642403
12302	12375	Beaufort County Sheriff's Ofc	Mooney, D	    49592	2024-11-07 22:00:04.644338
12303	12376	Beaufort PD	Arroyo, A	    49095	2024-11-07 22:00:04.645823
12304	12377	Bluffton PD	Schaefer, S	    49150	2024-11-07 22:00:04.64756
12305	12378	Dept Natural Resources	DAVENPORT	    49162	2024-11-07 22:00:04.64959
12306	12379	Beaufort County Sheriff's Ofc	Aaron, M	    49225	2024-11-07 22:00:04.651798
12307	12380	Beaufort County Sheriff's Ofc	Weinberg, K	    49401	2024-11-07 22:00:04.655167
12308	12381	Bluffton PD		    49763	2024-11-07 22:00:04.657021
12309	12382	Beaufort PD	Clementoni, A	    49564	2024-11-07 22:00:04.65933
12310	12383	Beaufort County Sheriff's Ofc	Cooley, Lane	    49018	2024-11-07 22:00:04.662292
12311	12384	Bluffton PD	Pagano, G	    49164	2024-11-07 22:00:04.664401
12312	12385	Bluffton PD	Pasquale, S	    49684	2024-11-07 22:00:04.668461
12313	12386	Bluffton PD	Schaefer, S	    49799	2024-11-07 22:00:04.669957
12314	12387	Beaufort PD	Zielinski, R	    49161	2024-11-07 22:00:04.671865
12315	12388	Probation Parole	Shytle, D	    48872	2024-11-07 22:00:04.673794
12316	12389	Jasper County Detention		    49315	2024-11-07 22:00:04.676116
12317	12390	Beaufort County Sheriff's Ofc	Clouse, M	    49347	2024-11-07 22:00:04.677888
12318	12391	Port Royal PD	Simmons, Ru	    48938	2024-11-07 22:00:04.679472
12319	12392	Beaufort PD	Martinez, Es	    49541	2024-11-07 22:00:04.681188
12320	12393	South Carolina Highway Patrol	COON	    49282	2024-11-07 22:00:04.683099
12321	12394	Yemassee Police Department	SWEAT	    49002	2024-11-07 22:00:04.684641
12322	12395	Port Royal PD	Shaw, S	    48804	2024-11-07 22:00:04.686701
12323	12396	South Carolina Highway Patrol	Castillo, J	    49405	2024-11-07 22:00:04.688404
12324	12397	Beaufort County Sheriff's Ofc	Swinehamer, D	    48995	2024-11-07 22:00:04.690066
12325	12398	Beaufort County Sheriff's Ofc	Morgan, Z	    49700	2024-11-07 22:00:04.691749
12326	12399	Beaufort PD	Palacios, K	    48914	2024-11-07 22:00:04.693618
12327	12400	Beaufort County Sheriff's Ofc	Bolton, C	    48743	2024-11-07 22:00:04.695236
12328	12401	Beaufort County Sheriff's Ofc	Petitt, A	    48888	2024-11-07 22:00:04.69708
12329	12402	South Carolina Highway Patrol	DEGNER	    49227	2024-11-07 22:00:04.698788
12330	12403	Beaufort County Sheriff's Ofc	Lawson, Mo	    49353	2024-11-07 22:00:04.700442
12331	12404	Jasper County Detention		    49328	2024-11-07 22:00:04.70193
12332	12405	Beaufort County Sheriff's Ofc	Goodson, D	    49473	2024-11-07 22:00:04.703792
12333	12406	Beaufort PD	Danyov, M	    49138	2024-11-07 22:00:04.705347
12334	12407	Bluffton PD	Pagano, G	    49528	2024-11-07 22:00:04.70686
12335	12408	Beaufort County Sheriff's Ofc	D'Adamo, G	    48788	2024-11-07 22:00:04.708919
12336	12409	Beaufort County Sheriff's Ofc	Perkins, M	    49308	2024-11-07 22:00:04.710721
12337	12410	Beaufort County Sheriff's Ofc	Seronka, Chad	    49195	2024-11-07 22:00:04.71245
12338	12411	Beaufort County Sheriff's Ofc	Gray, W	    49364	2024-11-07 22:00:04.715114
12339	12412	Beaufort County Sheriff's Ofc	Weinberg, K	    49404	2024-11-07 22:00:04.71699
12340	12413	Beaufort County Sheriff's Ofc	Griffith, B	    48752	2024-11-07 22:00:04.71916
12341	12414	Beaufort County Sheriff's Ofc	Partridge, C	    49751	2024-11-07 22:00:04.720775
12342	12415	Beaufort County Sheriff's Ofc	Harvat, A	    49256	2024-11-07 22:00:04.723128
12343	12416	Port Royal PD	DiDonato, A	    48733	2024-11-07 22:00:04.724957
12344	12417	Beaufort County Sheriff's Ofc	Perkins, M	    49237	2024-11-07 22:00:04.72707
12345	12418	Port Royal PD	Kirby, K	    49493	2024-11-07 22:00:04.728635
12346	12419	South Carolina Highway Patrol	AMANATIDES, W.	    49414	2024-11-07 22:00:04.730886
12347	12420	Yemassee Police Department	SMITH C	    49563	2024-11-07 22:00:04.733259
12348	12421	Beaufort County Sheriff's Ofc	Lee, Ben	    49260	2024-11-07 22:00:04.735075
12349	12422	Bluffton PD	Lopez, Chris	    49085	2024-11-07 22:00:04.736888
12350	12423	Port Royal PD	Simmons, Ru	    49120	2024-11-07 22:00:04.739509
12351	12424	South Carolina Highway Patrol	COON	    49667	2024-11-07 22:00:04.7412
12352	12425	Beaufort County Sheriff's Ofc	Knoepfle, S	    49581	2024-11-07 22:00:04.743923
12353	12426	Beaufort County Sheriff's Ofc	Niedergall, A	    49770	2024-11-07 22:00:04.746773
12354	12427	South Carolina Highway Patrol	AMANATIDES	    49586	2024-11-07 22:00:04.749021
12355	12428	Beaufort PD	Palacios, K	    49306	2024-11-07 22:00:04.752765
12356	12429	Port Royal PD	Mayo, J	    49806	2024-11-07 22:00:04.754648
12357	12430	Beaufort PD	Palacios, K	    49438	2024-11-07 22:00:04.756179
12358	12431	Beaufort PD	Whitmore, B	    49780	2024-11-07 22:00:04.758088
12359	12432	Beaufort County Sheriff's Ofc	Snyder, R	    48859	2024-11-07 22:00:04.760167
12360	12433	Beaufort County Sheriff's Ofc	Harvat, A	    49245	2024-11-07 22:00:04.7618
12361	12434	Beaufort County Sheriff's Ofc	Phillips, D	    49738	2024-11-07 22:00:04.764121
12362	12435	Beaufort PD	Piatt, C	    48945	2024-11-07 22:00:04.765599
12363	12436	Beaufort County Sheriff's Ofc	Street, J	    49660	2024-11-07 22:00:04.768163
12364	12437	Beaufort County Detention	TEASDELL	    49594	2024-11-07 22:00:04.769893
12365	12438	Beaufort County Sheriff's Ofc	D'Adamo, G	    49377	2024-11-07 22:00:04.771465
12366	12439	Beaufort County Sheriff's Ofc	Anderson, Ch	    49369	2024-11-07 22:00:04.774962
12367	12440	Port Royal PD	Mangione, J	    49500	2024-11-07 22:00:04.779742
12368	12441	Beaufort County Sheriff's Ofc	Anderson, Ch	    48974	2024-11-07 22:00:04.781857
12369	12442	Beaufort County Sheriff's Ofc	Seronka, Chad	    49383	2024-11-07 22:00:04.787546
12370	12443	Beaufort County Detention	Scott, Jesse	    49712	2024-11-07 22:00:04.789108
12371	12444	Beaufort County Sheriff's Ofc	Lepori, Zach	    49505	2024-11-07 22:00:04.790938
12372	12445	Beaufort PD	Thompson, L	    48732	2024-11-07 22:00:04.793056
12373	12446	Bluffton PD	King, E	    49568	2024-11-07 22:00:04.794855
12374	12447	South Carolina Highway Patrol	CLARKSON	    49147	2024-11-07 22:00:04.796908
12375	12448	Beaufort County Sheriff's Ofc	Lee, Ben	    48817	2024-11-07 22:00:04.799445
12376	12449	Port Royal PD	Curry, N	    48962	2024-11-07 22:00:04.80163
12377	12450	Beaufort PD	Taylor, Jos	    49102	2024-11-07 22:00:04.803069
12378	12451	Beaufort PD	Piatt, C	    49135	2024-11-07 22:00:04.804818
12379	12452	Beaufort PD	Humphries, M	    49314	2024-11-07 22:00:04.808393
12380	12453	Port Royal PD	Garvin, M	    49420	2024-11-07 22:00:04.811111
12381	12454	Beaufort County Sheriff's Ofc	Crowley, W	    49752	2024-11-07 22:00:04.812608
12382	12455	South Carolina Highway Patrol	B.V FLOOD	    49632	2024-11-07 22:00:04.81421
12383	12456	South Carolina Highway Patrol	DEGNER	    49168	2024-11-07 22:00:04.81686
12384	12457	Bluffton PD	Luechtefeld, A	    49606	2024-11-07 22:00:04.818645
12385	12458	Beaufort County Sheriff's Ofc	Weaver, J	    49200	2024-11-07 22:00:04.820069
12386	12459	Beaufort PD	Jackson, J	    49789	2024-11-07 22:00:04.8216
12387	12460	Beaufort PD	Miller, C	    48926	2024-11-07 22:00:04.82377
12388	12461	Beaufort PD	Miller, C	    49474	2024-11-07 22:00:04.825761
12389	12462	Beaufort County Sheriff's Ofc	Paul, A	    49468	2024-11-07 22:00:04.82798
12390	12463	Beaufort County Sheriff's Ofc	Gray, W	    49259	2024-11-07 22:00:04.831682
12391	12464	Beaufort County Sheriff's Ofc	Lepori, Zach	    49749	2024-11-07 22:00:04.83326
12392	12465	Beaufort County Sheriff's Ofc	Partridge, C	    49254	2024-11-07 22:00:04.835011
12393	12466			    49397	2024-11-07 22:00:04.838012
12394	12467	Port Royal PD	Simmons, Ru	    49009	2024-11-07 22:00:04.839593
12395	12468	Port Royal PD	Gonzalez, P	    49655	2024-11-07 22:00:04.843682
12396	12469	Beaufort County Sheriff's Ofc	Gray, W	    49742	2024-11-07 22:00:04.846233
12397	12470	Beaufort County Sheriff's Ofc	Becker, G	    49019	2024-11-07 22:00:04.849252
12398	12471	Beaufort PD	Setian, Ashley	    48781	2024-11-07 22:00:04.850837
12399	12472	Beaufort County Sheriff's Ofc	Mooney, D	    49522	2024-11-07 22:00:04.852407
12400	12473	Port Royal PD	DiDonato, A	    48916	2024-11-07 22:00:04.853689
12401	12474	Beaufort County Sheriff's Ofc	Cochenour, A	    49137	2024-11-07 22:00:04.855174
12402	12475	Beaufort County Sheriff's Ofc	Lawson, Mo	    49792	2024-11-07 22:00:04.857449
12403	12476	Beaufort County Sheriff's Ofc	Lopez-Solera, J	    48730	2024-11-07 22:00:04.859343
12404	12477	Beaufort County Sheriff's Ofc	Seronka, Chad	    49201	2024-11-07 22:00:04.860902
12405	12478	Beaufort County Sheriff's Ofc	Clouse, J	    49160	2024-11-07 22:00:04.862932
12406	12479	Beaufort County Sheriff's Ofc	Aaron, M	    49588	2024-11-07 22:00:04.864336
12407	12480	Beaufort County Sheriff's Ofc	Weinberg, K	    49593	2024-11-07 22:00:04.865825
12408	12481	Beaufort PD	Rice, R	    48787	2024-11-07 22:00:04.870393
12409	12482	Beaufort County Sheriff's Ofc	Aaron, M	    49732	2024-11-07 22:00:04.872074
12410	12483	Beaufort County Sheriff's Ofc	Kaase, B	    49560	2024-11-07 22:00:04.873644
12411	12484	Beaufort County Sheriff's Ofc	Malphrus, D	    48921	2024-11-07 22:00:04.875903
12412	12485	Beaufort County Sheriff's Ofc	Lopez-Solera, J	    49599	2024-11-07 22:00:04.877903
12413	12486	Beaufort County Sheriff's Ofc	Hanna, C	    49682	2024-11-07 22:00:04.879444
12414	12487	Beaufort County Sheriff's Ofc	Meehan, R	    49419	2024-11-07 22:00:04.880946
12415	12488	Beaufort PD	Danyov, M	    49204	2024-11-07 22:00:04.882569
12416	12489	Beaufort PD	Miller, C	    49303	2024-11-07 22:00:04.884322
12417	12490	Beaufort County Sheriff's Ofc	Snyder, R	    49734	2024-11-07 22:00:04.886957
12418	12491	Beaufort County Sheriff's Ofc	Clouse, M	    49773	2024-11-07 22:00:04.888758
12419	12492	Beaufort County Sheriff's Ofc	Morgan, Z	    48720	2024-11-07 22:00:04.890243
12420	12493	South Carolina Highway Patrol	MAULE, L.	    49211	2024-11-07 22:00:04.892838
12421	12494	Port Royal PD	Gonzalez, P	    49508	2024-11-07 22:00:04.894321
12422	12495	Beaufort County Sheriff's Ofc	Partridge, C	    48946	2024-11-07 22:00:04.895721
12423	12496	Beaufort County Sheriff's Ofc	Snyder, R	    49715	2024-11-07 22:00:04.89792
12424	12497	Beaufort County Sheriff's Ofc	Roell, C	    49689	2024-11-07 22:00:04.900198
12425	12498	Beaufort County Sheriff's Ofc	Anderson, Ch	    49692	2024-11-07 22:00:04.901811
12426	12499	Beaufort PD	Jackson, J	    48821	2024-11-07 22:00:04.903698
12427	12500	Beaufort PD	Palacios, K	    49165	2024-11-07 22:00:04.905205
12428	12501	Beaufort County Sheriff's Ofc	Oelschlager, D	    49191	2024-11-07 22:00:04.90692
12429	12502	Beaufort PD	Jones, Seth	    49343	2024-11-07 22:00:04.908928
12430	12503	Beaufort PD	Miller, C	    49357	2024-11-07 22:00:04.911526
12431	12504	Beaufort County Sheriff's Ofc	Baglio, T	    49378	2024-11-07 22:00:04.913168
12432	12505	Beaufort County Sheriff's Ofc	Seronka, Chad	    49060	2024-11-07 22:00:04.915376
12433	12506	Beaufort County Sheriff's Ofc	Perkins, M	    49509	2024-11-07 22:00:04.917436
12434	12507	Beaufort County Sheriff's Ofc	Weinberg, K	    48773	2024-11-07 22:00:04.919146
12435	12508	Beaufort County Sheriff's Ofc	Lee, Ben	    48818	2024-11-07 22:00:04.920741
12436	12509	Bluffton PD	Young, A	    49463	2024-11-07 22:00:04.922381
12437	12510	Beaufort County Sheriff's Ofc	Moore, Rick	    49519	2024-11-07 22:00:04.924628
12438	12511	Beaufort County Sheriff's Ofc	Griffith, B	    48813	2024-11-07 22:00:04.926695
12439	12512	Beaufort County Sheriff's Ofc	Imbert, J	    48751	2024-11-07 22:00:04.928382
12440	12513	Beaufort County Sheriff's Ofc	Roell, C	    48871	2024-11-07 22:00:04.929818
12441	12514	Beaufort County Sheriff's Ofc	Cochenour, A	    49652	2024-11-07 22:00:04.931346
12442	12515	Beaufort County Sheriff's Ofc	Seronka, Chad	    49292	2024-11-07 22:00:04.933605
12443	12516	Port Royal PD	Blanco, T	    48747	2024-11-07 22:00:04.934981
12444	12517	Beaufort County Sheriff's Ofc	Lee, Ben	    48759	2024-11-07 22:00:04.939556
12445	12518	Port Royal PD	Poole, R	    49733	2024-11-07 22:00:04.942093
12446	12519	Beaufort PD	Jackson, J	    48763	2024-11-07 22:00:04.944006
12447	12520	Beaufort County Sheriff's Ofc	Anderson, Ch	    49290	2024-11-07 22:00:04.946006
12448	12521	Port Royal PD	Simmons, Ru	    48795	2024-11-07 22:00:04.947734
12449	12522	Beaufort County Sheriff's Ofc	Prusinowski,Jam	    49221	2024-11-07 22:00:04.94917
12450	12523	Beaufort County Sheriff's Ofc	Lee, Ben	    48791	2024-11-07 22:00:04.951504
12451	12524	Beaufort County Sheriff's Ofc	Gray, W	    49096	2024-11-07 22:00:04.953621
12452	12525	Beaufort PD	Brainerd, J	    49244	2024-11-07 22:00:04.955214
12453	12526	Bluffton PD	Quarti, J	    49373	2024-11-07 22:00:04.956725
12454	12527	Beaufort PD	Piatt, C	    48739	2024-11-07 22:00:04.958779
12455	12528	Beaufort PD	Gallivan, A	    49614	2024-11-07 22:00:04.960634
12456	12529	South Carolina Highway Patrol	clarkson	    49766	2024-11-07 22:00:04.96227
12457	12530	Beaufort County Sheriff's Ofc	Street, J	    49291	2024-11-07 22:00:04.964967
12458	12531	Beaufort County Sheriff's Ofc	Aaron, M	    49362	2024-11-07 22:00:04.966412
12459	12532	Beaufort County Sheriff's Ofc	Aaron, M	    48845	2024-11-07 22:00:04.968013
12460	12533	Beaufort County Sheriff's Ofc	Lopez-Solera, J	    49575	2024-11-07 22:00:04.969444
12461	12534	Port Royal PD	Simmons, Ru	    49748	2024-11-07 22:00:04.971169
12462	12535	Beaufort PD	Martinez, Es	    49490	2024-11-07 22:00:04.973726
12463	12536	Beaufort County Sheriff's Ofc	Crowley, W	    49709	2024-11-07 22:00:04.976328
12464	12537	Beaufort PD	Lynch, C	    48828	2024-11-07 22:00:04.978611
12465	12538	Beaufort County Sheriff's Ofc	Seronka, Chad	    49774	2024-11-07 22:00:04.979995
12466	12539	Beaufort County Sheriff's Ofc	Cochenour, A	    49615	2024-11-07 22:00:04.982114
12467	12540	Beaufort County Sheriff's Ofc	Clouse, J	    49181	2024-11-07 22:00:04.983576
12468	12541	Bluffton PD		    49472	2024-11-07 22:00:04.985226
12469	12542	Beaufort County Sheriff's Ofc	Weinberg, K	    49198	2024-11-07 22:00:04.987525
12470	12543	Beaufort County Sheriff's Ofc	Paul, A	    49559	2024-11-07 22:00:04.989117
12471	12544	Jasper County Detention	SMITH	    49320	2024-11-07 22:00:04.991791
12472	12545	Beaufort County Sheriff's Ofc	DeMars, J	    49355	2024-11-07 22:00:04.993617
12473	12546	Beaufort County Sheriff's Ofc	Walker, D	    48832	2024-11-07 22:00:04.995404
12474	12547	South Carolina Highway Patrol	ROMAGNINO	    48966	2024-11-07 22:00:04.99766
12475	12548	South Carolina Highway Patrol	Higgins	    49252	2024-11-07 22:00:05.000333
12476	12549	Beaufort County Sheriff's Ofc	Lopez-Solera, J	    49251	2024-11-07 22:00:05.002571
12477	12550	Beaufort County Sheriff's Ofc	Lopez-Solera, J	    49250	2024-11-07 22:00:05.00439
12478	12551	Beaufort County Sheriff's Ofc	Aaron, M	    48870	2024-11-07 22:00:05.006307
12479	12552	Beaufort County Sheriff's Ofc	Lee, Ben	    49526	2024-11-07 22:00:05.008745
12480	12553	Port Royal PD	Finley, Nichola	    49372	2024-11-07 22:00:05.011243
12481	12554	Beaufort County Sheriff's Ofc	Cochenour, A	    49447	2024-11-07 22:00:05.013274
12482	12555	Beaufort County Sheriff's Ofc	DeMars, J	    49529	2024-11-07 22:00:05.014868
12483	12556	South Carolina Highway Patrol	HIOTT	    49231	2024-11-07 22:00:05.016574
12484	12557	Beaufort County Sheriff's Ofc	Walker, D	    49697	2024-11-07 22:00:05.022013
12485	12558	Beaufort County Sheriff's Ofc	Walker, D	    49698	2024-11-07 22:00:05.023454
12486	12559	Beaufort County Sheriff's Ofc	Whitlock, Z	    49247	2024-11-07 22:00:05.026653
12487	12560	Port Royal PD	Simmons, Ru	    48989	2024-11-07 22:00:05.028897
12488	12561	Beaufort County Sheriff's Ofc	Harvat, A	    49323	2024-11-07 22:00:05.031568
12489	12562	Beaufort County Sheriff's Ofc	Lopez-Solera, J	    49453	2024-11-07 22:00:05.033605
12490	12563	Beaufort County Sheriff's Ofc	Scheemaker, J	    49688	2024-11-07 22:00:05.036052
12491	12564	Beaufort County Sheriff's Ofc	Snyder, R	    49574	2024-11-07 22:00:05.037668
12492	12565	South Carolina Highway Patrol	Gargiulo, M	    49011	2024-11-07 22:00:05.039375
12493	12566	Bluffton PD		    49744	2024-11-07 22:00:05.041199
12494	12567	Jasper County Detention	BENJAMIN	    49390	2024-11-07 22:00:05.04369
12495	12568	Bluffton PD		    49158	2024-11-07 22:00:05.045245
12496	12570	Beaufort County Sheriff's Ofc	Seronka, Chad	    49203	2024-11-07 22:00:05.047473
12497	12571	Beaufort County Sheriff's Ofc	D'Adamo, J	    49695	2024-11-07 22:00:05.048906
12498	12572	Beaufort County Sheriff's Ofc	D'Adamo, J	    49696	2024-11-07 22:00:05.050379
12499	12573	South Carolina Highway Patrol	ROMAGNIO	    49358	2024-11-07 22:00:05.051783
12500	12574	Jasper County Detention		    49327	2024-11-07 22:00:05.054383
12501	12575	Beaufort County Sheriff's Ofc	Cochenour, A	    48724	2024-11-07 22:00:05.05587
12502	12576	Beaufort County Sheriff's Ofc	Imbert, J	    48956	2024-11-07 22:00:05.058415
12503	12577	Beaufort County Sheriff's Ofc	Guidone, V	    49625	2024-11-07 22:00:05.060717
12504	12578	Beaufort County Sheriff's Ofc	Partridge, C	    49757	2024-11-07 22:00:05.062092
12505	12579			    49389	2024-11-07 22:00:05.064607
12506	12580	Beaufort County Sheriff's Ofc	Stuckey, J	    48758	2024-11-07 22:00:05.065969
12507	12581	Beaufort County Sheriff's Ofc	Lepori, Zach	    48887	2024-11-07 22:00:05.067608
12508	12582	Beaufort County Sheriff's Ofc	Clouse, M	    48922	2024-11-07 22:00:05.069255
12509	12583	Beaufort County Sheriff's Ofc	Anderson, Ch	    48941	2024-11-07 22:00:05.070829
12510	12584	Beaufort County Sheriff's Ofc	Summers, K	    49146	2024-11-07 22:00:05.072065
12511	12585	South Carolina Highway Patrol	DEGNER	    49669	2024-11-07 22:00:05.07412
12512	12586	Bluffton PD		    49677	2024-11-07 22:00:05.076961
12513	12587	South Carolina Highway Patrol	Gargiulo, M	    49248	2024-11-07 22:00:05.079112
12514	12588	Beaufort PD	Martinez, Es	    49542	2024-11-07 22:00:05.08125
12515	12589	Beaufort County Sheriff's Ofc	Aaron, M	    49055	2024-11-07 22:00:05.08338
12516	12590	Beaufort PD	Whitmore, B	    49216	2024-11-07 22:00:05.085137
12517	12591	Beaufort County Sheriff's Ofc	Perkins, M	    49443	2024-11-07 22:00:05.086379
12518	12592	Beaufort County Sheriff's Ofc	Imbert, J	    48775	2024-11-07 22:00:05.089012
12519	12593	Beaufort County Sheriff's Ofc	Erickson, M	    49492	2024-11-07 22:00:05.091516
12520	12594	Beaufort PD	Danyov, M	    49013	2024-11-07 22:00:05.093291
12521	12595	Beaufort County Sheriff's Ofc	Snyder, R	    49037	2024-11-07 22:00:05.09549
12522	12596	Beaufort County Sheriff's Ofc	Gray, W	    49100	2024-11-07 22:00:05.09783
12523	12597	Beaufort County Sheriff's Ofc	GRISSETT, T	    49313	2024-11-07 22:00:05.099328
12524	12598	Beaufort County Sheriff's Ofc	Anderson, Ch	    49729	2024-11-07 22:00:05.101198
12525	12599	Beaufort County Sheriff's Ofc	Lee, Ben	    49471	2024-11-07 22:00:05.102858
12526	12600	Beaufort County Sheriff's Ofc	Lawson, Mo	    48864	2024-11-07 22:00:05.104529
12527	12601	Bluffton PD	King, E	    49755	2024-11-07 22:00:05.106215
12528	12602	Yemassee Police Department	BENNETTT	    49531	2024-11-07 22:00:05.108599
12529	12603	Beaufort County Sheriff's Ofc	Weinberg, K	    49619	2024-11-07 22:00:05.111549
12530	12604	South Carolina Highway Patrol	MAULE	    49507	2024-11-07 22:00:05.113043
12531	12605	Beaufort County Sheriff's Ofc	Lee, Ben	    48865	2024-11-07 22:00:05.115234
12532	12606	Probation Parole	Fritz, R	    49391	2024-11-07 22:00:05.11704
12533	12607	Probation Parole	Fritz, R	    49624	2024-11-07 22:00:05.118388
12534	12608	Beaufort County Sheriff's Ofc	Seronka, Chad	    49109	2024-11-07 22:00:05.120045
12535	12609	Beaufort PD	Whitmore, B	    49661	2024-11-07 22:00:05.121628
12536	12610	South Carolina Highway Patrol	Deweese	    49286	2024-11-07 22:00:05.12315
12537	12611	Beaufort County Sheriff's Ofc	Lawson, Mo	    48978	2024-11-07 22:00:05.126371
12538	12612	Bluffton PD		    49275	2024-11-07 22:00:05.128149
12539	12613	Bluffton PD	Schaefer, S	    49276	2024-11-07 22:00:05.129618
12540	12614	Beaufort PD	W WADMAN	    49653	2024-11-07 22:00:05.13131
12541	12615	Beaufort County Sheriff's Ofc	Takais, G	    49435	2024-11-07 22:00:05.133008
12542	12616	Beaufort PD	Palacios, K	    49039	2024-11-07 22:00:05.136078
12543	12617	Beaufort County Sheriff's Ofc	Cochenour, A	    48737	2024-11-07 22:00:05.137837
12544	12618	Bluffton PD		    49310	2024-11-07 22:00:05.139244
12545	12619	Beaufort County Sheriff's Ofc	Carolus, R	    48895	2024-11-07 22:00:05.140889
12546	12620	Beaufort County Sheriff's Ofc	Morgan, Z	    48745	2024-11-07 22:00:05.143114
12547	12621	Beaufort County Sheriff's Ofc	Aaron, M	    48965	2024-11-07 22:00:05.144874
12548	12622	Beaufort County Sheriff's Ofc	Dickman, J	    48984	2024-11-07 22:00:05.146936
12549	12623	Port Royal PD	Shaw, S	    49487	2024-11-07 22:00:05.148527
12550	12624	South Carolina Highway Patrol	Boyd, T	    49605	2024-11-07 22:00:05.150969
12551	12625	Port Royal PD	Blanco, T	    48825	2024-11-07 22:00:05.153724
12552	12626	Beaufort County Sheriff's Ofc	Harvat, A	    48899	2024-11-07 22:00:05.155093
12553	12627	Beaufort County Sheriff's Ofc	Aaron, M	    48985	2024-11-07 22:00:05.157682
12554	12628	Beaufort PD	Miller, C	    49166	2024-11-07 22:00:05.15988
12555	12629	Beaufort County Sheriff's Ofc	Imbert, J	    49182	2024-11-07 22:00:05.161564
12556	12630	Beaufort County Sheriff's Ofc	Perkins, M	    49551	2024-11-07 22:00:05.163648
12557	12631	Beaufort County Sheriff's Ofc	DeMars, J	    49179	2024-11-07 22:00:05.164959
12558	12632	Solicitor's Office	BLACK, T	    48756	2024-11-07 22:00:05.166562
12559	12633	Beaufort County Sheriff's Ofc	Lee, Ben	    49190	2024-11-07 22:00:05.168126
12560	12634	Dept Natural Resources	RIOUX	    49539	2024-11-07 22:00:05.170902
12561	12635	Bluffton PD	Ramirez, R	    49136	2024-11-07 22:00:05.173228
12562	12636	Beaufort County Sheriff's Ofc	Paul, A	    48735	2024-11-07 22:00:05.174637
12563	12637	South Carolina Highway Patrol	COHEN	    49121	2024-11-07 22:00:05.177217
12564	12638	Beaufort County Sheriff's Ofc	Gray, W	    49363	2024-11-07 22:00:05.178559
12565	12639	Beaufort County Sheriff's Ofc	Weaver, J	    49079	2024-11-07 22:00:05.180038
12566	12640	Beaufort County Sheriff's Ofc	Lawson, Mo	    48749	2024-11-07 22:00:05.182318
12567	12641	Beaufort County Sheriff's Ofc	Perkins, M	    48920	2024-11-07 22:00:05.184972
12568	12642	Port Royal PD	Blanco, T	    49274	2024-11-07 22:00:05.186897
12569	12643	Beaufort County Sheriff's Ofc	Guidone, V	    48849	2024-11-07 22:00:05.189219
12570	12644	Beaufort County Sheriff's Ofc	Cochenour, A	    49745	2024-11-07 22:00:05.191303
12571	12645	Bluffton PD	Pagano, G	    49365	2024-11-07 22:00:05.193507
12572	12646	Jasper County Detention		    49319	2024-11-07 22:00:05.196462
12573	12647	Beaufort PD	Palacios, K	    48994	2024-11-07 22:00:05.197958
12574	12648	Beaufort County Sheriff's Ofc	Black, L	    48837	2024-11-07 22:00:05.19987
12575	12649	Beaufort County Sheriff's Ofc	Cochenour, A	    49071	2024-11-07 22:00:05.202492
12576	12650	Beaufort County Sheriff's Ofc	Cox, G	    49786	2024-11-07 22:00:05.204583
12577	12651	Probation Parole	Fritz, R	    49220	2024-11-07 22:00:05.20769
12578	12652	South Carolina Highway Patrol	NOBLES	    49455	2024-11-07 22:00:05.209778
12579	12653	Beaufort County Sheriff's Ofc	Seronka, Chad	    49218	2024-11-07 22:00:05.211702
12580	12654	Beaufort County Detention	Scott, Jesse	    49239	2024-11-07 22:00:05.213132
12581	12655	South Carolina Highway Patrol	HIGGINS J.M.	    49767	2024-11-07 22:00:05.214916
12582	12656	Beaufort PD	Arroyo, A	    49175	2024-11-07 22:00:05.216469
12583	12657	Beaufort County Sheriff's Ofc	Stuckey, J	    48940	2024-11-07 22:00:05.218303
12584	12658	Port Royal PD	Bunting, P	    48954	2024-11-07 22:00:05.219849
12585	12659	South Carolina Highway Patrol	CASTILLO	    49031	2024-11-07 22:00:05.221635
12586	12660	South Carolina Highway Patrol	ROMAGNINO	    49354	2024-11-07 22:00:05.222994
12587	12661	Beaufort County Sheriff's Ofc	Walker, D	    48902	2024-11-07 22:00:05.225323
12588	12662	Beaufort County Sheriff's Ofc	Gray, W	    49056	2024-11-07 22:00:05.227986
12589	12663	Beaufort County Sheriff's Ofc	Seronka, Chad	    49101	2024-11-07 22:00:05.229516
12590	12664	Beaufort County Sheriff's Ofc	Lawson, Mo	    49416	2024-11-07 22:00:05.230929
12591	12665	Bluffton PD	Brown	    49440	2024-11-07 22:00:05.232591
12592	12666	USC Bluffton Police Dept	ADKINS	    49570	2024-11-07 22:00:05.234549
12593	12667	Bluffton PD	Corlett, T	    49641	2024-11-07 22:00:05.236518
12594	12668	Beaufort County Sheriff's Ofc	Seronka, Chad	    49339	2024-11-07 22:00:05.239118
12595	12669	Beaufort County Sheriff's Ofc	Aaron, M	    49705	2024-11-07 22:00:05.241017
12596	12670	Port Royal PD		    48838	2024-11-07 22:00:05.243671
12597	12671	Bluffton PD	Lindiakos, A	    49337	2024-11-07 22:00:05.245137
12598	12672	Beaufort PD	Rice, R	    49212	2024-11-07 22:00:05.24665
12599	12673	Beaufort County Sheriff's Ofc	Takais, G	    49359	2024-11-07 22:00:05.249015
12600	12674	Beaufort PD	PIATT, COURTNEY	    49717	2024-11-07 22:00:05.250497
12601	12675	Beaufort PD	Miller, C	    49791	2024-11-07 22:00:05.251958
12602	12676	Port Royal PD	Hogue, J	    49280	2024-11-07 22:00:05.253538
12603	12677	Beaufort County Sheriff's Ofc	Snyder, R	    49142	2024-11-07 22:00:05.255154
12604	12678	Beaufort County Sheriff's Ofc	Snyder, R	    49805	2024-11-07 22:00:05.256622
12605	12679	Beaufort County Sheriff's Ofc	Dickman, J	    49486	2024-11-07 22:00:05.258423
12606	12680	Port Royal PD	Simmons, Ru	    48806	2024-11-07 22:00:05.261122
12607	12681	Beaufort County Sheriff's Ofc	Crowley, W	    49249	2024-11-07 22:00:05.263225
12608	12682	South Carolina Highway Patrol	COON	    49368	2024-11-07 22:00:05.264722
12609	12683	Beaufort County Sheriff's Ofc	Lee, Ben	    48988	2024-11-07 22:00:05.266728
12610	12684	Beaufort County Sheriff's Ofc	Perkins, M	    49235	2024-11-07 22:00:05.267974
12611	12685	Beaufort PD	Rice, R	    49633	2024-11-07 22:00:05.26978
12612	12686	Beaufort County Sheriff's Ofc	Perkins, M	    49596	2024-11-07 22:00:05.271177
12613	12687	South Carolina Highway Patrol	LUCAS SW	    49793	2024-11-07 22:00:05.272645
12614	12688	Beaufort County Sheriff's Ofc	Lee, Ben	    49111	2024-11-07 22:00:05.273963
12615	12689	Beaufort County Sheriff's Ofc	Lee, Ben	    49436	2024-11-07 22:00:05.276377
12616	12690	Beaufort PD	Thompson, L	    48723	2024-11-07 22:00:05.278493
12617	12691	Beaufort County Sheriff's Ofc	Perkins, M	    48766	2024-11-07 22:00:05.28022
12618	12692	Beaufort County Sheriff's Ofc	Guidone, V	    49523	2024-11-07 22:00:05.282699
12619	12693	Beaufort County Sheriff's Ofc	Guidone, V	    49521	2024-11-07 22:00:05.284153
12620	12694	South Carolina Highway Patrol	HIGGINS	    49334	2024-11-07 22:00:05.285267
12621	12695	Beaufort County Sheriff's Ofc	Guidone, V	    48794	2024-11-07 22:00:05.287598
12622	12696	Beaufort County Sheriff's Ofc	Goodson, D	    49382	2024-11-07 22:00:05.290002
12623	12697	Bluffton PD	Higgins, J	    49617	2024-11-07 22:00:05.292399
12624	12698	Port Royal PD	Curry, N	    49180	2024-11-07 22:00:05.294245
12625	12699	Port Royal PD	Simmons, Ru	    49439	2024-11-07 22:00:05.296648
12626	12700	Probation Parole	Fritz, R	    48757	2024-11-07 22:00:05.298423
12627	12701	Beaufort County Sheriff's Ofc	Gray, W	    49114	2024-11-07 22:00:05.299939
12628	12702	Beaufort County Sheriff's Ofc	Kelleher, J	    49205	2024-11-07 22:00:05.302972
12629	12703	Beaufort County Sheriff's Ofc	Baglio, T	    49123	2024-11-07 22:00:05.304761
12630	12704	Beaufort County Sheriff's Ofc	Perkins, M	    49431	2024-11-07 22:00:05.306271
12631	12705	Beaufort County Sheriff's Ofc	Perkins, M	    49430	2024-11-07 22:00:05.308914
12632	12706	Beaufort County Sheriff's Ofc	Gray, W	    48868	2024-11-07 22:00:05.309958
12633	12707	Beaufort County Sheriff's Ofc	Moore, Rick	    49118	2024-11-07 22:00:05.312346
12634	12708	Beaufort PD	Anis, H	    49565	2024-11-07 22:00:05.314013
12635	12709	Bluffton PD	Ramirez, R	    48746	2024-11-07 22:00:05.315601
12636	12710	Beaufort County Sheriff's Ofc	Aaron, M	    49672	2024-11-07 22:00:05.318086
12637	12711	Beaufort County Sheriff's Ofc	Walker, D	    49078	2024-11-07 22:00:05.319406
12638	12712	Beaufort County Sheriff's Ofc	Harvat, A	    49460	2024-11-07 22:00:05.321129
12639	12713	South Carolina Highway Patrol	Wampler, C	    49106	2024-11-07 22:00:05.323304
12640	12714	Beaufort County Sheriff's Ofc	Ahrens, K	    49145	2024-11-07 22:00:05.325978
12641	12715	Beaufort County Sheriff's Ofc	Seronka, Chad	    49724	2024-11-07 22:00:05.328499
12642	12716	Beaufort County Sheriff's Ofc	Perkins, M	    49409	2024-11-07 22:00:05.329867
12643	12717			    49395	2024-11-07 22:00:05.332801
12644	12719	Beaufort County Sheriff's Ofc	Lee, Ben	    48967	2024-11-07 22:00:05.335142
12645	12720	Beaufort County Sheriff's Ofc	Dickman, J	    49635	2024-11-07 22:00:05.337933
12646	12721	Beaufort County Sheriff's Ofc	Cochenour, A	    48874	2024-11-07 22:00:05.339676
12647	12722	South Carolina Highway Patrol	BURNHAM	    48841	2024-11-07 22:00:05.342123
12648	12723	Beaufort County Sheriff's Ofc	Crowley, W	    49710	2024-11-07 22:00:05.34417
12649	12724	Beaufort PD	Clementoni, A	    49451	2024-11-07 22:00:05.345802
12650	12725	Beaufort County Sheriff's Ofc	Lee, Ben	    49478	2024-11-07 22:00:05.347268
12651	12726	Beaufort PD	Miller, C	    49434	2024-11-07 22:00:05.348992
12652	12727	SC Dept of Corrections	JAMES	    48930	2024-11-07 22:00:05.350701
12653	12728			    49398	2024-11-07 22:00:05.352337
12654	12729	Beaufort County Sheriff's Ofc	Carolus, R	    48738	2024-11-07 22:00:05.353942
12655	12730	Port Royal PD	GARVIN	    49054	2024-11-07 22:00:05.35604
12656	12731	Beaufort PD	Andersen, N	    49428	2024-11-07 22:00:05.359583
12657	12732	Beaufort County Sheriff's Ofc	Lee, Ben	    48925	2024-11-07 22:00:05.360938
12658	12733	Beaufort PD	Arroyo, A	    49307	2024-11-07 22:00:05.362985
12659	12734	Beaufort County Sheriff's Ofc	Summers, K	    48905	2024-11-07 22:00:05.36423
12660	12735	Port Royal PD	Simmons, Ru	    49008	2024-11-07 22:00:05.365954
12661	12736	Beaufort PD	Martinez, Es	    49638	2024-11-07 22:00:05.368872
12662	12737	Beaufort County Sheriff's Ofc	Perkins, M	    49516	2024-11-07 22:00:05.371099
12663	12738	Port Royal PD	Blanco, T	    48896	2024-11-07 22:00:05.372611
12664	12739	Beaufort County Sheriff's Ofc	Knoepfle, S	    49427	2024-11-07 22:00:05.373867
12665	12740	South Carolina Highway Patrol	ROMAGNINO	    48992	2024-11-07 22:00:05.37599
12666	12741	Beaufort County Sheriff's Ofc	Lopez-Solera, J	    49174	2024-11-07 22:00:05.378501
12667	12742	Jasper County Detention		    49330	2024-11-07 22:00:05.380071
12668	12743	Beaufort County Sheriff's Ofc	Guidone, V	    48937	2024-11-07 22:00:05.381493
12669	12744	Beaufort PD	Setian, Ashley	    48777	2024-11-07 22:00:05.383116
12670	12745	Beaufort County Sheriff's Ofc	Gray, W	    49082	2024-11-07 22:00:05.384792
12671	12746	Beaufort County Sheriff's Ofc	Goodson, D	    49527	2024-11-07 22:00:05.386549
12672	12747	Beaufort County Sheriff's Ofc	Takais, G	    49603	2024-11-07 22:00:05.387835
12673	12748	Bluffton PD	Lancaster, C	    49130	2024-11-07 22:00:05.389708
12674	12749	Beaufort PD	Rice, R	    48792	2024-11-07 22:00:05.393054
12675	12750	Jasper County Detention		    49321	2024-11-07 22:00:05.395073
12676	12751	Beaufort County Sheriff's Ofc	Greene, C	    49467	2024-11-07 22:00:05.396774
12677	12752	Beaufort County Sheriff's Ofc	Gray, W	    48919	2024-11-07 22:00:05.398669
12678	12753	Beaufort County Sheriff's Ofc	Roell, C	    49445	2024-11-07 22:00:05.400936
12679	12754	Beaufort County Sheriff's Ofc	Gray, W	    49601	2024-11-07 22:00:05.403425
12680	12755	Beaufort County Sheriff's Ofc	Clouse, J	    48755	2024-11-07 22:00:05.410272
12681	12756	Beaufort County Sheriff's Ofc	Snyder, R	    49050	2024-11-07 22:00:05.412859
12682	12757	Beaufort PD	Brainerd, J	    48767	2024-11-07 22:00:05.415395
12683	12758	Beaufort PD	Lynch, C	    49023	2024-11-07 22:00:05.41808
12684	12759	Beaufort PD	Jackson, J	    49686	2024-11-07 22:00:05.420421
12685	12760	Beaufort County Sheriff's Ofc	Takais, G	    49223	2024-11-07 22:00:05.422784
12686	12761	Beaufort County Sheriff's Ofc	Takais, G	    49222	2024-11-07 22:00:05.425019
12687	12762	South Carolina Highway Patrol	COON	    49533	2024-11-07 22:00:05.427441
12688	12763	Bluffton PD	King, E	    49621	2024-11-07 22:00:05.429312
12689	12764	Beaufort County Sheriff's Ofc	Harvat, A	    49345	2024-11-07 22:00:05.431857
12690	12765	Beaufort County Sheriff's Ofc	Clouse, J	    49481	2024-11-07 22:00:05.435073
12691	12766	Beaufort County Sheriff's Ofc	Dicarlo, R	    49058	2024-11-07 22:00:05.439998
12692	12767	Beaufort County Sheriff's Ofc	Dicarlo, R	    49057	2024-11-07 22:00:05.442819
12693	12768	Bluffton PD		    49177	2024-11-07 22:00:05.445232
12694	12769	Beaufort County Sheriff's Ofc	Petitt, A	    49645	2024-11-07 22:00:05.447014
12695	12770			    49155	2024-11-07 22:00:05.450055
12696	12771	Bluffton PD	Eisenmenger, M	    49623	2024-11-07 22:00:05.451728
12697	12772	South Carolina Highway Patrol	HIGGINS	    49267	2024-11-07 22:00:05.454117
12698	12773	Beaufort County Sheriff's Ofc	Perkins, M	    49299	2024-11-07 22:00:05.456133
12699	12774	Bluffton PD	Pagano, G	    49178	2024-11-07 22:00:05.458738
12700	12775	Beaufort County Sheriff's Ofc	Ahrens, K	    48904	2024-11-07 22:00:05.461235
12701	12776	South Carolina Highway Patrol	AMANATIDES	    49184	2024-11-07 22:00:05.462695
12702	12777	South Carolina Highway Patrol	COON	    49589	2024-11-07 22:00:05.464977
12703	12778	Beaufort County Sheriff's Ofc	Snyder, R	    49775	2024-11-07 22:00:05.466829
12704	12779	Beaufort County Sheriff's Ofc	Janicki, A	    49053	2024-11-07 22:00:05.468778
12705	12780	Beaufort County Sheriff's Ofc	Moore, Rick	    49418	2024-11-07 22:00:05.470116
12706	12781	South Carolina Highway Patrol	CUATA	    49591	2024-11-07 22:00:05.472538
12707	12782	South Carolina Highway Patrol	HIGGINS	    49336	2024-11-07 22:00:05.473991
12708	12783	Beaufort County Sheriff's Ofc	Walker, D	    49094	2024-11-07 22:00:05.475962
12709	12784	Beaufort County Sheriff's Ofc	Whitlock, Z	    49702	2024-11-07 22:00:05.477711
12710	12785	Bluffton PD	Pasquale, S	    48810	2024-11-07 22:00:05.480347
12711	12786	South Carolina Highway Patrol	NOBLES	    49459	2024-11-07 22:00:05.48194
12712	12787	Beaufort County Sheriff's Ofc	Lee, Ben	    48790	2024-11-07 22:00:05.48401
12713	12788	Beaufort County Sheriff's Ofc	Harvat, A	    49512	2024-11-07 22:00:05.486436
12714	12789	Beaufort County Sheriff's Ofc	D'Adamo, G	    49415	2024-11-07 22:00:05.48868
12715	12790	Beaufort County Sheriff's Ofc	Anderson, Ch	    49107	2024-11-07 22:00:05.490053
12716	12791	Beaufort County Sheriff's Ofc	Partridge, C	    49202	2024-11-07 22:00:05.49229
12717	12792	Beaufort County Sheriff's Ofc	Walker, D	    49030	2024-11-07 22:00:05.494242
12718	12793	Beaufort County Sheriff's Ofc	Lacey, T	    49265	2024-11-07 22:00:05.495666
12719	12794	Beaufort County Sheriff's Ofc	Walker, D	    49084	2024-11-07 22:00:05.497228
12720	12795	Beaufort County Sheriff's Ofc	Seronka, Chad	    49024	2024-11-07 22:00:05.499738
12721	12796	Beaufort County Sheriff's Ofc	Seronka, Chad	    49038	2024-11-07 22:00:05.503526
12722	12797	Beaufort County Sheriff's Ofc	Weinberg, K	    49335	2024-11-07 22:00:05.505386
12723	12798	Beaufort County Sheriff's Ofc	Aaron, M	    49637	2024-11-07 22:00:05.507509
12724	12799	Beaufort County Sheriff's Ofc	Lee, Ben	    49413	2024-11-07 22:00:05.510376
12725	12800	Beaufort County Sheriff's Ofc	Partridge, C	    48857	2024-11-07 22:00:05.511731
12726	12801	Beaufort County Sheriff's Ofc	Partridge, C	    49151	2024-11-07 22:00:05.51346
12727	12802	Bluffton PD		    49141	2024-11-07 22:00:05.515325
12728	12803	Bluffton PD		    49194	2024-11-07 22:00:05.516962
12729	12804	Beaufort County Sheriff's Ofc	Cochenour, A	    49144	2024-11-07 22:00:05.519509
12730	12805	Bluffton PD		    49027	2024-11-07 22:00:05.521098
12731	12806	South Carolina Highway Patrol	BURNHAM-CYNTHIA	    49092	2024-11-07 22:00:05.522967
12732	12807	South Carolina Highway Patrol	burnham	    48771	2024-11-07 22:00:05.526444
12733	12808	Beaufort County Sheriff's Ofc	Baglio, T	    49103	2024-11-07 22:00:05.528665
12734	12809	Beaufort PD	Rice, R	    49536	2024-11-07 22:00:05.530167
12735	12810	Beaufort County Sheriff's Ofc	Becker, G	    49067	2024-11-07 22:00:05.5319
12736	12811	Beaufort County Sheriff's Ofc	Seronka, Chad	    49152	2024-11-07 22:00:05.533798
12737	12812	Beaufort County Sheriff's Ofc	Aaron, M	    49673	2024-11-07 22:00:05.535472
12738	12813	Beaufort County Sheriff's Ofc	Lee, Ben	    49654	2024-11-07 22:00:05.537018
12739	12814	Beaufort County Sheriff's Ofc	Cochenour, A	    49080	2024-11-07 22:00:05.538652
12740	12815	Jasper County Detention		    49326	2024-11-07 22:00:05.540736
12741	12816	Beaufort County Sheriff's Ofc	Summers, K	    49088	2024-11-07 22:00:05.542518
12742	12817	South Carolina Highway Patrol	NOBLES, K	    49491	2024-11-07 22:00:05.544786
12743	12818	Port Royal PD	Curry, N	    49726	2024-11-07 22:00:05.547352
12744	12819	Beaufort County Sheriff's Ofc	Seronka, Chad	    49126	2024-11-07 22:00:05.54892
12745	12820	Beaufort County Sheriff's Ofc	Perkins, M	    48826	2024-11-07 22:00:05.550571
12746	12821	Port Royal PD	Simmons, Ru	    49731	2024-11-07 22:00:05.553468
12747	12822	Bluffton PD		    49693	2024-11-07 22:00:05.555503
12748	12823	Beaufort County Sheriff's Ofc	Lepori, Zach	    49613	2024-11-07 22:00:05.557245
12749	12824	Beaufort County Sheriff's Ofc	Ahrens, A	    49025	2024-11-07 22:00:05.559143
12750	12825	Beaufort County Sheriff's Ofc	Seronka, Chad	    49561	2024-11-07 22:00:05.560984
12751	12826	Beaufort PD	Rice, R	    49187	2024-11-07 22:00:05.562437
12752	12827	Beaufort County Sheriff's Ofc	Partridge, C	    49764	2024-11-07 22:00:05.564073
12753	12828	South Carolina Highway Patrol	CASTILLO	    49026	2024-11-07 22:00:05.565818
12754	12829	Beaufort County Sheriff's Ofc	Niedergall, B	    48721	2024-11-07 22:00:05.567438
12755	12830	Beaufort County Sheriff's Ofc	Anderson, Tyler	    49566	2024-11-07 22:00:05.569534
12756	12831	Beaufort County Sheriff's Ofc	Parnell, R	    49045	2024-11-07 22:00:05.571122
12757	12832	Port Royal PD	Simmons, Ru	    48980	2024-11-07 22:00:05.572386
12758	12833	Yemassee Police Department	POPE	    49657	2024-11-07 22:00:05.576479
12759	12834	Beaufort PD	Clementoni, A	    48897	2024-11-07 22:00:05.579525
12760	12835	Beaufort County Sheriff's Ofc	Gray, W	    49678	2024-11-07 22:00:05.582613
12761	12836	Beaufort PD	Linacre, G	    49683	2024-11-07 22:00:05.585806
12762	12837	South Carolina Highway Patrol	CUATA	    49356	2024-11-07 22:00:05.587741
12763	12838	Beaufort County Sheriff's Ofc	Lawson, Mo	    49125	2024-11-07 22:00:05.590961
12764	12839	Beaufort County Sheriff's Ofc	Lawson, Mo	    49124	2024-11-07 22:00:05.592874
12765	12840	Beaufort County Sheriff's Ofc	Weinberg, K	    49515	2024-11-07 22:00:05.594765
12766	12841	Port Royal PD	Mangione, J	    49746	2024-11-07 22:00:05.596305
12767	12842	South Carolina Highway Patrol	GARGIULO	    49069	2024-11-07 22:00:05.597597
12768	12843	Beaufort County Sheriff's Ofc	Partridge, C	    48907	2024-11-07 22:00:05.601037
12769	12844	Beaufort County Sheriff's Ofc	Takais, G	    49149	2024-11-07 22:00:05.602872
12770	12845	Beaufort PD	Bullington, D	    48831	2024-11-07 22:00:05.604183
12771	12846	Port Royal PD	Gonzalez, P	    49087	2024-11-07 22:00:05.605738
12772	12847	Probation Parole	Shytle, D	    48957	2024-11-07 22:00:05.606909
12773	12848	Beaufort County Sheriff's Ofc	Gray, W	    49580	2024-11-07 22:00:05.608967
12774	12849			    49172	2024-11-07 22:00:05.610617
12775	12850	Beaufort County Sheriff's Ofc	Lawson, Mo	    49513	2024-11-07 22:00:05.61288
12776	12851	Beaufort County Sheriff's Ofc	Anderson, Ch	    48996	2024-11-07 22:00:05.614157
12777	12852	Beaufort County Detention	WILSON	    49238	2024-11-07 22:00:05.615779
12778	12853	Beaufort County Sheriff's Ofc	Seronka, Chad	    48851	2024-11-07 22:00:05.617151
12779	12854	Beaufort County Sheriff's Ofc	Seronka, Chad	    49230	2024-11-07 22:00:05.618693
12780	12855	Jasper County Detention	Sinth	    49261	2024-11-07 22:00:05.620561
12781	12856	Beaufort PD	Jackson, J	    48983	2024-11-07 22:00:05.622118
12782	12857	Beaufort County Sheriff's Ofc	Gray, W	    49558	2024-11-07 22:00:05.624524
12783	12858	Beaufort County Sheriff's Ofc	Snyder, R	    48960	2024-11-07 22:00:05.627046
12784	12859	Beaufort PD	Miller, C	    49040	2024-11-07 22:00:05.629063
12785	12860	Beaufort County Sheriff's Ofc	Mooney, D	    48808	2024-11-07 22:00:05.630307
12786	12861	Bluffton PD	Pagano, G	    49209	2024-11-07 22:00:05.631726
12787	12862	Beaufort County Sheriff's Ofc	Perkins, M	    49480	2024-11-07 22:00:05.633265
12788	12863	Beaufort County Sheriff's Ofc	Oelschlager, D	    49148	2024-11-07 22:00:05.634662
12789	12864	Beaufort County Sheriff's Ofc	Lee, Ben	    49649	2024-11-07 22:00:05.635962
12790	12865	Beaufort County Sheriff's Ofc	Partridge, C	    49644	2024-11-07 22:00:05.638372
12791	12866	Beaufort County Sheriff's Ofc	Lopez-Solera, J	    49266	2024-11-07 22:00:05.641379
12792	12867	Beaufort PD	Thompson, L	    49332	2024-11-07 22:00:05.644212
12793	12868	Beaufort County Sheriff's Ofc	Cochenour, A	    49756	2024-11-07 22:00:05.646651
12794	12869	Beaufort County Sheriff's Ofc	Lee, Ben	    48936	2024-11-07 22:00:05.648134
12795	12870	Beaufort County Sheriff's Ofc	Perkins, M	    49140	2024-11-07 22:00:05.649683
12796	12871	Jasper County Detention	SMITH	    49264	2024-11-07 22:00:05.651473
12797	12872	Beaufort County Sheriff's Ofc	Hanna, C	    49429	2024-11-07 22:00:05.652857
12798	12873	Beaufort County Sheriff's Ofc	Oelschlager, D	    49722	2024-11-07 22:00:05.655122
12799	12874	Port Royal PD	Simmons, Ru	    49675	2024-11-07 22:00:05.657263
12800	12875	Beaufort PD	Zielinski, R	    48762	2024-11-07 22:00:05.659964
12801	12876	Bluffton PD	Brown, A	    49485	2024-11-07 22:00:05.661385
12802	12877	South Carolina Highway Patrol	Coon	    48964	2024-11-07 22:00:05.663462
12803	12878	Bluffton PD		    49422	2024-11-07 22:00:05.66501
12804	12879	Bluffton PD	Lamm, A	    49424	2024-11-07 22:00:05.667101
12805	12880	Beaufort County Sheriff's Ofc	Aaron, M	    49003	2024-11-07 22:00:05.669178
12806	12881	Beaufort County Sheriff's Ofc	Aaron, M	    49004	2024-11-07 22:00:05.67028
12807	12882	South Carolina Highway Patrol	ROMGNINO	    48801	2024-11-07 22:00:05.671865
12808	12883	Port Royal PD	Simmons, Ru	    48971	2024-11-07 22:00:05.674601
12809	12884	Beaufort County Sheriff's Ofc	Swinehamer, D	    49736	2024-11-07 22:00:05.67679
12810	12885	Jasper County Detention		    49331	2024-11-07 22:00:05.67822
12811	12886	Beaufort County Sheriff's Ofc	Cochenour, A	    49622	2024-11-07 22:00:05.679717
12812	12887	Beaufort PD	Miller, C	    49681	2024-11-07 22:00:05.681225
12813	12888	Beaufort PD	Zielinski, R	    48915	2024-11-07 22:00:05.683003
12814	12889	South Carolina Highway Patrol	FLOOD	    49051	2024-11-07 22:00:05.684405
12815	12890	Beaufort County Sheriff's Ofc	Imbert, J	    48958	2024-11-07 22:00:05.687268
12816	12891	Bluffton PD		    49059	2024-11-07 22:00:05.688825
12817	12892	Beaufort County Sheriff's Ofc	Walker, D	    49068	2024-11-07 22:00:05.690634
12818	12893	South Carolina Highway Patrol	HIOTT	    48728	2024-11-07 22:00:05.693323
12819	12894	Beaufort County Sheriff's Ofc	Whitlock, Z	    49270	2024-11-07 22:00:05.696521
12820	12895	Beaufort County Sheriff's Ofc	Toomey, S	    48883	2024-11-07 22:00:05.699171
12821	12896	Beaufort County Sheriff's Ofc	Snyder, R	    49197	2024-11-07 22:00:05.703148
12822	12897	Port Royal PD	Simmons, Ru	    49425	2024-11-07 22:00:05.704574
12823	12898	Beaufort County Sheriff's Ofc	Moore, Rick	    48783	2024-11-07 22:00:05.707419
12824	12899	Beaufort PD	Brainerd, J	    49083	2024-11-07 22:00:05.710497
12825	12900	Beaufort County Sheriff's Ofc	Mankin, S	    48927	2024-11-07 22:00:05.711923
12826	12901	Beaufort PD	Piatt, C	    48949	2024-11-07 22:00:05.714916
12827	12902	Beaufort County Sheriff's Ofc	Harvat, A	    49262	2024-11-07 22:00:05.717199
12828	12903	Beaufort County Sheriff's Ofc	Perkins, M	    49403	2024-11-07 22:00:05.719403
12829	12904	Beaufort County Sheriff's Ofc	Cochenour, A	    49293	2024-11-07 22:00:05.720743
12830	12905	Bluffton PD	Anthony, L	    49552	2024-11-07 22:00:05.722123
12831	12906	SC Dept of Corrections	MURRAY	    48853	2024-11-07 22:00:05.724165
12832	12907	Beaufort County Sheriff's Ofc	Gray, W	    49110	2024-11-07 22:00:05.725988
12833	12908	Beaufort County Sheriff's Ofc	Lawson, Mo	    48814	2024-11-07 22:00:05.727791
12834	12909	Beaufort County Sheriff's Ofc	Weaver, J	    48848	2024-11-07 22:00:05.729216
12835	12910	Bluffton PD		    49532	2024-11-07 22:00:05.730865
12836	12911	Bluffton PD	Lamm, A	    49534	2024-11-07 22:00:05.732212
12837	12912	Beaufort County Sheriff's Ofc	Gray, W	    49283	2024-11-07 22:00:05.733806
12838	12913	Beaufort PD	Brainerd, J	    48725	2024-11-07 22:00:05.735993
12839	12914	Port Royal PD	Kirby, K	    49448	2024-11-07 22:00:05.737541
12840	12915	Jasper County Detention	BENJAMIN	    49387	2024-11-07 22:00:05.73929
12841	12916	Beaufort County Sheriff's Ofc	Anderson, Ch	    49301	2024-11-07 22:00:05.74099
12842	12917	Beaufort County Sheriff's Ofc	Griffith, B	    49104	2024-11-07 22:00:05.743535
12843	12918	Beaufort County Sheriff's Ofc	Petruzzi, Z	    48884	2024-11-07 22:00:05.74603
12844	12919	Beaufort County Sheriff's Ofc	Knoepfle, S	    49285	2024-11-07 22:00:05.747575
12845	12920	Beaufort PD	Fontaine, L	    49379	2024-11-07 22:00:05.749168
12846	12921	Beaufort PD	Palacios, K	    49691	2024-11-07 22:00:05.750854
12847	12922	Solicitor's Office	TIM BLACK	    49631	2024-11-07 22:00:05.752903
12848	12923	Bluffton PD	Moore, C	    49304	2024-11-07 22:00:05.754485
12849	12924	Beaufort County Sheriff's Ofc	Aaron, M	    48934	2024-11-07 22:00:05.755727
12850	12925	South Carolina Highway Patrol	COON	    49550	2024-11-07 22:00:05.757637
12851	12926	Dept Natural Resources	McDonald	    49001	2024-11-07 22:00:05.761126
12852	12927	Beaufort PD	Fontaine, L	    48861	2024-11-07 22:00:05.762473
12853	12928	Beaufort PD	Palmer, R	    48812	2024-11-07 22:00:05.763943
12854	12929	South Carolina Highway Patrol	Carson	    48824	2024-11-07 22:00:05.765569
12855	12930	Beaufort County Sheriff's Ofc	Anderson, Tyler	    49255	2024-11-07 22:00:05.767228
12856	12931	Port Royal PD	Blanco, T	    49199	2024-11-07 22:00:05.768472
12857	12932	South Carolina Highway Patrol	bacon, m.	    48990	2024-11-07 22:00:05.771252
12858	12933	Beaufort County Sheriff's Ofc	D'Adamo, G	    49740	2024-11-07 22:00:05.774207
12859	12934	Beaufort County Sheriff's Ofc	Street, J	    49582	2024-11-07 22:00:05.77781
12860	12935	Beaufort County Sheriff's Ofc	Street, J	    49573	2024-11-07 22:00:05.779057
12861	12936	Beaufort County Sheriff's Ofc	Takais, G	    49718	2024-11-07 22:00:05.780615
12862	12937	Beaufort County Sheriff's Ofc	Ahrens, K	    48858	2024-11-07 22:00:05.78219
12863	12938	Beaufort County Sheriff's Ofc	Seronka, Chad	    48750	2024-11-07 22:00:05.784188
12864	12939	Beaufort County Sheriff's Ofc	Guidone, V	    48987	2024-11-07 22:00:05.788405
12865	12940	Beaufort County Sheriff's Ofc	Hansen, G	    49122	2024-11-07 22:00:05.790602
12866	12941	Beaufort County Sheriff's Ofc	Lopez-Solera, J	    49240	2024-11-07 22:00:05.792469
12867	12942	Beaufort County Sheriff's Ofc	Lopez-Solera, J	    49241	2024-11-07 22:00:05.794854
12868	12943	Bluffton PD		    49502	2024-11-07 22:00:05.797471
12869	12944	Beaufort County Sheriff's Ofc	Clouse, J	    49482	2024-11-07 22:00:05.798924
12870	12945	Port Royal PD	Bunting, P	    48798	2024-11-07 22:00:05.80026
12871	12946	Port Royal PD	Blanco, T	    48719	2024-11-07 22:00:05.801814
12872	12947	Beaufort County Sheriff's Ofc	Carolus, R	    48894	2024-11-07 22:00:05.803832
12873	12948	Beaufort PD	Danyov, M	    48889	2024-11-07 22:00:05.805378
12874	12949	Beaufort County Sheriff's Ofc	Corcoran, C	    49300	2024-11-07 22:00:05.807022
12875	12950	Beaufort County Sheriff's Ofc	Cochenour, A	    49253	2024-11-07 22:00:05.809956
12876	12951	Bluffton PD		    49305	2024-11-07 22:00:05.812036
12877	12952	Beaufort County Sheriff's Ofc	Snyder, R	    49062	2024-11-07 22:00:05.813544
12878	12953	Bluffton PD		    49350	2024-11-07 22:00:05.815071
12879	12954	South Carolina Highway Patrol	MAULE, L.	    49342	2024-11-07 22:00:05.817424
12880	12955	Beaufort County Sheriff's Ofc	Seronka, Chad	    48748	2024-11-07 22:00:05.819823
12881	12956	South Carolina Highway Patrol	NOBLES	    49458	2024-11-07 22:00:05.821517
12882	12957	Beaufort County Sheriff's Ofc	Anderson, Ch	    49679	2024-11-07 22:00:05.824527
12883	12958	Beaufort County Sheriff's Ofc	Carolus, R	    49608	2024-11-07 22:00:05.826724
12884	12960	Beaufort County Sheriff's Ofc	Phillips, D	    49753	2024-11-07 22:00:05.828858
12885	12961	Jasper County Detention	BENJAMIN	    49388	2024-11-07 22:00:05.831799
12886	12962	Beaufort County Sheriff's Ofc	Seronka, Chad	    49514	2024-11-07 22:00:05.833532
12887	12963	Beaufort PD	Martinez, Es	    49410	2024-11-07 22:00:05.835352
12888	12964	Jasper County Detention	BENJAMIN	    49385	2024-11-07 22:00:05.837292
12889	12965	Port Royal PD	DiDonato, A	    48840	2024-11-07 22:00:05.840091
12890	12966	Beaufort County Sheriff's Ofc	Lee, Ben	    49133	2024-11-07 22:00:05.843225
12891	12967	Beaufort County Sheriff's Ofc	Partridge, C	    48833	2024-11-07 22:00:05.845484
12892	12968	Beaufort County Sheriff's Ofc	Lee, Ben	    49042	2024-11-07 22:00:05.846836
12893	12969	Beaufort County Detention	Padgett, Lee	    48822	2024-11-07 22:00:05.84857
12894	12970	Beaufort County Sheriff's Ofc	Snyder, R	    49788	2024-11-07 22:00:05.850113
12895	12971	Beaufort County Sheriff's Ofc	Lee, Ben	    49787	2024-11-07 22:00:05.851526
12896	12972	Beaufort County Sheriff's Ofc	Phillips, D	    49656	2024-11-07 22:00:05.854453
12897	12973	Beaufort County Sheriff's Ofc	Crowley, W	    48780	2024-11-07 22:00:05.856081
12898	12974	Beaufort County Sheriff's Ofc	Moore, Rick	    48839	2024-11-07 22:00:05.858304
12899	12975	South Carolina Highway Patrol	BACON	    48981	2024-11-07 22:00:05.862385
12900	12976	Beaufort County Sheriff's Ofc	Roell, C	    48779	2024-11-07 22:00:05.86377
12901	12977	Port Royal PD	Simmons	    49263	2024-11-07 22:00:05.865373
12902	12978	Beaufort County Sheriff's Ofc	Lee, Ben	    49674	2024-11-07 22:00:05.867234
\.


--
-- Data for Name: inmate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inmate (id, last_name, first_name, middle_name, street, city_state_zip, race_gender, sex, date_of_birth, age, height, weight, booking_number, booked_date, booked_time, release_date, release_time, mugshot_url, last_updated) FROM stdin;
12051	ABARCA DE JESUS	ELOY		104 CORDILLO PKWY APT M6	HILTON HEAD, SC 29928	H-White/Latin, Hispanic / Male	M	1996-01-12	28	5'03"	150	49759	2024-11-03	02:47:00	2024-11-04	08:46:00	http://mugshots.bcgov.net/images/08/386808/24110303052700.jpeg	2024-11-07 22:00:03.862699
12052	ABNEY	JONTAI	LINYETTE	11 SMITH RD	BEAUFORT, SC 29906	N-Black, Non-Hisp / Female	F	1981-05-10	43	5'07"	145	48820	2024-08-19	02:01:00	2024-08-19	09:21:00	http://mugshots.bcgov.net/images/16/253916/24081908014200.jpeg	2024-11-07 22:00:03.891989
12053	ACKLEY-ROBINSON	MALIK	MICHAEL	72 WILKINSON WAY UNIT 10206	BLUFFTON, SC 29910 4796	N-White, Non-Hisp / Male	M	1998-01-19	26	6'02"	288	49587	2024-10-17	20:21:00	\N	\N	http://mugshots.bcgov.net/images/60/30360/23080413092200.jpeg	2024-11-07 22:00:03.894792
12054	ADKINS	LEVI	ANTHONY	HOMELESS	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1993-04-10	31	5'11"	175	49801	2024-11-06	20:02:00	\N	\N	http://mugshots.bcgov.net/images/44/20144/24110621010800.jpeg	2024-11-07 22:00:03.897508
12055	AGUILAR	LEZTER		106 JOPPA RD; BON AIRE ESTATES; BON AIRE ESTATES	Shell Point, SC	H-Black, Hispanic / Male	M	1994-11-18	29	'  "	0	48910	2024-08-26	05:09:00	2024-08-26	13:40:00	http://mugshots.bcgov.net/images/61/379861/24082605481500.jpeg	2024-11-07 22:00:03.899231
12056	AGUILAR AGUILAR	SILVIA		20 STONE STREET	Bluffton, SC 29910	H-White/Latin, Hispanic / Female	F	1986-02-08	38	5'05"	120	49007	2024-09-02	22:36:00	2024-09-03	11:15:00	http://mugshots.bcgov.net/images/84/380684/24090222451300.jpeg	2024-11-07 22:00:03.901523
12057	AHLERS	ANDREW	MICHAEL	400 WILLIAM HILTON PARKWAY, UNIT #88	HILTON HEAD ISL, SC 29926	N-Black, Non-Hisp / Male	M	1978-01-14	46	6'01"	260	49224	2024-09-19	15:10:00	2024-09-25	05:04:00	http://mugshots.bcgov.net/images/10/13410/24093023372900.jpeg	2024-11-07 22:00:03.903379
12058	AHLERS	ANDREW	MICHAEL	400 WILLIAM HILTON PARKWAY, UNIT #88	HILTON HEAD ISL, SC 29926	N-Black, Non-Hisp / Male	M	1978-01-14	46	6'01"	260	49399	2024-09-30	23:32:00	2024-10-01	09:20:00	http://mugshots.bcgov.net/images/10/13410/24093023372900.jpeg	2024-11-07 22:00:03.905032
12059	AHLUWALIA	NAVJIT	SINGH	2957 MAJOR RIDGE TRL	DULUTH, GA 30097	N-White, Non-Hisp / Male	M	1984-10-17	40	5'08"	165	48850	2024-08-22	07:27:00	2024-08-22	14:31:00	http://mugshots.bcgov.net/images/38/379438/24082207293400.jpeg	2024-11-07 22:00:03.907008
12060	AIKEN	CATINA	LATRELLE	5817 BEES CREEK RD	RIDGELAND, SC 29936	N-Black, Non-Hisp / Female	F	1972-11-22	51	5'07"	187	49269	2024-09-22	02:30:00	2024-11-06	08:40:00	http://mugshots.bcgov.net/images/90/116390/24092202380300.jpeg	2024-11-07 22:00:03.909252
12061	AIKEN	THEODORE	ALEXANDER	142 EPHRAIM RD	SAINT HELENA IS, SC 29920	N-Black, Non-Hisp / Male	M	1993-06-07	31	5'10"	170	49571	2024-10-16	03:34:00	2024-10-16	10:18:00	http://mugshots.bcgov.net/images/23/84023/24101603281900.jpeg	2024-11-07 22:00:03.910917
12062	ALBERG	ELLEN	DANIELLE	24 CROWNE COMMONS DR # 3206; CROWNE AT 170 APTS	Twn of Bluffton, SC	N-White, Non-Hisp / Female	F	1999-07-14	25	5'04"	135	48830	2024-08-19	17:31:00	2024-08-20	15:57:00	http://mugshots.bcgov.net/images/03/45803/24081917380800.jpeg	2024-11-07 22:00:03.913368
12063	ALESHIRE	ALLEN	JERETH	HOMELESS	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1991-07-17	33	8'00"	150	48929	2024-08-27	15:16:00	2024-10-30	20:31:00	http://mugshots.bcgov.net/images/56/59156/24110607455800.jpeg	2024-11-07 22:00:03.915195
12064	ALESHIRE	ALLEN	JERETH	HOMELESS	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1991-07-17	33	8'00"	150	49778	2024-11-04	19:58:00	2024-11-05	10:10:00	http://mugshots.bcgov.net/images/56/59156/24110607455800.jpeg	2024-11-07 22:00:03.918815
12065	ALESHIRE	ALLEN	JERETH	HOMELESS	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1991-07-17	33	8'00"	150	49794	2024-11-06	07:36:00	2024-11-06	17:01:00	http://mugshots.bcgov.net/images/56/59156/24110607455800.jpeg	2024-11-07 22:00:03.920659
12066	ALESHIRE	ALLEN	JERETH	HOMELESS	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1991-07-17	33	8'00"	150	49802	2024-11-06	20:44:00	\N	\N	http://mugshots.bcgov.net/images/56/59156/24110607455800.jpeg	2024-11-07 22:00:03.922723
12067	ALEXANDER	SUSAN	ELIZABETH	1009 11TH ST; The Village at Port	Twn Port Royal, SC 29935	N-White, Non-Hisp / Female	F	1963-08-24	61	5'01"	120	49288	2024-09-24	00:18:00	2024-09-24	15:32:00	http://mugshots.bcgov.net/images/83/26183/24101006322600.jpeg	2024-11-07 22:00:03.924937
12068	ALEXANDER	SUSAN	ELIZABETH	1009 11TH ST; The Village at Port	Twn Port Royal, SC 29935	N-White, Non-Hisp / Female	F	1963-08-24	61	5'01"	120	49503	2024-10-10	06:10:00	2024-10-10	09:10:00	http://mugshots.bcgov.net/images/83/26183/24101006322600.jpeg	2024-11-07 22:00:03.929355
12069	ALEXANDER	SUSAN	ELIZABETH	1009 11TH ST; The Village at Port	Twn Port Royal, SC 29935	N-White, Non-Hisp / Female	F	1963-08-24	61	5'01"	120	49506	2024-10-10	12:20:00	2024-10-14	16:26:00	http://mugshots.bcgov.net/images/83/26183/24101006322600.jpeg	2024-11-07 22:00:03.931327
12070	ALI-EL	DANTE	CORDELLIA	2016 SALEM RD # 101; Garden Oaks Apartmen	City of Bft, SC 29902	H-Black, Hispanic / Female	F	1990-11-06	34	5'07"	180	48835	2024-08-20	14:57:00	2024-08-21	10:50:00	http://mugshots.bcgov.net/images/40/182440/24082015082700.jpeg	2024-11-07 22:00:03.932981
12071	ALLENS	ANDRANIKA	VONSHA	1201 RIBBON CT #1201	Beaufort, SC 29906	N-Black, Non-Hisp / Female	F	1988-09-26	36	5'02"	181	49041	2024-09-04	22:03:00	2024-09-05	10:05:00	http://mugshots.bcgov.net/images/65/380965/24090422153700.jpeg	2024-11-07 22:00:03.934726
12072	ALSTON	DAVID		HOMELESS	BEAUFORT, SC 29902	N-Black, Non-Hisp / Male	M	1976-10-18	48	5'08"	160	49207	2024-09-17	21:24:00	2024-09-18	11:02:00	http://mugshots.bcgov.net/images/39/209039/24110704144900.jpeg	2024-11-07 22:00:03.936763
12073	ALSTON	DAVID		HOMELESS	BEAUFORT, SC 29902	N-Black, Non-Hisp / Male	M	1976-10-18	48	5'08"	160	49441	2024-10-04	13:05:00	2024-10-15	17:04:00	http://mugshots.bcgov.net/images/39/209039/24110704144900.jpeg	2024-11-07 22:00:03.93842
12074	ALSTON	DAVID		HOMELESS	BEAUFORT, SC 29902	N-Black, Non-Hisp / Male	M	1976-10-18	48	5'08"	160	49567	2024-10-15	21:08:00	\N	\N	http://mugshots.bcgov.net/images/39/209039/24110704144900.jpeg	2024-11-07 22:00:03.940766
12075	ALSTON	DAVID		HOMELESS	BEAUFORT, SC 29902	N-Black, Non-Hisp / Male	M	1976-10-18	48	5'08"	160	49569	2024-10-15	23:37:00	2024-10-16	10:58:00	http://mugshots.bcgov.net/images/39/209039/24110704144900.jpeg	2024-11-07 22:00:03.943143
12076	ALSTON	DAVID		HOMELESS	BEAUFORT, SC 29902	N-Black, Non-Hisp / Male	M	1976-10-18	48	5'08"	160	49800	2024-11-06	18:56:00	\N	\N	http://mugshots.bcgov.net/images/39/209039/24110704144900.jpeg	2024-11-07 22:00:03.94541
12077	AMADOR VASQUEZ	RUBENIA	DEL SOCORR	60 SHANKLIN ROAD LOT #2	Beaufort, SC 29906	H-White/Latin, Hispanic / Female	F	1974-11-14	49	5'05"	110	49659	2024-10-25	10:50:00	2024-10-25	15:21:00	http://mugshots.bcgov.net/images/16/63116/24102511201300.jpeg	2024-11-07 22:00:03.948704
12078	AMERINE	ANGEL	ANN	19363 E FLOYD AVE	AURORA, CO 80013	N-White, Non-Hisp / Female	F	1975-10-31	49	5'05"	160	49665	2024-10-25	19:24:00	2024-10-26	12:20:00	http://mugshots.bcgov.net/images/98/385998/24102519402500.jpeg	2024-11-07 22:00:03.951227
12079	AMMONS	MORGAN	PHILIPPE FLYNN	124 MURFIELD DR	Bluffton, SC 29909	N-White, Non-Hisp / Male	M	2000-07-04	24	5'08"	121	49790	2024-11-05	17:07:00	\N	\N	http://mugshots.bcgov.net/images/50/175150/24110518133000.jpeg	2024-11-07 22:00:03.953845
12080	ANDERSON	JOEL	DAMEON	1 APPALOOSA CT; FOREST FIELDS	Burton, SC 29906	N-White, Non-Hisp / Male	M	1977-11-22	46	5'10"	170	49795	2024-11-06	08:04:00	2024-11-06	15:16:00	http://mugshots.bcgov.net/images/27/93827/24110608253000.jpeg	2024-11-07 22:00:03.955665
12081	ANDRADE-LOPEZ	OSMIN	ALEXANDER	1202 PALM ST APT 1	HANAHAN, SC 29410	H-White/Latin, Hispanic / Male	M	2000-07-31	24	5'07"	180	49524	2024-10-12	04:23:00	2024-10-12	11:04:00	http://mugshots.bcgov.net/images/79/384879/24101204472100.jpeg	2024-11-07 22:00:03.957406
12082	ANTHONY	DARREN	MARK	1026 7TH AVE NW	GREAT FALLS, MT 59404	N-White, Non-Hisp / Male	M	1969-10-13	55	5'06"	200	49192	2024-09-15	22:48:00	2024-09-16	12:28:00	http://mugshots.bcgov.net/images/20/382020/24091522305100.jpeg	2024-11-07 22:00:03.960577
12083	ANTHONY	JAVON	URIAH RAHE	HOMELESS	BEAUFORT, SC 29902	N-Black, Non-Hisp / Male	M	1992-08-16	32	5'07"	170	49258	2024-09-21	21:02:00	2024-09-22	13:38:00	http://mugshots.bcgov.net/images/42/245542/24092121081600.jpeg	2024-11-07 22:00:03.962562
12084	ANTHONY	KENDRICK	TERRELL	124 STONEWALL HILL DR	COTTAGEVILLE, SC 29435	N-Black, Non-Hisp / Male	M	1990-03-24	34	5'09"	238	49452	2024-10-04	22:27:00	2024-10-05	10:43:00	http://mugshots.bcgov.net/images/54/384154/24100422332700.jpeg	2024-11-07 22:00:03.964839
12085	ANZUREZ MORENO	BARTOLO		36 FREDDIES WAY	HILTON HEAD ISL, SC 29926 1752	H-White/Latin, Hispanic / Male	M	1970-08-24	54	5'08"	180	49584	2024-10-17	16:53:00	2024-10-18	15:20:00	http://mugshots.bcgov.net/images/81/312081/24101717032800.jpeg	2024-11-07 22:00:03.967591
12086	AQUINO	ADRIEL	ANTONIO	337 ARDMORE GARDEN DR	HARDEEVILLE, NY 29927	H-White/Latin, Hispanic / Male	M	1977-06-29	47	5'04"	200	49090	2024-09-08	07:59:00	2024-09-08	11:53:00	http://mugshots.bcgov.net/images/11/310211/24090808053600.jpeg	2024-11-07 22:00:03.970219
12087	ARGUETA-GARCIA	CRISTHIAN		36 WESTGATE CIR; WESTGATE	Burton, SC 29906	H-White/Latin, Hispanic / Male	M	1999-05-28	25	5'05"	190	49464	2024-10-06	07:46:00	2024-10-06	10:39:00	http://mugshots.bcgov.net/images/47/384247/24100610215400.jpeg	2024-11-07 22:00:03.972025
12088	ARRIAGA-MORALES	JUAN		400 HALLMARK DR APT 410	GOOSE CREEK, SC 29445	H-Black, Hispanic / Male	M	1990-03-08	34	6'00"	180	49540	2024-10-13	03:48:00	2024-10-13	12:47:00	http://mugshots.bcgov.net/images/24/384924/	2024-11-07 22:00:03.976064
12089	ARROYO	EDUARDO	FRANCISCO	4742 BROAD ST	SUMTER, SC 29154	N-White, Non-Hisp / Male	M	1985-06-10	39	5'05"	180	49268	2024-09-22	02:19:00	2024-09-30	15:00:00	http://mugshots.bcgov.net/images/03/21303/24092202361400.jpeg	2024-11-07 22:00:03.979947
12090	ATKINS	TYRE	JOE	66 TOMBEE RD	St Helena Islan, SC 29920	N-Black, Non-Hisp / Male	M	2004-03-13	20	5'10"	170	49217	2024-09-19	07:31:00	\N	\N	http://mugshots.bcgov.net/images/35/168135/24091907430400.jpeg	2024-11-07 22:00:03.982419
12091	AUSTIN	KEYDRA	NICOLE	2208 SOUTHSIDE BLVD APT 70	PORT ROYAL, SC 29935 1010	N-Black, Non-Hisp / Female	F	1987-08-23	37	5'03"	130	48731	2024-08-11	00:44:00	2024-08-11	10:29:00	http://mugshots.bcgov.net/images/04/69004/24081100535300.jpeg	2024-11-07 22:00:03.984235
12092	AVILA	EVODIO		141 LAMOTTE DR APT F 1	HILTON HEAD SC, SC 29926	H-White/Latin, Hispanic / Male	M	2000-08-12	24	6'04"	280	48939	2024-08-28	05:25:00	2024-08-28	09:33:00	http://mugshots.bcgov.net/images/70/215570/24090500333300.jpeg	2024-11-07 22:00:03.986799
12093	AVILA	EVODIO		141 LAMOTTE DR APT F 1	HILTON HEAD SC, SC 29926	H-White/Latin, Hispanic / Male	M	2000-08-12	24	6'04"	280	49043	2024-09-05	00:23:00	2024-09-05	10:09:00	http://mugshots.bcgov.net/images/70/215570/24090500333300.jpeg	2024-11-07 22:00:03.988702
12094	AVILA	ISMAEL		8 FALABELLA MNR	HILTON HEAD ISL, SC 29926 2202	H-White/Latin, Hispanic / Male	M	2002-02-23	22	6'00"	190	48768	2024-08-14	14:19:00	2024-08-15	11:12:00	http://mugshots.bcgov.net/images/00/220200/24102013310600.jpeg	2024-11-07 22:00:03.990755
12095	AVILA	ISMAEL		8 FALABELLA MNR	HILTON HEAD ISL, SC 29926 2202	H-White/Latin, Hispanic / Male	M	2002-02-23	22	6'00"	190	48924	2024-08-27	02:43:00	2024-08-27	11:19:00	http://mugshots.bcgov.net/images/00/220200/24102013310600.jpeg	2024-11-07 22:00:03.994346
12096	AVILA	ISMAEL		8 FALABELLA MNR	HILTON HEAD ISL, SC 29926 2202	H-White/Latin, Hispanic / Male	M	2002-02-23	22	6'00"	190	49618	2024-10-20	13:17:00	2024-10-21	13:51:00	http://mugshots.bcgov.net/images/00/220200/24102013310600.jpeg	2024-11-07 22:00:03.996544
12097	AVILA SILVA	MELVIN	OMAR	37 PINE RUN TRL; HB ATTAWAY	Ladys Island, SC 29907	H-White/Latin, Hispanic / Male	M	1984-02-07	40	5'10"	160	49273	2024-09-22	04:58:00	2024-09-22	13:12:00	http://mugshots.bcgov.net/images/88/108488/24092205153300.jpeg	2024-11-07 22:00:03.998427
12098	AVILA-MARADIAGA	LUIS	ANTONIO	4921 BLUFFTON PKWY. #1238	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	2000-02-18	24	5'05"	140	49318	2024-09-25	17:26:00	2024-10-08	12:42:00	http://mugshots.bcgov.net/images/08/141708/24092517354300.jpeg	2024-11-07 22:00:04.000141
12099	AVILA-ROJO	JESUS		46 BURLINGTON CIR	Beaufort, SC 29906	H-White/Latin, Hispanic / Male	M	2001-12-25	22	5'10"	165	48753	2024-08-13	01:16:00	2024-08-13	13:56:00	http://mugshots.bcgov.net/images/96/378496/24081301234100.jpeg	2024-11-07 22:00:04.001927
12100	BANIEL	COURTNEY	LACHAUN	180 BRIDGETOWN DR	RIDGELAND, SC 29936	N-Black, Non-Hisp / Male	M	1989-05-22	35	6'01"	160	49215	2024-09-19	01:34:00	2024-09-30	11:39:00	http://mugshots.bcgov.net/images/04/61904/24091902375100.jpeg	2024-11-07 22:00:04.003685
12101	BARDALES-RIVERA	ROLAND	SAUL	31 HILANDA DR; HILANDA MHP	Burton, SC 29906	H-White/Latin, Hispanic / Male	M	1988-01-27	36	5'10"	185	49022	2024-09-03	16:03:00	\N	\N	http://mugshots.bcgov.net/images/14/380614/24090320273300.jpeg	2024-11-07 22:00:04.007381
12102	BARKLEY	ISABELLE	MARIE	140 JONESVILLE RD	Hilton Head Isl, SC	N-White, Non-Hisp / Female	F	1998-12-24	25	5'00"	140	48909	2024-08-26	03:00:00	2024-08-26	20:25:00	http://mugshots.bcgov.net/images/19/349119/24082603280200.jpeg	2024-11-07 22:00:04.010733
12103	BARNARD	RONALD		844 DAIRY RD	HINESVILLE, GA	N-Black, Non-Hisp / Male	M	1965-05-06	59	6'00"	185	49325	2024-09-25	18:15:00	2024-10-08	13:24:00	http://mugshots.bcgov.net/images/73/383273/24092518162700.jpeg	2024-11-07 22:00:04.013806
12104	BARNER	SETH	EUGENE	80 BUCK ISLAND RD APT 205	BLUFFTON, SC 29910 6941	N-White, Non-Hisp / Male	M	1980-09-10	44	6'01"	300	48973	2024-08-31	07:42:00	2024-08-31	11:47:00	http://mugshots.bcgov.net/images/59/158759/24083107435900.jpeg	2024-11-07 22:00:04.014452
12105	BARRAGAN	RICARDO		201 MARSHLAND RD # 22; ROLLERS TRAILER PARK	Hilton Head Isl, SC 29926	H-White/Latin, Hispanic / Male	M	2001-10-28	23	5'09"	189	48869	2024-08-23	03:54:00	2024-08-23	17:02:00	http://mugshots.bcgov.net/images/47/114247/24082304092300.jpeg	2024-11-07 22:00:04.015983
12106	BARRETT	GERALD	THOMAS	212 DAVIDSON TOWER RD	YEMASSEE, SC 29945 2104	N-White, Non-Hisp / Male	M	1990-01-14	34	5'11"	180	48829	2024-08-19	17:30:00	2024-09-26	05:01:00	http://mugshots.bcgov.net/images/59/53659/24103008191000.jpeg	2024-11-07 22:00:04.018771
12107	BARRETT	GERALD	THOMAS	212 DAVIDSON TOWER RD	YEMASSEE, SC 29945 2104	N-White, Non-Hisp / Male	M	1990-01-14	34	5'11"	180	49719	2024-10-30	07:56:00	2024-10-30	13:51:00	http://mugshots.bcgov.net/images/59/53659/24103008191000.jpeg	2024-11-07 22:00:04.020413
12108	BARRON	CHARLES	QUINCY	261 PICKETT MILL BLVD; MILL CREEK AT CYPRESS RIDGE	Twn of Bluffton, SC 29910	N-Black, Non-Hisp / Male	M	1999-05-16	25	5'10"	160	49360	2024-09-28	08:17:00	\N	\N	http://mugshots.bcgov.net/images/76/92676/24092808520600.jpeg	2024-11-07 22:00:04.022402
12109	BEAL	FREDERICK	C	264 BEDFORD ST	LAKEVILLE, MA 02347	N-White, Non-Hisp / Male	M	1992-09-23	32	5'11"	220	49034	2024-09-04	16:41:00	2024-09-05	11:17:00	http://mugshots.bcgov.net/images/26/380926/24090416490700.jpeg	2024-11-07 22:00:04.025377
12110	BEATY	PHILLIP		25 EAGLE RIDGE RD LOT 11	BEAUFORT, SC 29906 8835	N-Black, Non-Hisp / Male	M	1990-07-20	34	6'01"	225	49639	2024-10-23	08:52:00	2024-10-23	12:28:00	http://mugshots.bcgov.net/images/95/46395/24102309022700.jpeg	2024-11-07 22:00:04.027088
12111	BELLO NIETO	EZEQUIEL		94 MUDDY CREEK ROAD	HILTON HEAD ISL, SC 29926	H-White/Latin, Hispanic / Male	M	1999-08-31	25	5'10"	150	49421	2024-10-03	05:53:00	2024-10-04	09:54:00	http://mugshots.bcgov.net/images/91/383991/24100306004100.jpeg	2024-11-07 22:00:04.028771
12112	BENSON	JAQUIZE	WALTER	4407 TILLMAN RD	RIDGELAND, SC 29936 7319	N-Black, Non-Hisp / Male	M	1997-07-12	27	6'00"	175	48979	2024-08-31	20:48:00	2024-09-01	10:50:00	http://mugshots.bcgov.net/images/92/26692/24083121000300.jpeg	2024-11-07 22:00:04.031183
12113	BERMUDEZ	EDWIN	ALEXANDER	3 HABITAT CIR	HILTON HEAD, SC 29926	H-White/Latin, Hispanic / Male	M	2006-05-26	18	6'00"	170	48796	2024-08-17	06:17:00	2024-08-17	12:26:00	http://mugshots.bcgov.net/images/76/231676/24081706311100.jpeg	2024-11-07 22:00:04.033971
12114	BERNAL LIMA	JUAN	M	21A NED CT	HILTON HEAD ISL, SC 29926 1689	H-White/Latin, Hispanic / Male	M	1999-04-14	25	5'07"	190	48744	2024-08-11	21:38:00	\N	\N	http://mugshots.bcgov.net/images/78/172178/	2024-11-07 22:00:04.038038
12115	BETHEA	HARVEY	MACKENZIE	155 ALLJOY RD	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1989-05-03	35	6'04"	204	49408	2024-10-02	08:26:00	2024-10-02	10:24:00	http://mugshots.bcgov.net/images/65/14965/24100208295500.jpeg	2024-11-07 22:00:04.040164
12116	BEVERLY	GROVER	WENDELL	50 CAPEHART CIR; CAPEHART	Burton, SC 29907 1038	N-White, Non-Hisp / Male	M	1979-09-03	45	6'00"	220	49456	2024-10-05	17:51:00	2024-10-07	15:30:00	http://mugshots.bcgov.net/images/91/196391/24100517583500.jpeg	2024-11-07 22:00:04.04273
12117	BLACKSHEAR	DERRICK	LAMONT	32 OLD SOUTH CT APT E	BLUFFTON, SC 29910 8624	N-Black, Non-Hisp / Male	M	1998-09-15	26	5'09"	200	49396	2024-09-30	19:55:00	2024-10-08	17:23:00	http://mugshots.bcgov.net/images/07/254407/24093019571800.jpeg	2024-11-07 22:00:04.044628
12118	BLANCO	ROGERS		21 LAGOON RD APT B2H	HILTON HEAD, SC 29928	H-White/Latin, Hispanic / Male	M	1989-12-02	34	5'11"	160	48844	2024-08-21	12:14:00	\N	\N	http://mugshots.bcgov.net/images/56/114156/24092402504200.jpeg	2024-11-07 22:00:04.046919
12119	BLANCO	ROGERS		21 LAGOON RD APT B2H	HILTON HEAD, SC 29928	H-White/Latin, Hispanic / Male	M	1989-12-02	34	5'11"	160	49289	2024-09-24	02:45:00	2024-09-24	10:49:00	http://mugshots.bcgov.net/images/56/114156/24092402504200.jpeg	2024-11-07 22:00:04.049266
12120	BLANCO RIVAS	ANDREI ELOY		54 HICKORY HILL RD	BEAUFORT, SC 29920	H-White/Latin, Hispanic / Male	M	1994-05-27	30	5'08"	180	49257	2024-09-21	20:35:00	2024-09-22	13:38:00	http://mugshots.bcgov.net/images/50/382750/24092120580400.jpeg	2024-11-07 22:00:04.051855
12121	BLANDON PADILLA	BISMARK		91 STARSHINE CIR; PALMETTO POINTE TOWN	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	1979-02-26	45	5'06"	260	49173	2024-09-14	05:38:00	2024-09-14	13:20:00	http://mugshots.bcgov.net/images/13/381913/24091405433700.jpeg	2024-11-07 22:00:04.055101
12122	BOTELHO	COREY	THOMAS	21 EDGEWATER CIR; THE LAKES @ EDGEWATE	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1988-10-01	36	5'08"	160	49033	2024-09-04	09:17:00	2024-09-19	15:42:00	http://mugshots.bcgov.net/images/96/114796/24090409451400.jpeg	2024-11-07 22:00:04.056883
12123	BOTTI	JOSEPH	ANTHONY	926 SUMMERLAKE CIR #103	RIDGELAND, SC 29936	N-White, Non-Hisp / Male	M	1986-04-01	38	5'09"	180	49457	2024-10-05	22:27:00	2024-10-06	11:01:00	http://mugshots.bcgov.net/images/51/378851/24100522360300.jpeg	2024-11-07 22:00:04.059271
12124	BRADHAM	KATIE	SHANNON	314 LAUREL BAY RD. APT 422	BEAUFORT, SC 29906 4801	N-White, Non-Hisp / Female	F	1987-08-05	37	5'03"	115	49450	2024-10-04	20:17:00	\N	\N	http://mugshots.bcgov.net/images/80/90780/24100420382900.jpeg	2024-11-07 22:00:04.060932
12125	BRANTLEY	BRANDON	AHMAD	10 S FOREST BEACH DR APT 22	HILTON HEAD ISL, SC 29928	N-Black, Non-Hisp / Male	M	1992-02-01	32	5'08"	165	49694	2024-10-27	21:53:00	2024-10-28	09:57:00	http://mugshots.bcgov.net/images/06/272206/24102806112200.jpeg	2024-11-07 22:00:04.064763
12126	BRAXTON	NIEME	JADEN	1313 E 60TH ST	SAVANNAH, GA 31404	N-Black, Non-Hisp / Male	M	2004-07-07	20	5'07"	120	49554	2024-10-14	11:00:00	\N	\N	http://mugshots.bcgov.net/images/98/384998/	2024-11-07 22:00:04.066433
12127	BRIDGES	ANTONIO		188 WILD HORSE RD	HILTON HEAD ISL, SC 29926 1504	N-Black, Non-Hisp / Male	M	1978-09-21	46	5'10"	180	49234	2024-09-20	14:46:00	2024-10-20	05:36:00	http://mugshots.bcgov.net/images/85/158385/24092014500500.jpeg	2024-11-07 22:00:04.068409
12128	BRIGHT	KAYLA	ANN	106 TERRACE CT APT 2	JOHNSON CITY, TN 37601	N-White, Non-Hisp / Female	F	1996-10-04	28	5'02"	135	49117	2024-09-04	11:44:00	\N	\N	http://mugshots.bcgov.net/images/32/380932/24090414475100.jpeg	2024-11-07 22:00:04.069849
12129	BRIGHT	KAYLA	ANN	106 TERRACE CT APT 2	JOHNSON CITY, TN 37601	N-White, Non-Hisp / Female	F	1996-10-04	28	5'02"	135	49035	2024-09-04	14:39:00	2024-09-05	14:45:00	http://mugshots.bcgov.net/images/32/380932/24090414475100.jpeg	2024-11-07 22:00:04.071698
12130	BRITO-SANCHEZ	ANJEL	MANUEL	8 BEAUMONT COURT	Bluffton, SC 29910	H-White/Latin, Hispanic / Male	M	2000-08-18	24	6'00"	170	49077	2024-09-07	20:18:00	2024-09-08	12:44:00	http://mugshots.bcgov.net/images/74/216874/24090720300400.jpeg	2024-11-07 22:00:04.072293
12131	BROCK	COURTNEY	ELIZABETH	112 ROSELAND RD	RIDGELAND, SC 29936	N-White, Non-Hisp / Female	F	1994-06-04	30	5'02"	170	48913	2024-08-26	13:29:00	2024-08-28	16:01:00	http://mugshots.bcgov.net/images/21/97221/24082616131900.jpeg	2024-11-07 22:00:04.076793
12132	BROWN	ANTHONY	ALFRADO	134 JONESVILLE RD	HILTON HEAD ISL, SC 29926	N-Black, Non-Hisp / Male	M	1983-08-25	41	5'11"	245	48873	2024-08-23	15:28:00	\N	\N	http://mugshots.bcgov.net/images/50/53850/24082315385500.jpeg	2024-11-07 22:00:04.078671
12133	BROWN	BRANDON	DEMARIO	17 QUINN CT	Twn of Bluffton, SC 29910	N-Black, Non-Hisp / Male	M	1985-07-05	39	6'00"	160	49119	2024-09-11	00:40:00	2024-09-23	14:13:00	http://mugshots.bcgov.net/images/23/153023/24091100525500.jpeg	2024-11-07 22:00:04.080816
12134	BROWN	CHRISTINA	SHANAY	27 JOHNNY MORRALL CIR APT G8	BEAUFORT, SC 29902	N-Black, Non-Hisp / Female	F	1992-02-06	32	5'00"	198	49072	2024-09-07	02:06:00	2024-09-07	11:17:00	http://mugshots.bcgov.net/images/20/28320/24090702314100.jpeg	2024-11-07 22:00:04.083903
12135	BROWN	CORNELIUS	CHRISTOPHER	117 TARBORO RD	TILLMAN, SC 29943	N-Black, Non-Hisp / Male	M	1996-03-07	28	6'04"	224	49317	2024-09-25	17:05:00	2024-10-08	18:31:00	http://mugshots.bcgov.net/images/68/383268/24092517140400.jpeg	2024-11-07 22:00:04.086532
12136	BROWN	GERALD	ANDREW	905 PAUL DR; MOSSY OAKS PARK	City of Bft, SC 29902	N-Black, Non-Hisp / Male	M	1983-07-18	41	6'02"	245	49670	2024-10-25	23:44:00	2024-10-26	14:13:00	http://mugshots.bcgov.net/images/91/5191/24102523590400.jpeg	2024-11-07 22:00:04.088476
12137	BROWN	HENRY	JAMES	4 CAMPFIRE DR	BEAUFORT, SC 29920	N-Black, Non-Hisp / Male	M	1968-05-15	56	5'08"	180	49302	2024-09-24	19:53:00	\N	\N	http://mugshots.bcgov.net/images/65/265/24092420172100.jpeg	2024-11-07 22:00:04.090876
12138	BROWN	JAFARI	HAKEEM	4B FAWNWOOD LN	Seabrook, SC 29940	N-Black, Non-Hisp / Male	M	1999-11-29	24	4'10"	120	48782	2024-08-16	12:55:00	\N	\N	http://mugshots.bcgov.net/images/72/20172/24081612574300.jpeg	2024-11-07 22:00:04.09316
12139	BROWN	JOSHUA		17 SILVERWOOD CIR APT 4	ANNAPOLIS, MD 21403	N-White, Non-Hisp / Male	M	1985-07-25	39	6'00"	190	49747	2024-11-02	03:54:00	2024-11-03	11:24:00	http://mugshots.bcgov.net/images/44/386744/24110204074500.jpeg	2024-11-07 22:00:04.095964
12140	BROWN	JOSHUA	JONATHAN	79 PARRIS ISLAND GTWY	BURTON, SC 29906	N-Black, Non-Hisp / Male	M	1987-02-11	37	6'02"	195	49036	2024-09-04	15:01:00	2024-09-19	13:05:00	http://mugshots.bcgov.net/images/95/11495/24110613111300.jpeg	2024-11-07 22:00:04.097732
12141	BROWN	JOSHUA	JONATHAN	79 PARRIS ISLAND GTWY	BURTON, SC 29906	N-Black, Non-Hisp / Male	M	1987-02-11	37	6'02"	195	49797	2024-11-06	13:05:00	\N	\N	http://mugshots.bcgov.net/images/95/11495/24110613111300.jpeg	2024-11-07 22:00:04.099745
12142	BROWN	JOSHUA	ONEIL	20 SIMMONSVILLE RD # 2102; EMERSON ISLES APTS	Bluffton, SC 29910	N-Black, Non-Hisp / Male	M	1999-06-24	25	5'09"	170	49501	2024-10-09	22:38:00	2024-10-14	14:55:00	http://mugshots.bcgov.net/images/25/28025/24100923010000.jpeg	2024-11-07 22:00:04.101567
12143	BROWN	KENNETH	GARY	16 WILDCAT LN	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1965-05-31	59	6'00"	150	49469	2024-10-06	22:45:00	2024-10-07	10:48:00	http://mugshots.bcgov.net/images/76/73476/24100622475400.jpeg	2024-11-07 22:00:04.103603
12144	BROWN-LEWIS	SHAQUILLE	DEVON	41 MILLEDGE VILLAGE RD	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1992-12-20	31	6'01"	190	49769	2024-11-03	23:10:00	2024-11-05	14:51:00	http://mugshots.bcgov.net/images/03/20403/24110323225400.jpeg	2024-11-07 22:00:04.105407
12145	BROWNE	GENO	ETHAN	HOMELESS	BLUFFTON, SC 29910	N-Black, Non-Hisp / Male	M	2004-06-17	20	6'00"	165	49629	2024-10-22	14:40:00	2024-10-23	12:09:00	http://mugshots.bcgov.net/images/35/74035/24102218483100.jpeg	2024-11-07 22:00:04.107379
12146	BRUNO	DAVID	BARRIENTOS	400 WILLIAM HILTON PKWY APT 77	HILTON HEAD ISL, SC 29926	H-White/Latin, Hispanic / Male	M	1994-03-16	30	5'06"	200	49014	2024-09-03	04:03:00	2024-09-04	09:37:00	http://mugshots.bcgov.net/images/53/10253/24090304090800.jpeg	2024-11-07 22:00:04.109583
12147	BRYAN	LLOYD	ANTHONY	69 PINE FOREST DR; PINE FOREST	Bluffton, SC 29910	N-Black, Non-Hisp / Male	M	1986-04-15	38	5'11"	150	48793	2024-08-17	02:32:00	\N	\N	http://mugshots.bcgov.net/images/19/259019/24082423454500.jpeg	2024-11-07 22:00:04.111845
12148	BRYAN	LLOYD	ANTHONY	69 PINE FOREST DR; PINE FOREST	Bluffton, SC 29910	N-Black, Non-Hisp / Male	M	1986-04-15	38	5'11"	150	48890	2024-08-24	23:19:00	2024-08-25	10:39:00	http://mugshots.bcgov.net/images/19/259019/24082423454500.jpeg	2024-11-07 22:00:04.114721
12149	BRYAN	MARCUS	ANDREW	14 SWINGABOUT LN	ST. HELENA, SC 29920	N-Black, Non-Hisp / Male	M	1987-02-02	37	5'10"	228	49807	2024-11-07	19:36:00	\N	\N	http://mugshots.bcgov.net/images/46/34146/24110719401200.jpeg	2024-11-07 22:00:04.116666
12150	BRYAN	RICCI	HOLLE	34 OTTER HOLE RD	Hilton Head Isl, SC 29926	N-White, Non-Hisp / Female	F	1985-11-30	38	5'04"	130	48736	2024-08-11	14:34:00	2024-09-19	12:01:00	http://mugshots.bcgov.net/images/25/8725/24081114375900.jpeg	2024-11-07 22:00:04.120506
12151	BRYANT	STACY	DUANE	472 KRISTEN LN SW	SUPPLY, NC 28462	N-White, Non-Hisp / Male	M	1971-09-21	53	5'10"	210	49470	2024-10-07	01:57:00	2024-10-07	15:14:00	http://mugshots.bcgov.net/images/91/384291/24100702095100.jpeg	2024-11-07 22:00:04.125111
12152	BUCHANAN	PHILIP	LEE	2 ARBOR LN	SAINT HELENA IS, SC 29920 3701	N-White, Non-Hisp / Male	M	1987-03-15	37	6'02"	300	48891	2024-08-24	22:52:00	2024-08-25	09:47:00	http://mugshots.bcgov.net/images/67/379767/24082423041000.jpeg	2024-11-07 22:00:04.127493
12153	BUKOFFSKY	ZOE	AMANDA	540 JOE FRAZIER RD	BEAUFORT, SC 29906	N-Black, Non-Hisp / Female	F	2005-06-12	19	5'02"	150	49643	2024-10-23	18:21:00	2024-10-24	10:20:00	http://mugshots.bcgov.net/images/91/290691/24102321144900.jpeg	2024-11-07 22:00:04.129478
12154	BURDETTE	TAYLOR	NICOLE	20 LAWRENCE ST	BLUFFTON, SC 29910	N-White, Non-Hisp / Female	F	1991-12-29	32	5'02"	180	49139	2024-09-12	07:38:00	2024-09-12	11:28:00	http://mugshots.bcgov.net/images/43/208143/24091207471900.jpeg	2024-11-07 22:00:04.131294
12155	BURNETTE	ASHLEY	CHERRICE	16 BEAUREGARD CT; PICKET FENCES	Twn Port Royal, SC	N-Black, Non-Hisp / Female	F	1998-08-20	26	5'02"	135	49461	2024-10-06	03:10:00	2024-10-06	10:57:00	http://mugshots.bcgov.net/images/52/376952/24100608334900.jpeg	2024-11-07 22:00:04.133502
12156	BURNETTE	ROGER	LEE	38 FOREST CV; FOREST COVE	Hilton Head Isl, SC 29928	N-White, Non-Hisp / Male	M	1980-12-15	43	5'11"	145	49333	2024-09-26	02:01:00	2024-09-26	10:13:00	http://mugshots.bcgov.net/images/00/69000/24092602254300.jpeg	2024-11-07 22:00:04.135071
12157	BURNS	ZUHELY		408 LIVE OAK WALK	BLUFFTON, SC 29910 7906	H-White/Latin, Hispanic / Female	F	1975-10-10	49	5'02"	128	49076	2024-09-07	14:38:00	2024-09-08	12:37:00	http://mugshots.bcgov.net/images/21/44121/24090808361200.jpeg	2024-11-07 22:00:04.137132
12158	BURTON	MARQUIS	RASHAD	HOMELESS	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1995-03-22	29	5'11"	140	49711	2024-10-29	11:59:00	\N	\N	http://mugshots.bcgov.net/images/06/10506/24102913444500.jpeg	2024-11-07 22:00:04.140336
12159	BURTON	MARQUIS	RASHAD	HOMELESS	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1995-03-22	29	5'11"	140	49713	2024-10-29	13:39:00	2024-10-29	16:06:00	http://mugshots.bcgov.net/images/06/10506/24102913444500.jpeg	2024-11-07 22:00:04.143461
12160	BUSH	CALVIN		452 SEASIDE RD	BEAUFORT, SC 29920	N-Black, Non-Hisp / Male	M	1957-09-28	67	5'08"	140	48977	2024-08-31	15:27:00	2024-09-01	11:08:00	http://mugshots.bcgov.net/images/73/58173/24102516430800.jpeg	2024-11-07 22:00:04.144213
12161	BUSH	CALVIN		452 SEASIDE RD	BEAUFORT, SC 29920	N-Black, Non-Hisp / Male	M	1957-09-28	67	5'08"	140	49664	2024-10-25	16:33:00	2024-10-28	12:22:00	http://mugshots.bcgov.net/images/73/58173/24102516430800.jpeg	2024-11-07 22:00:04.147137
12162	BUSH	WESLEY		64 HORTON CT	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1987-12-21	36	5'08"	175	49284	2024-09-23	12:42:00	\N	\N	http://mugshots.bcgov.net/images/36/2636/24092313145000.jpeg	2024-11-07 22:00:04.149829
12163	BUSH HOLLEY	CAM'RON	KAHLIL	1135 HARWELL ST NW	ALTANTA, GA 30314 2917	N-Black, Non-Hisp / Male	M	2006-08-06	18	5'06"	153	49108	2024-09-10	02:34:00	\N	\N	http://mugshots.bcgov.net/images/29/381429/	2024-11-07 22:00:04.152585
12164	BUTLER	SARAH	ELIZABETH	17 JOHNSON LANDING RD; JOHNSON ROAD ESTATES	Ladys Island, SC 29907	N-White, Non-Hisp / Female	F	1993-02-22	31	5'04"	200	48986	2024-09-01	01:31:00	2024-09-01	13:35:00	http://mugshots.bcgov.net/images/64/99564/24090101430300.jpeg	2024-11-07 22:00:04.154752
12165	BYERSON	AARON	KEITH	1301 CONGRESS ST	BEAUFORT, SC 29902 4514	N-Black, Non-Hisp / Male	M	1981-09-07	43	6'01"	167	48952	2024-08-30	01:38:00	\N	\N	http://mugshots.bcgov.net/images/42/150542/24083001565600.jpeg	2024-11-07 22:00:04.157119
12166	CALDERON	DELMAR		75 RIVERCHASE BLVD; THE OAKS BROAD RIVER; THE OAKS @ BROAD R	BEAUFORT, SC 29906	H-White/Latin, Hispanic / Male	M	2006-02-11	18	5'09"	160	49496	2024-10-09	10:06:00	\N	\N	http://mugshots.bcgov.net/images/40/348340/	2024-11-07 22:00:04.160023
12167	CAMPOS	ADILENE		106 SHADY GLEN DRIVE	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Female	F	1991-01-09	33	4'10"	252	48972	2024-08-31	06:14:00	2024-08-31	11:49:00	http://mugshots.bcgov.net/images/34/78034/24090209105400.jpeg	2024-11-07 22:00:04.161905
12168	CAMPOS	ADILENE		106 SHADY GLEN DRIVE	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Female	F	1991-01-09	33	4'10"	252	48993	2024-09-01	08:17:00	2024-09-21	11:02:00	http://mugshots.bcgov.net/images/34/78034/24090209105400.jpeg	2024-11-07 22:00:04.163884
12169	CANEJO FILHO	ROSALVO	SAMPAIO	22 CLAYTON CT; SHELL HALL	BLUFFTON, SC 29910 7871	H-White/Latin, Hispanic / Male	M	1981-09-18	43	6'01"	200	49690	2024-10-27	07:42:00	2024-10-27	11:56:00	http://mugshots.bcgov.net/images/67/363967/24102707561600.jpeg	2024-11-07 22:00:04.165808
12170	CAPERS	DORIAN	TRAMMAINE	10 OAKLEAF LANE	Seabrook, SC 29940	N-Black, Non-Hisp / Male	M	1985-07-20	39	6'08"	350	48908	2024-08-26	03:15:00	2024-08-26	13:26:00	http://mugshots.bcgov.net/images/64/35964/24091507452800.jpeg	2024-11-07 22:00:04.167931
12171	CAPERS	DORIAN	TRAMMAINE	10 OAKLEAF LANE	Seabrook, SC 29940	N-Black, Non-Hisp / Male	M	1985-07-20	39	6'08"	350	49186	2024-09-15	07:36:00	2024-10-25	16:50:00	http://mugshots.bcgov.net/images/64/35964/24091507452800.jpeg	2024-11-07 22:00:04.17062
12172	CARFIELD	ADAM	SCOTT	460 ABBEY GLEN WAY	HARDEEVILLE, SC 29927	N-White, Non-Hisp / Male	M	1979-07-31	45	5'11"	160	49115	2024-09-10	17:19:00	2024-09-26	10:09:00	http://mugshots.bcgov.net/images/28/63528/24091017425000.jpeg	2024-11-07 22:00:04.174094
12173	CARLI	JENNIFER	ANN	17 CAPEHART CIR; CAPEHART	Burton, SC 29906	N-White, Non-Hisp / Male	M	1987-05-13	37	5'02"	145	49432	2024-10-03	12:14:00	2024-10-04	10:44:00	http://mugshots.bcgov.net/images/37/35637/24100312180800.jpeg	2024-11-07 22:00:04.177593
12174	CARLTON	BRITTNEE	GAIL	802 CHIQUOLA AVENUE	HONEA PATH, SC 29654	N-White, Non-Hisp / Female	F	1993-07-16	31	5'04"	150	49704	2024-10-28	20:58:00	2024-10-29	09:56:00	http://mugshots.bcgov.net/images/48/386248/24102902222700.jpeg	2024-11-07 22:00:04.179899
12175	CARLTON	TRAVIS	BLAKE	802 CHIQUOLA AVE	HONEA PATH, SC 29654 1201	N-White, Non-Hisp / Male	M	1993-02-28	31	5'08"	155	49703	2024-10-28	20:51:00	2024-10-29	09:49:00	http://mugshots.bcgov.net/images/46/386246/24102820543600.jpeg	2024-11-07 22:00:04.181946
12176	CARON	MEGAN	DANIELLE	20 KINGS CT; SQUIRESGATE	HILTON HEAD ISL, SC 29926 1612	N-White, Non-Hisp / Female	F	1981-09-29	43	5'04"	170	48882	2024-08-24	02:47:00	2024-08-24	11:07:00	http://mugshots.bcgov.net/images/75/8075/24082402593000.jpeg	2024-11-07 22:00:04.184058
12177	CARTER	MATTHEW	L		,	N-Black, Non-Hisp / Male	M	2005-04-13	19	5'08"	160	49393	2024-09-30	17:25:00	2024-10-08	12:36:00	http://mugshots.bcgov.net/images/71/383671/24093017264100.jpeg	2024-11-07 22:00:04.186759
12178	CASTILLO	JACLYN	T	307 E PRESIDENT ST	SAVANNAH, GA 31401 3808	N-White, Non-Hisp / Female	F	1977-04-27	47	5'05"	274	49465	2024-10-06	14:46:00	2024-10-09	12:13:00	http://mugshots.bcgov.net/images/06/152006/24100615033000.jpeg	2024-11-07 22:00:04.188722
12179	CASTRO ABARCA	WILLMER		46 SEAGRASS LN	RIDGLAND, SC 29936	H-White/Latin, Hispanic / Male	M	2003-05-08	21	5'10"	180	49206	2024-09-17	21:37:00	2024-09-18	15:43:00	http://mugshots.bcgov.net/images/85/382285/24091721402600.jpeg	2024-11-07 22:00:04.191326
12180	CASTRO CRUZ	LAZARO	PAULINO	558 HONEY HILL RD	HARDEEVILLE, SC 29927	H-White/Latin, Hispanic / Male	M	1982-12-17	41	5'08"	180	49367	2024-09-28	19:38:00	2024-09-29	11:30:00	http://mugshots.bcgov.net/images/80/383480/24092820112600.jpeg	2024-11-07 22:00:04.193924
12181	CASTRO GERONIMO	JUAN	RAFAEL	3 SWAN LAKE DR; SWAN LAKE	BLUFFTON, SC 29910	N-White, Non-Hisp / Male	M	1993-08-18	31	5'10"	170	49687	2024-10-27	03:05:00	2024-10-27	10:25:00	http://mugshots.bcgov.net/images/12/346212/24102703264000.jpeg	2024-11-07 22:00:04.196393
12182	CASTRO MARADIAGO	MARVIN	ARIEL	516 CYPRESS CV	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	1991-05-18	33	5'06"	135	48734	2024-08-11	06:09:00	2024-08-29	09:00:00	http://mugshots.bcgov.net/images/44/375144/24081106172500.jpeg	2024-11-07 22:00:04.19839
12183	CHANEY-NELSON	ROY	LEE	6165 N. OKATIE HWY	RIDGELAND, SC 29936	N-Black, Non-Hisp / Male	M	1993-02-12	31	6'00"	190	49735	2024-11-01	12:19:00	2024-11-02	10:16:00	http://mugshots.bcgov.net/images/33/45133/24110112294400.jpeg	2024-11-07 22:00:04.200552
12184	CHAVARRIA-GRANADOS	JOSEPH	HUMBERTO	95 DAVIS RD	Bluffton, SC 29910	H-White/Latin, Hispanic / Male	M	1996-10-24	28	5'10"	200	49616	2024-10-20	03:44:00	\N	\N	http://mugshots.bcgov.net/images/25/302825/24102003483100.jpeg	2024-11-07 22:00:04.202458
12185	CHAVEZ-ANGELES	JULIO	C	4 BOBWHITE LN	HILTON HEAD, SC 29928	H-White/Latin, Hispanic / Male	M	1994-11-10	29	5'09"	220	49488	2024-10-09	02:31:00	2024-10-09	14:44:00	http://mugshots.bcgov.net/images/40/177440/24100902360600.jpeg	2024-11-07 22:00:04.204787
12186	CHAVEZ-ELOIDA	LUIS		23 ARANDAS WAY	Hilton Head Isl, SC 29926	H-White/Latin, Hispanic / Male	M	1967-09-10	57	5'07"	165	49183	2024-09-15	03:38:00	2024-09-15	12:09:00	http://mugshots.bcgov.net/images/88/104888/24091504043800.jpeg	2024-11-07 22:00:04.206444
12187	CHAVEZ-REYES	VIDAL	ANTONIO	13 CRESTWOOD AVE	Bluffton, SC 29910	H-White/Latin, Hispanic / Male	M	1985-07-08	39	5'08"	220	49562	2024-10-15	13:06:00	2024-10-16	09:32:00	http://mugshots.bcgov.net/images/87/385087/24101513083300.jpeg	2024-11-07 22:00:04.208975
12188	CHEN	SHI MIN		72 SHELL HALL WAY	Bluffton, SC 29910	N-Asian/Pacific Islander, Non- / Male	M	1994-01-18	30	5'11"	190	49338	2024-09-26	07:50:00	2024-09-26	10:27:00	http://mugshots.bcgov.net/images/94/383294/24092608015100.jpeg	2024-11-07 22:00:04.212238
12189	CHIRINOS MUNGUIA	EMERSON	OMAR	49 W MORNINGSIDE DR	BLUFFTON, SC 29910 7800	N-White, Non-Hisp / Male	M	1990-09-03	34	5'08"	160	49538	2024-10-13	03:05:00	2024-10-13	11:08:00	http://mugshots.bcgov.net/images/31/133031/24101303202300.jpeg	2024-11-07 22:00:04.214738
12190	CHISHOLM	SADA	LATRELL	314 LAUREL BAY RD APT 121	BEAUFORT, SC 29906 3671	N-Black, Non-Hisp / Female	F	1986-01-22	38	5'02"	207	49630	2024-10-22	14:31:00	2024-10-23	11:54:00	http://mugshots.bcgov.net/images/80/302080/24102214180300.jpeg	2024-11-07 22:00:04.217065
12191	CHISOLM	MARCHE	DARIN	100 STUART TOWNE LANE APT 12C	Port Royal, SC 29935	N-Black, Non-Hisp / Female	F	1983-06-08	41	5'07"	260	49779	2024-11-04	21:09:00	2024-11-05	10:09:00	http://mugshots.bcgov.net/images/64/93164/24110421263300.jpeg	2024-11-07 22:00:04.219381
12192	CHISOLM	TONIA	LAKEVIA	8 SOUTHWOOD PARK DR. #136	HILTON HEAD, SC 29926	N-Black, Non-Hisp / Female	F	1970-09-23	54	5'02"	160	48769	2024-08-14	12:19:00	2024-08-15	12:05:00	http://mugshots.bcgov.net/images/58/66958/24081412205800.jpeg	2024-11-07 22:00:04.221622
12193	CHIZIK	JOHN	ABRAHAM	HOMELESS	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1992-11-12	31	6'00"	150	49547	2024-10-13	20:46:00	2024-10-14	10:19:00	http://mugshots.bcgov.net/images/75/29075/24101322325700.jpeg	2024-11-07 22:00:04.223758
12194	CHIZIK	JOHN	ABRAHAM	HOMELESS	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1992-11-12	31	6'00"	150	49556	2024-10-14	17:42:00	2024-10-22	10:57:00	http://mugshots.bcgov.net/images/75/29075/24101322325700.jpeg	2024-11-07 22:00:04.226364
12195	CHRISTIAN	LELAND	BENJAMIN	528 CANDIDA DR; AZALEA SQUARE	Twn Port Royal, SC 29906	N-White, Non-Hisp / Male	M	2006-03-20	18	5'08"	180	49196	2024-09-16	12:31:00	2024-09-27	12:35:00	http://mugshots.bcgov.net/images/86/347786/24091612402400.jpeg	2024-11-07 22:00:04.228883
12196	CHRISTOFEK	DOMINIC	VICTOR	133 DOLPHIN POINT DR; CAT ISLAND	Beaufort, SC 29907	N-White, Non-Hisp / Male	M	1986-06-16	38	6'00"	172	49706	2024-10-29	00:56:00	2024-10-29	09:45:00	http://mugshots.bcgov.net/images/24/166124/24102901221200.jpeg	2024-11-07 22:00:04.231295
12197	CLANCY	CHRISTOPHER	WILLIAM	41 GERARD RD	YAPHANK, NY 11980	N-White, Non-Hisp / Male	M	1969-10-04	55	5'08"	210	48722	2024-08-10	05:46:00	2024-08-10	10:47:00	http://mugshots.bcgov.net/images/56/378256/24081005502000.jpeg	2024-11-07 22:00:04.233772
12198	CLARK	DIAMOND	JESSICA	50 PEBBLE BEACH COVE	BLUFFTON, SC 29910	N-Black, Non-Hisp / Female	F	1991-12-31	32	5'05"	115	49730	2024-10-31	22:45:00	\N	\N	http://mugshots.bcgov.net/images/47/3847/24110108282400.jpeg	2024-11-07 22:00:04.235903
12199	CLARKE	RANDOLPH		49 SIMMONSVILLE RD	Bluffton, SC 29910	N-Black, Non-Hisp / Male	M	1971-06-26	53	5'08"	175	48774	2024-08-15	08:50:00	2024-08-15	09:50:00	http://mugshots.bcgov.net/images/54/378754/24081509050400.jpeg	2024-11-07 22:00:04.238841
12200	CLEARY	KELLY	CHRISTINE	13201 PINCKNEY MARSH LN; LEGENDS NORTH OF BROAD 13201	Twn Port Royal, SC 29935	N-White, Non-Hisp / Female	F	1981-09-13	43	5'07"	220	49796	2024-11-06	10:35:00	2024-11-07	10:04:00	http://mugshots.bcgov.net/images/46/277646/24110610512900.jpeg	2024-11-07 22:00:04.240514
12201	CLEMONS	SIERRA	AISHIA	5 FAWNWOOD LN	Seabrook, SC	N-Black, Non-Hisp / Female	F	1989-04-10	35	5'07"	183	49739	2024-11-01	22:17:00	2024-11-07	14:52:00	http://mugshots.bcgov.net/images/03/36203/24052508455700.jpeg	2024-11-07 22:00:04.242838
12202	COHEN	BRIANA	LYNETTE	14 HILANDA DR; HILANDA MHP	BEAUFORT, SC 29906	N-Black, Non-Hisp / Female	F	1991-06-07	33	5'05"	140	49402	2024-10-01	12:57:00	2024-10-02	12:24:00	http://mugshots.bcgov.net/images/08/12008/23032708583900.jpeg	2024-11-07 22:00:04.244575
12203	COHEN	BRIANA	LYNETTE	14 HILANDA DR; HILANDA MHP	BEAUFORT, SC 29906	N-Black, Non-Hisp / Female	F	1991-06-07	33	5'05"	140	49518	2024-10-11	14:45:00	\N	\N	http://mugshots.bcgov.net/images/08/12008/23032708583900.jpeg	2024-11-07 22:00:04.246915
12204	COHEN	ZARIA	CAVIONA	44 THOMAS ATKINS ROAD	LADY ISLAND, SC 29907	N-Black, Non-Hisp / Female	F	2003-01-27	21	5'08"	180	49157	2024-09-13	16:02:00	2024-09-14	14:10:00	http://mugshots.bcgov.net/images/17/117817/24091316223600.jpeg	2024-11-07 22:00:04.248694
12205	COKE	KHORA	KHONECIA	57 SIMMONSVILLE RD APT 601	BLUFFTON, SC 29910 5982	N-Black, Non-Hisp / Female	F	2004-12-09	19	5'09"	125	49070	2024-09-07	01:03:00	2024-09-07	12:09:00	http://mugshots.bcgov.net/images/89/303889/24090701051100.jpeg	2024-11-07 22:00:04.251684
12206	COLE	EMILY	JOY	47 BURLINGTON CIR; WOODLAND ESTATES	Burton, SC 29906	N-White, Non-Hisp / Female	F	1992-11-24	31	5'11"	300	48778	2024-08-15	20:25:00	2024-08-16	12:35:00	http://mugshots.bcgov.net/images/19/74119/24081520462600.jpeg	2024-11-07 22:00:04.25464
12207	COLEMAN-BROWN	THIA	ANNE	45 GUMWOOD DR	Ladys Island, SC	N-Black, Non-Hisp / Female	F	1962-08-09	62	5'04"	160	49765	2024-11-03	21:17:00	2024-11-04	09:54:00	http://mugshots.bcgov.net/images/41/144741/24110407144000.jpeg	2024-11-07 22:00:04.25656
12208	COLLINS	RAYMOND	FRANCIS	11 WILERS CREEK WAY	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Male	M	1970-04-08	54	6'01"	170	49295	2024-09-24	11:05:00	2024-11-05	15:44:00	http://mugshots.bcgov.net/images/62/7262/24092412174000.jpeg	2024-11-07 22:00:04.258291
12209	COLLINS	THOMAS	RAY	131 NEW ORANGEBURG RD	LEXINGTON, SC 29073	N-White, Non-Hisp / Male	M	1985-04-25	39	5'08"	180	49167	2024-09-14	02:55:00	2024-09-14	14:18:00	http://mugshots.bcgov.net/images/08/381908/24091403410400.jpeg	2024-11-07 22:00:04.260806
12210	COLONGELI	TRACY	A	242 WEST SQ	BLUFFTON, SC 29910 5133	N-White, Non-Hisp / Female	F	1978-07-15	46	5'03"	108	49511	2024-10-11	02:36:00	2024-10-11	10:28:00	http://mugshots.bcgov.net/images/26/92826/24101102513000.jpeg	2024-11-07 22:00:04.26323
12211	CONEY	BERNARD	VALDEZ	1100 HODGE DR	Beaufort, SC 29906 7118	N-Black, Non-Hisp / Male	M	1982-10-17	42	5'09"	160	48976	2024-08-31	14:37:00	2024-09-01	14:33:00	http://mugshots.bcgov.net/images/07/177007/24083114412600.jpeg	2024-11-07 22:00:04.265879
12212	CONNOLLY	KELLY	LYNN	2059 GLOVER ROAD	RIDGELAND, SC 29936	N-White, Non-Hisp / Female	F	1983-12-24	40	5'08"	167	48855	2024-08-22	08:00:00	\N	\N	http://mugshots.bcgov.net/images/08/378808/24082210231800.jpeg	2024-11-07 22:00:04.267445
12213	CONNOLLY	KELLY	LYNN	2059 GLOVER ROAD	RIDGELAND, SC 29936	N-White, Non-Hisp / Female	F	1983-12-24	40	5'08"	167	48854	2024-08-22	10:20:00	2024-09-05	16:57:00	http://mugshots.bcgov.net/images/08/378808/24082210231800.jpeg	2024-11-07 22:00:04.26951
12214	COOK	GRACE	MARION	901 BELLEVIEW CIR W; BELLEVIEW	SHELL POINT, SC 29902	N-White, Non-Hisp / Female	F	1999-11-05	25	5'00"	150	49520	2024-10-11	18:10:00	2024-10-12	11:25:00	http://mugshots.bcgov.net/images/32/17832/24101118175300.jpeg	2024-11-07 22:00:04.272785
12215	COOPER	JERMUL	J SHON	24 ROSEWOOD LN; BAYNARD PARK	Twn of Bluffton, SC 29910	N-Black, Non-Hisp / Male	M	1974-01-10	50	6'00"	225	49210	2024-09-18	07:26:00	2024-09-18	12:14:00	http://mugshots.bcgov.net/images/43/346043/24103108014500.jpeg	2024-11-07 22:00:04.274974
12216	COOPER	JERMUL	J SHON	24 ROSEWOOD LN; BAYNARD PARK	Twn of Bluffton, SC 29910	N-Black, Non-Hisp / Male	M	1974-01-10	50	6'00"	225	49723	2024-10-31	07:49:00	2024-10-31	10:51:00	http://mugshots.bcgov.net/images/43/346043/24103108014500.jpeg	2024-11-07 22:00:04.277328
12217	COOPER	QUINCY	LAVAR	26 GUM TREE RD	Hilton Head Isl, SC 29926	N-Black, Non-Hisp / Male	M	1995-09-24	29	5'09"	153	48834	2024-08-20	09:52:00	2024-08-20	15:45:00	http://mugshots.bcgov.net/images/36/18336/24082009540600.jpeg	2024-11-07 22:00:04.279166
12218	CORBITT	JESSICA	LEIGH	801 PRINCE ST	BEAUFORT, SC 29902 5034	N-White, Non-Hisp / Female	F	1981-08-08	43	5'05"	120	48742	2024-08-11	21:09:00	2024-09-16	17:05:00	http://mugshots.bcgov.net/images/36/78236/24081714533300.jpeg	2024-11-07 22:00:04.281133
12219	CORDRAY	ANTWONE	DWAYNE	203 DULAMO RD	St Helena Islan, SC	N-Black, Non-Hisp / Male	M	1979-02-03	45	6'06"	330	49066	2024-09-06	19:22:00	2024-09-16	16:29:00	http://mugshots.bcgov.net/images/50/11650/24090619342500.jpeg	2024-11-07 22:00:04.28338
12220	CORLEY	AMIEE	NOEL	53 DELANDER CT # 36; PALMETTO BAY VILLAS	Hilton Head Isl, SC 29928	N-White, Non-Hisp / Female	F	1991-12-28	32	5'05"	110	48911	2024-08-26	11:23:00	2024-09-04	13:21:00	http://mugshots.bcgov.net/images/28/9428/24082611222600.jpeg	2024-11-07 22:00:04.285493
12221	CORNISH	MADELEINE	PAIGE	14200 Harbour Pl	Prospect, KY 40059	N-White, Non-Hisp / Female	F	1992-03-11	32	5'07"	110	49595	2024-10-18	13:43:00	2024-10-23	09:21:00	http://mugshots.bcgov.net/images/62/384862/24101814071600.jpeg	2024-11-07 22:00:04.288536
12222	CORRALES PENA	HECTOR	DAVID	156 DILLION RD APT 120	HILTON HEAD ISL, SC 29926	H-White/Latin, Hispanic / Male	M	2004-06-30	20	6'07"	160	49341	2024-09-26	13:44:00	2024-09-28	09:41:00	http://mugshots.bcgov.net/images/59/325659/24092614071100.jpeg	2024-11-07 22:00:04.29158
12223	COUNTEGAN	HANNAH	ERLENE	15 N MAIN STREET #911	HILTON HEAD, SC 29926	N-White, Non-Hisp / Female	F	1998-08-06	26	5'02"	100	48827	2024-08-19	17:15:00	2024-08-20	09:34:00	http://mugshots.bcgov.net/images/76/7576/24081923254600.jpeg	2024-11-07 22:00:04.295112
12224	COUSINO	BRADLY	MICHAEL	Homeless	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1993-01-15	31	6'02"	175	49620	2024-10-20	20:11:00	2024-10-21	13:49:00	http://mugshots.bcgov.net/images/61/218561/24102316254300.jpeg	2024-11-07 22:00:04.297345
12225	COUSINO	BRADLY	MICHAEL	Homeless	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1993-01-15	31	6'02"	175	49640	2024-10-23	16:20:00	\N	\N	http://mugshots.bcgov.net/images/61/218561/24102316254300.jpeg	2024-11-07 22:00:04.300187
12226	COVER	EMILY	RACHEL	1703 ACRES DR; RIVER ACRES	BEAUFORT, SC 29902	N-White, Non-Hisp / Female	F	1997-05-20	27	5'06"	260	49525	2024-10-12	04:59:00	2024-10-12	11:34:00	http://mugshots.bcgov.net/images/62/118562/24101206143800.jpeg	2024-11-07 22:00:04.302188
12227	COX	KENNETH	EDWARD	10 BELLINGER BLUFF RD	Callawassie, SC	N-White, Non-Hisp / Male	M	1973-04-20	51	5'10"	220	48932	2024-08-27	16:45:00	2024-08-28	10:00:00	http://mugshots.bcgov.net/images/93/35193/24082717411300.jpeg	2024-11-07 22:00:04.304721
12228	CRABTREE	MACKENZIE		1 TAFT ST # 130; OAKVIEW COMMONS	Burton, SC 29906	N-White, Non-Hisp / Female	F	1995-05-28	29	5'06"	130	49762	2024-11-03	15:50:00	2024-11-04	10:13:00	http://mugshots.bcgov.net/images/69/385669/24110315494900.jpeg	2024-11-07 22:00:04.30743
12229	CROSS	MARCUS	DANIEL	7 STATION LOOP	Bluffton, SC 29910	Unknown / Male	M	1979-05-12	45	5'10"	170	48729	2024-08-10	22:57:00	2024-08-12	14:47:00	http://mugshots.bcgov.net/images/03/272603/24081023130100.jpeg	2024-11-07 22:00:04.309864
12230	CROWLEY	MONICA	LEIGH	Homeless	, SC	H-White/Latin, Hispanic / Female	F	1997-03-07	27	5'06"	200	49075	2024-09-07	05:41:00	2024-09-07	10:04:00	http://mugshots.bcgov.net/images/94/259394/24091313181000.jpeg	2024-11-07 22:00:04.314361
12231	CROWLEY	MONICA	LEIGH	Homeless	, SC	H-White/Latin, Hispanic / Female	F	1997-03-07	27	5'06"	200	49156	2024-09-13	13:15:00	2024-10-07	15:57:00	http://mugshots.bcgov.net/images/94/259394/24091313181000.jpeg	2024-11-07 22:00:04.316461
12232	CRUM	SAMUEL		543 JONES CIRCLE	Newport, TN 37821	N-White, Non-Hisp / Male	M	1990-10-02	34	6'00"	220	48786	2024-08-16	17:29:00	2024-08-19	22:04:00	http://mugshots.bcgov.net/images/80/378880/24092308041900.jpeg	2024-11-07 22:00:04.319132
12233	CRUM	SAMUEL		543 JONES CIRCLE	Newport, TN 37821	N-White, Non-Hisp / Male	M	1990-10-02	34	6'00"	220	49281	2024-09-23	08:01:00	2024-09-23	12:13:00	http://mugshots.bcgov.net/images/80/378880/24092308041900.jpeg	2024-11-07 22:00:04.322744
12234	CRUZ MENJIVAR	BRAYAN	ALEXANDER	130 STEELPAN LN; Wright Place Mobile	HILTON HEAD ISL, SC 29928	N-White, Non-Hisp / Male	M	2000-06-25	24	6'00"	180	49351	2024-09-27	13:39:00	\N	\N	http://mugshots.bcgov.net/images/58/381658/	2024-11-07 22:00:04.324581
12235	CRUZ-DAVILA	VERNACIO		155 DILLON RD # 2412; COTTON HOPE VILLAS BLDG 24002500	Hilton Head Isl, SC 29926	H-White/Latin, Hispanic / Male	M	1993-04-20	31	5'03"	170	49279	2024-09-22	22:56:00	\N	\N	http://mugshots.bcgov.net/images/41/382841/	2024-11-07 22:00:04.326847
12236	CRUZ-DIAZ	SELVIN	FERNANDO	3002 ROSEIDA RD; RAMBLIN ROSE	Burton, SC	H-White/Latin, Hispanic / Male	M	1995-10-19	29	5'06"	165	48947	2024-08-29	11:53:00	2024-09-05	16:53:00	http://mugshots.bcgov.net/images/06/155306/24082911543200.jpeg	2024-11-07 22:00:04.329483
12237	CUBIAS-RODRIGUEZ	JAVIER	ANTONIO	15 WYATT LN	Twn of Bluffton, SC	H-White/Latin, Hispanic / Male	M	1996-06-08	28	5'10"	170	49449	2024-10-04	19:40:00	2024-10-05	13:53:00	http://mugshots.bcgov.net/images/88/136888/24100419425100.jpeg	2024-11-07 22:00:04.331371
12238	CUEVAS	AIDA	MORELY	21 TOPPERS LN	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1990-02-04	34	5'07"	140	49743	2024-11-02	00:40:00	\N	\N	http://mugshots.bcgov.net/images/23/211523/24110200511800.jpeg	2024-11-07 22:00:04.333357
12239	CURRAN	JOHN	MATTHEW	7 ABBEY AVE; WESTBURY PARK	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1985-09-30	39	5'10"	200	49081	2024-09-08	00:24:00	2024-09-08	12:01:00	http://mugshots.bcgov.net/images/35/232635/24090800473400.jpeg	2024-11-07 22:00:04.335271
12240	CURTIS	DEVON	MAGNUS	108 BRICKWAY ST	BLUFFTON, SC 29910	N-Black, Non-Hisp / Male	M	2000-11-06	24	6'00"	170	49426	2024-10-02	23:16:00	\N	\N	http://mugshots.bcgov.net/images/76/64176/20010903382200.jpeg	2024-11-07 22:00:04.33801
12241	DAISE	CHANTAY	DENISE	96 GOETHE RD	Twn of Bluffton, SC 29910	N-Black, Non-Hisp / Female	F	1994-03-25	30	5'05"	160	49233	2024-09-20	12:33:00	2024-09-21	14:04:00	http://mugshots.bcgov.net/images/35/150935/24092012353800.jpeg	2024-11-07 22:00:04.339918
12242	DANIELS	MEMPHIS	SHAKUR	114 MIDPOINT BLVD	BLUFFTON, SC 29910 4514	N-Black, Non-Hisp / Male	M	2002-01-21	22	5'08"	180	49714	2024-10-29	14:04:00	2024-11-07	05:22:00	http://mugshots.bcgov.net/images/91/250391/24102920062800.jpeg	2024-11-07 22:00:04.343446
12243	DAVIS	JOSEPH	ANTHONY	263 GUM TREE RD	HILTON HEAD ISL, SC 29926	N-Black, Non-Hisp / Male	M	1961-06-15	63	5'06"	175	48803	2024-08-17	21:17:00	2024-08-18	12:01:00	http://mugshots.bcgov.net/images/97/11097/24081721210300.jpeg	2024-11-07 22:00:04.345669
12244	DE LA CRUZ GOMEZ	JACINTO		61 YOUMANS DR	Ladys Island, SC 29907	H-White/Latin, Hispanic / Male	M	2006-01-20	18	5'00"	120	48917	2024-08-26	19:46:00	\N	\N	http://mugshots.bcgov.net/images/23/375523/24082619475700.jpeg	2024-11-07 22:00:04.348681
12245	DE LEON	SHAWN	ANTHONY	HP295 CAMP LEJEUNE	JACKSONVILLE, NC 28540	H-White/Latin, Hispanic / Male	M	1997-05-27	27	5'11"	195	48991	2024-09-01	04:36:00	2024-09-01	14:02:00	http://mugshots.bcgov.net/images/83/380583/24090104460200.jpeg	2024-11-07 22:00:04.351327
12246	DE LEON MEZA	DEYANIRA		1241 WAGON BRANCH LOOP	RIDGELAND, SC 29936	Unknown / Female	F	2000-10-09	24	5'01"	130	48885	2024-08-24	15:22:00	2024-08-25	10:13:00	http://mugshots.bcgov.net/images/13/172913/24082415295000.jpeg	2024-11-07 22:00:04.353435
12247	DEBELLIS	MICHELLE	MAGDALENE	825 BAKERS CT	BLUFFTON, SC 29910 5885	N-White, Non-Hisp / Female	F	1986-07-18	38	5'05"	165	48823	2024-08-19	10:31:00	2024-09-02	05:00:00	http://mugshots.bcgov.net/images/00/208700/24110501175100.jpeg	2024-11-07 22:00:04.354947
12248	DEBELLIS	MICHELLE	MAGDALENE	825 BAKERS CT	BLUFFTON, SC 29910 5885	N-White, Non-Hisp / Female	F	1986-07-18	38	5'05"	165	49781	2024-11-05	00:57:00	2024-11-05	12:38:00	http://mugshots.bcgov.net/images/00/208700/24110501175100.jpeg	2024-11-07 22:00:04.35701
12249	DEFRONZO	BENJAMIN	ELLIS	17 ELIZABETH RD	Beaufort, SC 29907	N-Indian/Alaska Native, Non-Hi / Male	M	1995-04-12	29	5'04"	130	49371	2024-09-29	03:47:00	2024-09-29	10:54:00	http://mugshots.bcgov.net/images/55/281255/24092903520600.jpeg	2024-11-07 22:00:04.359002
12250	DEJESUS	ROBERT	WESLEY	1511 CAROLINA AVE	BEAUFORT, SC 29906 9742	H-Black, Hispanic / Male	M	1977-05-04	47	5'06"	150	49728	2024-10-31	16:25:00	2024-11-07	05:22:00	http://mugshots.bcgov.net/images/83/45183/24103116352800.jpeg	2024-11-07 22:00:04.360866
12251	DEL TUFO	JOHN	LEE	101 WOODHAVEN DR	Hilton Head Isl, SC	N-White, Non-Hisp / Male	M	1958-11-27	65	6'00"	175	49228	2024-09-20	03:50:00	2024-09-21	12:56:00	http://mugshots.bcgov.net/images/19/340619/24092004162400.jpeg	2024-11-07 22:00:04.362663
12252	DELANEY	TONEA	ONYA	685 WOODMEADOW DR	WALTERBORO, SC 29488	N-Black, Non-Hisp / Female	F	1997-04-06	27	5'05"	160	48764	2024-08-13	23:04:00	2024-08-14	10:34:00	http://mugshots.bcgov.net/images/44/378644/24081323304200.jpeg	2024-11-07 22:00:04.364265
12253	DENSON	EMANUEL		HOMELESS	,	N-Black, Non-Hisp / Male	M	1989-09-19	35	6'03"	180	48852	2024-08-22	08:45:00	2024-08-22	10:53:00	http://mugshots.bcgov.net/images/55/374355/24101112110600.jpeg	2024-11-07 22:00:04.366695
12254	DENSON	EMANUEL		HOMELESS	,	N-Black, Non-Hisp / Male	M	1989-09-19	35	6'03"	180	49517	2024-10-11	12:05:00	2024-10-11	15:11:00	http://mugshots.bcgov.net/images/55/374355/24101112110600.jpeg	2024-11-07 22:00:04.368271
12255	DEVEAUX	AARON	EMANUEL	180 PECAN GROVE LN	RIDGELAND, SC 29936	N-Black, Non-Hisp / Male	M	1997-04-08	27	6'01"	185	49771	2024-11-04	08:01:00	2024-11-04	10:02:00	http://mugshots.bcgov.net/images/19/24719/24110408265400.jpeg	2024-11-07 22:00:04.370316
12256	DEVORE	ARTREGO		9 YATES MILL LN; MILL CREEK AT CYPRES	Twn of Bluffton, SC 29909	H-White/Latin, Hispanic / Male	M	1987-07-20	37	6'00"	260	49243	2024-09-20	23:59:00	2024-09-21	11:44:00	http://mugshots.bcgov.net/images/23/288123/24092100080700.jpeg	2024-11-07 22:00:04.372065
12257	DIAZ	ARIEL	MAX	1772 Sanctum St.	Hardeeville, SC 29936	H-White/Latin, Hispanic / Male	M	1988-02-21	36	5'09"	203	49611	2024-10-19	21:01:00	2024-10-21	14:46:00	http://mugshots.bcgov.net/images/62/161062/24101921455900.jpeg	2024-11-07 22:00:04.373781
12258	DIAZ	HUMBERTO	NELSON	12 HUBBARD LN	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1982-04-19	42	5'09"	197	49607	2024-10-19	13:43:00	2024-10-20	11:54:00	http://mugshots.bcgov.net/images/88/291188/24101913555600.jpeg	2024-11-07 22:00:04.378305
12259	DICKSON	LUKE	JOHN	38 REGENT AVE; WESTBURY PARK	BLUFFTON, SC 29910 8823	N-White, Non-Hisp / Male	M	1978-04-04	46	6'02"	200	49598	2024-10-18	16:44:00	2024-10-19	10:11:00	http://mugshots.bcgov.net/images/61/75161/24101818170900.jpeg	2024-11-07 22:00:04.38011
12260	DIEHL	MICHAEL	ANDREW	9 3RD AVE; BLUFFTON PARK	Twn of Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1995-10-06	29	6'01"	170	49716	2024-10-29	16:48:00	2024-10-30	11:26:00	http://mugshots.bcgov.net/images/48/31048/24102917522100.jpeg	2024-11-07 22:00:04.381787
12261	DIGIOVANNA	MAURA	BRENNAN	22 QUARTERMASTER; QUARTERMASTER	Hilton Head Isl, SC 29928	N-White, Non-Hisp / Female	F	1981-02-03	43	5'07"	120	49064	2024-09-06	19:36:00	2024-09-07	11:24:00	http://mugshots.bcgov.net/images/12/254712/24090619483500.jpeg	2024-11-07 22:00:04.383416
12262	DINESH-PAWAR	NISHANT		84 FOREST CV; FOREST COVE	Hilton Head Isl, SC 29928	N-Indian/Alaska Native, Non-Hi / Male	M	2001-03-15	23	6'00"	150	48811	2024-08-18	09:18:00	2024-08-19	16:04:00	http://mugshots.bcgov.net/images/89/378989/24081809514300.jpeg	2024-11-07 22:00:04.386681
12263	DISTASIO	ZACCARI	MICHAEL	212 MARSH POINT DR	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Male	M	1990-03-06	34	5'06"	220	49370	2024-09-28	22:16:00	\N	\N	http://mugshots.bcgov.net/images/31/134431/24071305412300.jpeg	2024-11-07 22:00:04.388287
12264	DIXON	TAYLOR	MONYE ' T	72 MILLEDGE VILLAGE RD	BEAUFORT, SC 29906 8938	N-Black, Non-Hisp / Female	F	1996-10-09	28	5'07"	230	49489	2024-10-09	05:05:00	2024-10-10	14:45:00	http://mugshots.bcgov.net/images/82/217482/24100905395700.jpeg	2024-11-07 22:00:04.390172
12265	DLUHOS	ROBERT	ANDREW	3A HUNTER RD	HILTON HEAD ISL, SC 29909	N-White, Non-Hisp / Male	M	2046-10-23	78	5'09"	185	49346	2024-09-27	01:09:00	2024-09-27	11:37:00	http://mugshots.bcgov.net/images/98/109798/24092701265600.jpeg	2024-11-07 22:00:04.394669
12266	DOE	QUINTIN	JABARI	381 COUNTY SHED RD	Burton, SC 29906	N-Black, Non-Hisp / Male	M	1985-06-29	39	6'00"	250	49012	2024-09-02	23:29:00	2024-09-03	10:26:00	http://mugshots.bcgov.net/images/31/202331/24090223344400.jpeg	2024-11-07 22:00:04.396091
12267	DOUCETTE	ASHLEY	MARIAH	2416 FIRST BLVD	BEAUFORT, SC 29902	N-White, Non-Hisp / Female	F	1985-09-19	39	5'01"	145	49074	2024-09-07	04:36:00	2024-09-07	10:19:00	http://mugshots.bcgov.net/images/72/271172/24090705021900.jpeg	2024-11-07 22:00:04.397953
12268	DOVE	KENNETH	ALVIN	2301 HERMITAGE RD	BEAUFORT, SC 29902 5211	N-White, Non-Hisp / Male	M	1964-07-09	60	6'00"	165	48776	2024-08-15	11:01:00	\N	\N	http://mugshots.bcgov.net/images/67/45267/23061406363700.jpeg	2024-11-07 22:00:04.400307
12269	DOWLING	JEFFERSON	PARDUE	11 SHALLOWBROOK LN	Ladys Island, SC 29902	N-White, Non-Hisp / Male	M	1989-10-24	35	5'06"	180	49466	2024-10-06	15:41:00	2024-10-07	10:50:00	http://mugshots.bcgov.net/images/92/240292/24100616113100.jpeg	2024-11-07 22:00:04.40292
12270	DUBOSE	DEIRDRE	MARY	306 FRASER DR	BEAUFORT, SC 29902	N-White, Non-Hisp / Female	F	1958-05-20	66	5'07"	170	48951	2024-08-30	00:14:00	2024-08-30	09:24:00	http://mugshots.bcgov.net/images/61/380361/24083000570200.jpeg	2024-11-07 22:00:04.404606
12271	DUDAR	SHANNON	KATHERINE	103 LORAINE DR	SIMPSONVILLE, SC 29680 6924	N-White, Non-Hisp / Female	F	1968-05-09	56	5'05"	135	48969	2024-08-31	00:29:00	\N	\N	http://mugshots.bcgov.net/images/08/135308/24083106300400.jpeg	2024-11-07 22:00:04.40637
12272	DUDAR	SHANNON	KATHERINE	103 LORAINE DR	SIMPSONVILLE, SC 29680 6924	N-White, Non-Hisp / Female	F	1968-05-09	56	5'05"	135	48970	2024-08-31	03:37:00	2024-09-01	14:06:00	http://mugshots.bcgov.net/images/08/135308/24083106300400.jpeg	2024-11-07 22:00:04.408467
12273	DUKES	ANTOINETTE		7525 MOUNTAINBROOK DR APT C	COLUMBIA, SC 29209	N-Black, Non-Hisp / Female	F	1991-04-16	33	5'08"	240	49226	2024-09-19	18:06:00	2024-09-27	13:31:00	http://mugshots.bcgov.net/images/51/382551/24091918231600.jpeg	2024-11-07 22:00:04.410484
12274	DURHAM	TAREN	NICHOLE	10 LEMOYNE AVE	Hilton Head Isl, SC 29928	N-White, Non-Hisp / Female	F	1985-06-07	39	5'06"	130	48765	2024-08-13	23:59:00	2024-08-14	11:13:00	http://mugshots.bcgov.net/images/22/1822/24081400012000.jpeg	2024-11-07 22:00:04.412842
12275	ECHEVERRI	NICHOLE	MICHELLE	303 VALENCIA AVE	KISSIMMEE, FL 34743	H-White/Latin, Hispanic / Female	F	1993-07-07	31	5'01"	136	49423	2024-10-03	02:54:00	2024-10-03	15:25:00	http://mugshots.bcgov.net/images/92/383992/24100302472800.jpeg	2024-11-07 22:00:04.415137
12276	EICHELSBACHER	KYLE	FRANCIS	71 SKULL CREEK DR; INDIAN SPRINGS ON SKULL CREEK; HILTON HEA	Hilton Head Isl, SC 29926	N-White, Non-Hisp / Male	M	1994-04-23	30	6'01"	165	48800	2024-08-17	21:02:00	2024-08-18	11:18:00	http://mugshots.bcgov.net/images/35/11535/24102516161600.jpeg	2024-11-07 22:00:04.416638
12277	EICHELSBACHER	KYLE	FRANCIS	71 SKULL CREEK DR; INDIAN SPRINGS ON SKULL CREEK; HILTON HEA	Hilton Head Isl, SC 29926	N-White, Non-Hisp / Male	M	1994-04-23	30	6'01"	165	49052	2024-09-05	19:40:00	2024-09-06	11:19:00	http://mugshots.bcgov.net/images/35/11535/24102516161600.jpeg	2024-11-07 22:00:04.418332
12278	EICHELSBACHER	KYLE	FRANCIS	71 SKULL CREEK DR; INDIAN SPRINGS ON SKULL CREEK; HILTON HEA	Hilton Head Isl, SC 29926	N-White, Non-Hisp / Male	M	1994-04-23	30	6'01"	165	49663	2024-10-25	15:36:00	2024-10-28	11:39:00	http://mugshots.bcgov.net/images/35/11535/24102516161600.jpeg	2024-11-07 22:00:04.420329
12279	EILENBERGER	DONALD	BENNITT	HOMELESS	HILTON HEAD, SC 29926	N-White, Non-Hisp / Male	M	1971-11-28	52	5'11"	180	49340	2024-09-26	13:45:00	2024-09-27	11:52:00	http://mugshots.bcgov.net/images/14/217214/24092617050300.jpeg	2024-11-07 22:00:04.42214
12280	ELDRIDGE	GREGORY	LOUIS	1 TRENTON AVE APT 1	PT PLSNT BEACH, NJ 08742	N-White, Non-Hisp / Male	M	1972-08-10	52	6'00"	240	49454	2024-10-05	00:57:00	2024-10-05	11:40:00	http://mugshots.bcgov.net/images/56/384156/24100501093300.jpeg	2024-11-07 22:00:04.423752
12281	ELMORE-HARPER	HYACINTH	ZAQUIA	2807 WADDELL RD APT 8B	Beaufort, SC 2807	N-Black, Non-Hisp / Female	F	1983-08-13	41	5'04"	140	49229	2024-09-20	07:39:00	2024-09-20	10:30:00	http://mugshots.bcgov.net/images/82/292982/24092007460800.jpeg	2024-11-07 22:00:04.426198
12282	ESCOBAR	CHRISTOPHER	L		,	H-White/Latin, Hispanic / Male	M	1985-08-11	39	'  "	0	49352	2024-09-27	13:39:00	\N	\N	http://mugshots.bcgov.net/images/32/261932/	2024-11-07 22:00:04.427859
12283	ESCOBAR GALINDO	UDIEL		426 LIVE OAK WALK; EDGEFIELD	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	1984-04-29	40	5'05"	220	49171	2024-09-14	04:44:00	2024-09-14	13:44:00	http://mugshots.bcgov.net/images/11/381911/24091407471500.jpeg	2024-11-07 22:00:04.429424
12284	ESCOBAR-REYES	JOSE	EDUARDO	2141 WHALEY ST	LANCASTER, SC 29720 4375	H-White/Latin, Hispanic / Male	M	1971-03-13	53	5'10"	160	49634	2024-10-23	00:46:00	\N	\N	http://mugshots.bcgov.net/images/90/318690/24102300491000.jpeg	2024-11-07 22:00:04.431782
12285	ESCOBEDO	CRISTOPHER	ALEXANDER	55 GARDNER DR APT 4201	HILTON HEAD ISL, SC 29926 5615	N-White, Non-Hisp / Male	M	2003-10-24	21	5'06"	135	49349	2024-09-27	15:06:00	2024-09-28	13:15:00	http://mugshots.bcgov.net/images/50/25150/24102910362100.jpeg	2024-11-07 22:00:04.433981
12286	ESCOBEDO	CRISTOPHER	ALEXANDER	55 GARDNER DR APT 4201	HILTON HEAD ISL, SC 29926 5615	N-White, Non-Hisp / Male	M	2003-10-24	21	5'06"	135	49708	2024-10-29	10:32:00	2024-11-07	05:22:00	http://mugshots.bcgov.net/images/50/25150/24102910362100.jpeg	2024-11-07 22:00:04.435825
12287	ESCOBEDO	MAURO	GUDIEL	4 PARILLA LN	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	1998-10-10	26	5'05"	160	48893	2024-08-25	01:03:00	2024-08-27	12:50:00	http://mugshots.bcgov.net/images/69/302769/24082500533400.jpeg	2024-11-07 22:00:04.437604
12288	ESPOSITO	VINCENT	JOHN	5 NORMANDY CIR; HAMPTON HALL	BLUFFTON, SC 29910 7302	N-White, Non-Hisp / Male	M	2045-06-24	79	5'10"	160	48912	2024-08-26	13:47:00	2024-08-27	08:34:00	http://mugshots.bcgov.net/images/92/379892/24082615211000.jpeg	2024-11-07 22:00:04.440151
12289	ESQUIVEL	EDVIN	ESTUARDO	614 SHADY MARSH LN	BLUFFTON, SC 29910 6243	H-White/Latin, Hispanic / Male	M	1984-10-14	40	5'05"	155	49549	2024-10-14	00:07:00	2024-10-18	09:33:00	http://mugshots.bcgov.net/images/02/12002/24101400220100.jpeg	2024-11-07 22:00:04.442883
12290	ETHEREDGE	KEVIN	LASHAUN	9 CASSANDRA LN APT A	BLUFFTON, SC 29910 9658	N-White, Non-Hisp / Male	M	1985-03-06	39	5'08"	175	49028	2024-09-04	00:39:00	2024-09-04	11:19:00	http://mugshots.bcgov.net/images/77/287177/24090401012500.jpeg	2024-11-07 22:00:04.445607
12291	EVANS	CRYSTAL	RENESHIA	46 FRIENDSHIP LN; COOSAW ISLAND	Ladys Island, SC 29907	N-Black, Non-Hisp / Female	F	1982-11-04	42	5'07"	210	48860	2024-08-22	17:19:00	2024-08-23	10:25:00	http://mugshots.bcgov.net/images/93/19493/24082217405600.jpeg	2024-11-07 22:00:04.447277
12292	EVERETT	BRETT	MCCLOUD	62 HICKORY HILL RD	St Helena Islan, SC 29920	N-White, Non-Hisp / Male	M	1973-04-23	51	6'02"	205	49662	2024-10-25	15:27:00	2024-10-26	13:32:00	http://mugshots.bcgov.net/images/50/9250/24102515425800.jpeg	2024-11-07 22:00:04.449137
12293	FABIUS	ALEXIS	ELIZABETH	11 CAMBRIDGE CT	BLUFFTON, SC 29910	N-White, Non-Hisp / Female	F	1990-04-17	34	5'06"	250	49298	2024-09-24	15:28:00	2024-09-25	10:30:00	http://mugshots.bcgov.net/images/24/39724/24092415384700.jpeg	2024-11-07 22:00:04.451966
12294	FAIRBERT	RILEY	PETER	5804 WEST HANDOVER RD	JAMESVILLE, WI 53548	N-White, Non-Hisp / Male	M	1995-10-25	29	5'11"	120	49287	2024-09-23	20:21:00	2024-09-24	14:51:00	http://mugshots.bcgov.net/images/39/178539/24092320025500.jpeg	2024-11-07 22:00:04.453877
12295	FALTUS	DESTEN	SHEA	214 GREAT BEND DR; SHELL POINT FARM	Twn Port Royal, SC 29906	N-White, Non-Hisp / Male	M	1996-04-02	28	5'08"	160	48950	2024-08-29	20:21:00	2024-08-30	11:54:00	http://mugshots.bcgov.net/images/61/27261/24082920370700.jpeg	2024-11-07 22:00:04.455789
12296	FELIX	DELBERT	EUGENE	52 SQUIRESGATE RD; SQUIRESGATE	Hilton Head Isl, SC 29926	N-Black, Non-Hisp / Male	M	1957-10-13	67	5'07"	171	49600	2024-10-18	22:48:00	2024-11-01	13:20:00	http://mugshots.bcgov.net/images/38/51338/24101822570700.jpeg	2024-11-07 22:00:04.458123
12297	FIELDS	BRENDA	ANN	5 RABON LN	BEAUFORT, SC 29906	N-Black, Non-Hisp / Female	F	1951-03-29	73	5'03"	150	49772	2024-11-04	11:26:00	2024-11-05	11:04:00	http://mugshots.bcgov.net/images/81/45481/24110413071200.jpeg	2024-11-07 22:00:04.460172
12298	FIELDS	KEITH		1205 PRINCE ST	City of Bft, SC 29902 4947	N-Black, Non-Hisp / Male	M	1967-02-07	57	6'08"	165	49376	2024-09-29	16:31:00	2024-09-30	15:25:00	http://mugshots.bcgov.net/images/52/225252/24092916393900.jpeg	2024-11-07 22:00:04.463082
12299	FIELDS	KENNETH	MIKEL	261 CASTLE ROCK RD	Burton, SC	N-Black, Non-Hisp / Male	M	1993-12-24	30	6'00"	160	49236	2024-09-20	16:22:00	2024-10-10	17:37:00	http://mugshots.bcgov.net/images/04/3704/24092016305600.jpeg	2024-11-07 22:00:04.464554
12300	FILIPOWICZ	RALPH	ANTHONY	94 BAYWOOD DR; BAYWOOD	BLUFFTON, SC 29910	N-White, Non-Hisp / Male	M	1981-05-28	43	5'10"	210	49017	2024-09-03	07:38:00	2024-09-03	13:08:00	http://mugshots.bcgov.net/images/16/277216/24102413211300.jpeg	2024-11-07 22:00:04.466667
12301	FILIPOWICZ	RALPH	ANTHONY	94 BAYWOOD DR; BAYWOOD	BLUFFTON, SC 29910	N-White, Non-Hisp / Male	M	1981-05-28	43	5'10"	210	49143	2024-09-12	18:10:00	2024-09-15	05:03:00	http://mugshots.bcgov.net/images/16/277216/24102413211300.jpeg	2024-11-07 22:00:04.468366
12302	FILIPOWICZ	RALPH	ANTHONY	94 BAYWOOD DR; BAYWOOD	BLUFFTON, SC 29910	N-White, Non-Hisp / Male	M	1981-05-28	43	5'10"	210	49648	2024-10-24	13:07:00	\N	\N	http://mugshots.bcgov.net/images/16/277216/24102413211300.jpeg	2024-11-07 22:00:04.470161
12303	FINDLEY	ROBERT	ANTHONY	8 SOUTHWOOD PK DR #131	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Male	M	1977-11-15	46	5'07"	200	49392	2024-09-30	17:06:00	2024-10-01	09:30:00	http://mugshots.bcgov.net/images/98/95798/24093018180000.jpeg	2024-11-07 22:00:04.472029
12304	FLANAGAN	LAURIE	A	90 BAYWOOD DR; BAYWOOD	Bluffton, SC 29910	N-White, Non-Hisp / Female	F	1961-11-14	62	5'06"	120	49374	2024-09-29	15:11:00	2024-09-30	13:30:00	http://mugshots.bcgov.net/images/59/303159/24092915315700.jpeg	2024-11-07 22:00:04.473902
12305	FLANDERS	BUFORD	ELLIS	21 RIVER TREE CIRCLE	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1984-05-28	40	6'02"	180	49777	2024-11-04	19:32:00	2024-11-05	10:12:00	http://mugshots.bcgov.net/images/37/33137/24110419423200.jpeg	2024-11-07 22:00:04.475897
12306	FLATT PATEREK	DAWN	DENICE	2004 CYPRESS ST; Shell Point	Shell Point, SC 29906	N-White, Non-Hisp / Female	F	1981-12-20	42	5'05"	150	49785	2024-11-05	07:57:00	2024-11-05	14:24:00	http://mugshots.bcgov.net/images/02/365302/24110508184600.jpeg	2024-11-07 22:00:04.477773
12307	FLORES MOSSO	LORENA		39 MUDDY CREEK RD	Hilton Head Isl, SC 29926	H-Black, Hispanic / Female	F	1983-06-23	41	5'00"	130	49555	2024-10-14	14:51:00	2024-10-15	12:14:00	http://mugshots.bcgov.net/images/25/385025/24101417360000.jpeg	2024-11-07 22:00:04.479287
12308	FLORES VELASQUEZ	MARLO	DARIO	22 BLAZING STAR LANE	HILTON HEAD ISL, SC 29926	H-White/Latin, Hispanic / Male	M	1975-12-19	48	4'09"	150	48802	2024-08-17	19:37:00	2024-08-21	10:20:00	http://mugshots.bcgov.net/images/08/358608/24081719544000.jpeg	2024-11-07 22:00:04.482147
12309	FLYNN	LINDSAY	MARIE	10 BURLINGTON CIR; BURLINGTON ESTATES	Beaufort, SC 29906 8538	N-White, Non-Hisp / Female	F	1980-12-27	43	5'08"	145	49112	2024-09-10	15:31:00	2024-09-18	15:12:00	http://mugshots.bcgov.net/images/20/73420/24091017132700.jpeg	2024-11-07 22:00:04.484207
12310	FORD	SIDNEY	CREIGHTON	705 CAPTAIN BILL RD	RIDGELAND, SC 29936	N-Black, Non-Hisp / Male	M	1998-11-30	25	6'00"	170	48809	2024-08-18	05:16:00	2024-08-19	11:38:00	http://mugshots.bcgov.net/images/20/341620/24081805510600.jpeg	2024-11-07 22:00:04.486049
12311	FOSTER	ELLIS			,	N-Black, Non-Hisp / Male	M	1972-08-13	52	6'02"	191	49386	2024-09-30	15:33:00	2024-10-05	11:51:00	http://mugshots.bcgov.net/images/54/383654/24093015362300.jpeg	2024-11-07 22:00:04.487645
12312	FOURIE	DAVID	JOHANNES	45 SPRUCE PINE	RIDGELAND, SC 29936	N-White, Non-Hisp / Male	M	1990-12-13	33	5'08"	190	49642	2024-10-23	18:20:00	2024-10-24	10:48:00	http://mugshots.bcgov.net/images/30/262730/24102318262300.jpeg	2024-11-07 22:00:04.489252
12313	FRANKLIN	AKI	DA RON	34 FRANKLIN DR	Beaufort, SC 29906	N-Black, Non-Hisp / Male	M	1995-02-11	29	5'09"	192	49169	2024-09-14	03:01:00	2024-09-14	14:27:00	http://mugshots.bcgov.net/images/38/45338/24091403152200.jpeg	2024-11-07 22:00:04.490775
12314	FRAZIER	DAVID	ANDRE	4 RILEY RD	BEAUFORT, SC 29906 9025	N-Black, Non-Hisp / Male	M	1997-07-08	27	6'00"	160	48906	2024-08-26	01:20:00	2024-08-26	13:05:00	http://mugshots.bcgov.net/images/43/87943/24082601233700.jpeg	2024-11-07 22:00:04.494509
12315	FRAZIER	DERRICK	LEOFFIES	10 ALLEN RD	HILTON HEAD ISL, SC 29926 2040	N-Black, Non-Hisp / Male	M	1992-04-29	32	5'10"	145	49761	2024-11-03	02:36:00	\N	\N	http://mugshots.bcgov.net/images/74/7674/24051222522100.jpeg	2024-11-07 22:00:04.496746
12316	FRAZIER	JOSHUA	JAMAAL	7302 LEGHORN ST	SAVANNAH, GA 31406	N-Black, Non-Hisp / Male	M	1988-12-15	35	6'00"	180	49316	2024-09-25	16:59:00	2024-10-08	13:08:00	http://mugshots.bcgov.net/images/30/141330/24092517150700.jpeg	2024-11-07 22:00:04.498643
12317	FRAZIER	OLIN	DEMARCH	12 SEA POINT DR APT 4	BEAUFORT, SC 29907 1685	N-Black, Non-Hisp / Male	M	1981-03-05	43	5'10"	230	48797	2024-08-17	09:35:00	2024-08-21	13:24:00	http://mugshots.bcgov.net/images/04/5004/24081709402700.jpeg	2024-11-07 22:00:04.500411
12318	FRAZIER	THEODORE	LAMONT	1450 RIBAUT RD	Twn Port Royal, SC	N-Black, Non-Hisp / Male	M	2002-08-03	22	5'08"	160	49583	2024-10-17	15:01:00	2024-10-18	11:15:00	http://mugshots.bcgov.net/images/32/16132/24101715082700.jpeg	2024-11-07 22:00:04.502223
12319	FRAZIER	TURICK	REMAR	1681 SEA ISLAND PKWY	SAINT HELENA IS, SC 29920	N-Black, Non-Hisp / Male	M	1995-06-12	29	6'02"	230	48836	2024-08-20	20:36:00	2024-08-21	11:00:00	http://mugshots.bcgov.net/images/26/10526/24082020572800.jpeg	2024-11-07 22:00:04.503836
12320	FRAZIER	TYRONE		39 HAIGLER BLVD APT A6	BLUFFTON, SC 29910 5819	N-Black, Non-Hisp / Male	M	1959-08-29	65	5'07"	130	49412	2024-10-02	15:51:00	2024-10-03	12:44:00	http://mugshots.bcgov.net/images/50/53050/24100216105700.jpeg	2024-11-07 22:00:04.50643
12321	FRIPP	EARNEST	BRIAN	108 WHITFIELD ST; PINE COVE	City of Bft, SC 29902	N-Black, Non-Hisp / Male	M	1982-01-13	42	6'00"	175	48760	2024-08-13	21:25:00	2024-08-15	07:11:00	http://mugshots.bcgov.net/images/43/196843/24081322044100.jpeg	2024-11-07 22:00:04.508296
12322	FRIPP	GERALD	CLARK	9 GASTON PLANTATION RD; CHELSEA	CHELSEA, SC 29909	N-Black, Non-Hisp / Male	M	1965-12-02	58	5'07"	190	49721	2024-10-30	11:54:00	2024-10-31	09:08:00	http://mugshots.bcgov.net/images/84/160584/24103011423700.jpeg	2024-11-07 22:00:04.511178
12323	FROST	DOMINIC	JERMAINE	1619 MOCKINGBIRD DR	HARDEEVILLE, SC 29927	N-Black, Non-Hisp / Male	M	1980-02-19	44	5'11"	180	49015	2024-09-03	05:20:00	2024-09-03	10:56:00	http://mugshots.bcgov.net/images/09/2109/24090305172800.jpeg	2024-11-07 22:00:04.513082
12324	FROST	SHAKEEMIAH	ROSHANE	311 DASHER RD	TILLMAN, SC 29943	N-Black, Non-Hisp / Female	F	1996-01-27	28	5'05"	180	49510	2024-10-11	01:13:00	2024-10-11	10:30:00	http://mugshots.bcgov.net/images/63/229663/24101101314400.jpeg	2024-11-07 22:00:04.515726
12325	FUENTES	ARMANDO	ARELLANES	106 HOLLY TREE STREET	LEXINGTON, SC 29073	H-White/Latin, Hispanic / Male	M	1980-10-14	44	5'06"	170	49609	2024-10-19	19:48:00	2024-10-20	13:15:00	http://mugshots.bcgov.net/images/35/385435/24101920095500.jpeg	2024-11-07 22:00:04.517264
12326	FULLINGTON	CHARLES	CLAYTON	1 LONESOME CT; BURTON PARK	Burton, SC 29945	N-Black, Non-Hisp / Male	M	2005-01-09	19	5'09"	150	49585	2024-10-17	15:53:00	\N	\N	http://mugshots.bcgov.net/images/89/13789/24101715492000.jpeg	2024-11-07 22:00:04.525886
12327	FULWILER	ROBERT	ALLEN	265 MONARCH CT APT 1	JOHNSON CITY, TN 37601	N-White, Non-Hisp / Male	M	1981-02-09	43	6'01"	220	49163	2024-09-14	01:09:00	2024-09-19	15:54:00	http://mugshots.bcgov.net/images/98/381898/24091401141100.jpeg	2024-11-07 22:00:04.527575
12328	FUNEZ-FUNEZ	ROGER	JOSUE	20 SIMMONSVILLE RD # 1406; EMERSON ISLES APTS	Bluffton, SC 29910	H-White/Latin, Hispanic / Male	M	1996-11-22	27	5'05"	160	49758	2024-11-03	01:24:00	2024-11-03	10:20:00	http://mugshots.bcgov.net/images/04/386804/24110301435300.jpeg	2024-11-07 22:00:04.529042
12329	FURCHAK	MARGARET	MARY	11 HUMMINGBIRD LN; OKATIE RIVER ESTATES	BLUFFTON, SC 29909	N-White, Non-Hisp / Female	F	1976-10-05	48	5'03"	150	49727	2024-10-31	15:50:00	2024-11-01	10:30:00	http://mugshots.bcgov.net/images/25/43825/24103120564000.jpeg	2024-11-07 22:00:04.531048
12330	GADSON	CORY	L	17 GROBER HILL RD; 102	Burton, SC 29906	N-Black, Non-Hisp / Male	M	1980-03-01	44	5'07"	125	48975	2024-08-31	10:22:00	2024-09-13	14:20:00	http://mugshots.bcgov.net/images/16/16716/24092511130500.jpeg	2024-11-07 22:00:04.533785
12331	GADSON	CORY	L	17 GROBER HILL RD; 102	Burton, SC 29906	N-Black, Non-Hisp / Male	M	1980-03-01	44	5'07"	125	49311	2024-09-25	10:26:00	\N	\N	http://mugshots.bcgov.net/images/16/16716/24092511130500.jpeg	2024-11-07 22:00:04.535922
12332	GADSON	DEQUAN	PHAZME-TYOMIE	30 CANOPY LN; GROVE POINTE	St Helena Islan, SC 29935 1204	N-Black, Non-Hisp / Male	M	1995-07-04	29	6'03"	195	49406	2024-10-02	00:16:00	\N	\N	http://mugshots.bcgov.net/images/80/18980/24100200255800.jpeg	2024-11-07 22:00:04.537503
12333	GADSON	ROBERT	MARQUIS	29 SAXONVILLE RD	SAINT HELENA, SC 29920	N-Black, Non-Hisp / Male	M	1992-05-23	32	5'06"	160	49433	2024-10-03	16:31:00	2024-10-04	10:34:00	http://mugshots.bcgov.net/images/08/102208/24100319353800.jpeg	2024-11-07 22:00:04.540232
12334	GAFFORD	WILLIAM	HAYDEN	2730 BACK MOUNTAIN RD	WINCHESTER, VA 22602	N-White, Non-Hisp / Male	M	1971-01-09	53	5'08"	190	49636	2024-10-23	03:01:00	2024-10-23	11:49:00	http://mugshots.bcgov.net/images/60/385760/24102303223700.jpeg	2024-11-07 22:00:04.54292
12335	GALIZA	RIO	DIRK MAHEA	3 SAND LIVE OAK DR	BLUFFTON, SC 29910 4429	H-Asian/Pac_Islander, Hispanic / Male	M	1991-02-17	33	5'09"	240	49658	2024-10-25	07:29:00	2024-10-25	12:44:00	http://mugshots.bcgov.net/images/10/352510/24102507403100.jpeg	2024-11-07 22:00:04.545589
12336	GALVEZ VELASQUEZ	AGUSTIN			,	H-White/Latin, Hispanic / Male	M	1993-11-01	31	5'07"	150	49329	2024-09-25	18:36:00	2024-10-08	13:23:00	http://mugshots.bcgov.net/images/75/383275/24092518523100.jpeg	2024-11-07 22:00:04.549603
12337	GARCIA	ALLISON	FRANCES	33215 DEER TRL	ALPHARETTA, GA 30004	N-White, Non-Hisp / Female	F	1990-11-13	33	5'05"	130	49578	2024-10-17	00:36:00	2024-10-17	15:21:00	http://mugshots.bcgov.net/images/20/385220/24101702063300.jpeg	2024-11-07 22:00:04.552026
12338	GARCIA	EDGAR	BRANDON	12 BRYANT RD	ST HELENA IS, SC 29920 3672	H-White/Latin, Hispanic / Male	M	1996-06-17	28	5'06"	150	48727	2024-08-10	21:01:00	2024-08-11	10:48:00	http://mugshots.bcgov.net/images/47/10347/24081021165300.jpeg	2024-11-07 22:00:04.554807
12339	GARCIA VASQUEZ	EDY		324 saunders rd	Beaufort, SC 29902	H-White/Latin, Hispanic / Male	M	1981-03-29	43	6'00"	200	49322	2024-09-25	17:54:00	2024-10-08	12:40:00	http://mugshots.bcgov.net/images/65/377565/24092517581700.jpeg	2024-11-07 22:00:04.559493
12340	GARRETT	GAVIN	ANTHONY	14 JIB SAIL CT	HILTON HEAD ISL, SC 29928 3555	N-White, Non-Hisp / Male	M	1997-11-01	27	5'07"	125	49579	2024-10-17	02:12:00	2024-10-17	10:15:00	http://mugshots.bcgov.net/images/41/211041/24101702264500.jpeg	2024-11-07 22:00:04.561629
12341	GARRETT	JAYVON	ANDRE	1742 JASPERSTONE CIR; CAROLINA ESTATES	BEAUFORT, SC 29906 9718	N-Black, Non-Hisp / Male	M	2004-05-12	20	6'01"	145	49097	2024-09-09	10:10:00	2024-09-09	15:46:00	http://mugshots.bcgov.net/images/36/164336/24090910305500.jpeg	2024-11-07 22:00:04.563622
12342	GARVIN	HARRISON	KING	10 PELICAN CIR; AUDUBON WOODS	Burton, SC 29906	N-Black, Non-Hisp / Male	M	1989-07-19	35	5'11"	220	49309	2024-09-25	08:54:00	2024-09-25	11:44:00	http://mugshots.bcgov.net/images/28/37528/24092509062400.jpeg	2024-11-07 22:00:04.566176
12343	GARY	BOBBY	ROBERT	160 BROAD RIVER BLVD	Burton, SC 299906	N-Black, Non-Hisp / Male	M	1973-03-01	51	5'03"	180	49553	2024-10-14	11:50:00	2024-10-14	15:16:00	http://mugshots.bcgov.net/images/73/133273/24101413015300.jpeg	2024-11-07 22:00:04.568399
12344	GASKINS	ZACHERY	JEROME	1240 BELVEDERE DR	HANAHAN, SC 29410 2302	N-White, Non-Hisp / Male	M	1986-01-14	38	5'08"	140	48892	2024-08-24	22:58:00	2024-08-25	13:07:00	http://mugshots.bcgov.net/images/75/17575/24082423100400.jpeg	2024-11-07 22:00:04.570396
12345	GATHERS	CHEUMALT	OMEGA	30 REEVES ST	WALTERBORO, SC 29488 6522	N-Black, Non-Hisp / Male	M	1983-06-02	41	5'11"	195	49783	2024-11-05	01:28:00	2024-11-05	10:08:00	http://mugshots.bcgov.net/images/57/52457/24110502022900.jpeg	2024-11-07 22:00:04.57382
12346	GAVIGAN	LAURIE	ROXANN	2216 MOSS ST; LIVE OAK AT BATTERY CREEK	BEAUFORT, SC 29902 4211	N-White, Non-Hisp / Female	F	1971-10-04	53	5'07"	135	49021	2024-09-03	15:02:00	2024-09-04	12:03:00	http://mugshots.bcgov.net/images/55/37955/24090320325600.jpeg	2024-11-07 22:00:04.57608
12347	GAY	KATHERINE	NICOLE	914 16TH ST	PORT ROYAL, SC 29935 2133	N-White, Non-Hisp / Female	F	1997-07-30	27	5'08"	140	49462	2024-10-06	05:12:00	2024-10-06	11:14:00	http://mugshots.bcgov.net/images/99/110199/24100606142400.jpeg	2024-11-07 22:00:04.578218
12348	GERMAN	CARLTON	ALEXANDER	795 CHURCH RD	Hardeeville, SC 29927	N-Black, Non-Hisp / Male	M	1986-09-07	38	5'11"	140	49271	2024-09-22	02:44:00	2024-09-24	16:17:00	http://mugshots.bcgov.net/images/93/175493/24092202504800.jpeg	2024-11-07 22:00:04.580767
12349	GIBBS	ALEXANDER		55 MILLAGE VILLAGE RD	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1958-01-08	66	6'00"	180	49384	2024-09-30	09:30:00	\N	\N	http://mugshots.bcgov.net/images/43/2143/24093009312800.jpeg	2024-11-07 22:00:04.583554
12350	GIBSON	CHRISTOPHER	MONROE	34 JAMES O CT; VERDIER VIEW	Pritchardville, SC 29909	N-White, Non-Hisp / Male	M	1985-05-09	39	5'10"	157	49737	2024-11-01	14:24:00	2024-11-02	10:48:00	http://mugshots.bcgov.net/images/57/124557/24110114332800.jpeg	2024-11-07 22:00:04.586812
12351	GILL	TYQUAD	LESHAUD	11 CAMBRIDGE CT; OLDE TOWNE VILLAGE	BLUFFTON, SC 29910	N-Black, Non-Hisp / Male	M	1997-02-02	27	6'00"	187	49297	2024-09-24	14:51:00	2024-09-25	12:14:00	http://mugshots.bcgov.net/images/96/133096/24092414515600.jpeg	2024-11-07 22:00:04.588477
12352	GILLESPIE	JAMES	DESHONN	2 MOON DANCE CT; PALMETTO POINTE TOWN	Twn of Bluffton, SC 29910	N-Black, Non-Hisp / Male	M	1982-01-15	42	6'00"	220	49312	2024-09-25	10:30:00	2024-09-26	10:35:00	http://mugshots.bcgov.net/images/64/383164/24092510542900.jpeg	2024-11-07 22:00:04.591626
12353	GILLISON	ESAU		2 BLACKSMITH CIR; IRONGATE	Burton, SC	N-Black, Non-Hisp / Male	M	1993-05-23	31	6'00"	170	48754	2024-08-13	05:26:00	2024-08-13	11:09:00	http://mugshots.bcgov.net/images/02/8202/24081305370900.jpeg	2024-11-07 22:00:04.593905
12354	GILYARD	WALDEMAR	PORTEOUS	1133 EAGLE POINTE	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1989-02-02	35	5'09"	150	49029	2024-09-04	02:29:00	2024-09-04	11:53:00	http://mugshots.bcgov.net/images/10/106410/24090403080900.jpeg	2024-11-07 22:00:04.597129
12355	GLAZE	KA'SHAWN	RASHAD	101 HAIGLER BLVD APT 306	BLUFFTON, SC 29910 7994	N-Black, Non-Hisp / Male	M	2003-07-22	21	5'06"	140	49572	2024-10-16	01:18:00	\N	\N	http://mugshots.bcgov.net/images/37/23637/24061812495400.jpeg	2024-11-07 22:00:04.59905
12356	GLOVER	TIFFANY	TARAN	110 HAIGLER BLVD APT 603	BLUFFTON, SC 29910 4504	N-Black, Non-Hisp / Female	F	1987-03-21	37	5'06"	130	49557	2024-10-14	19:40:00	2024-10-15	09:59:00	http://mugshots.bcgov.net/images/40/19240/24101420105000.jpeg	2024-11-07 22:00:04.601375
12357	GLOWNEY	JUSTIN	MICHAEL	15 SHAMROCK CIR; SHAMROCK CIRCLE	Hilton Head Isl, SC 29926	N-White, Non-Hisp / Male	M	1996-03-23	28	5'10"	160	49005	2024-09-02	08:53:00	2024-09-03	17:46:00	http://mugshots.bcgov.net/images/16/2716/24090209121300.jpeg	2024-11-07 22:00:04.603248
12358	GODFREY	ARTHUR		36 S FOREST BEACH DR	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Male	M	1964-04-10	60	5'08"	180	49804	2024-11-07	12:28:00	\N	\N	http://mugshots.bcgov.net/images/79/253079/24110712361400.jpeg	2024-11-07 22:00:04.606336
12359	GOMEZ ADAME	ALEJANDRO		230 HITCHING POST CRES; THE FARM @ BUCKWALTE	Twn of Bluffton, SC 29910	H-White/Latin, Hispanic / Male	M	1998-09-04	26	5'05"	150	49246	2024-09-21	02:47:00	\N	\N	http://mugshots.bcgov.net/images/91/382691/24092103092700.jpeg	2024-11-07 22:00:04.608372
12360	GOMEZ-ADAME	OSVALDO		230 HITCHING POST CRES; THE FARM @ BUCKWALTE	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	2002-09-11	22	5'06"	165	49544	2024-10-13	14:59:00	2024-10-16	09:30:00	http://mugshots.bcgov.net/images/35/349735/24101315224900.jpeg	2024-11-07 22:00:04.610708
12361	GONDERMAN	STEVE	EUGENE	11 TANGLEWOOD DR #15; HILTON HEAD BEACH CLUB	Hilton Head Isl, SC 29928	N-White, Non-Hisp / Male	M	1964-01-01	60	6'01"	225	49535	2024-10-13	02:02:00	2024-10-13	11:10:00	http://mugshots.bcgov.net/images/65/166765/24101302211300.jpeg	2024-11-07 22:00:04.613101
12362	GONZALEZ	KEVIN	IAN	3 DIANAHS DR	HILTON HEAD ISL, SC 29926	H-White/Latin, Hispanic / Male	M	1998-08-15	26	6'00"	260	48963	2024-08-30	19:41:00	\N	\N	http://mugshots.bcgov.net/images/64/54864/21012807471400.jpeg	2024-11-07 22:00:04.614744
12363	GONZALEZ	KROSS	JESUS	HOMELESS	BEAUFORT, SC 29906	H-White/Latin, Hispanic / Male	M	2000-12-19	23	5'04"	130	49324	2024-09-25	18:08:00	2024-10-08	17:34:00	http://mugshots.bcgov.net/images/02/243602/24092518170800.jpeg	2024-11-07 22:00:04.616673
12364	GONZALEZ MORENO	ALAN	OMAR	124 MALPHRUS RD APT 308	BLUFFTON, SC 29910 6651	H-White/Latin, Hispanic / Male	M	2000-12-17	23	5'07"	160	49193	2024-09-16	04:57:00	2024-09-16	10:42:00	http://mugshots.bcgov.net/images/98/68898/24091604583600.jpeg	2024-11-07 22:00:04.618532
12365	GONZALEZ-CERVANTES	GUSTAVO	ANGEL	199 COTTON FIELD LN E; THE FARM @ BUCKWALTE	Twn of Bluffton, SC 29906	H-White/Latin, Hispanic / Male	M	2001-02-26	23	5'05"	150	49760	2024-11-03	04:00:00	2024-11-03	09:51:00	http://mugshots.bcgov.net/images/11/386811/24110304263300.jpeg	2024-11-07 22:00:04.62146
12366	GONZALEZ-TREMINIO	LUIS	EDUARDO	19 ALEX PATTERSON RD; THE GLEN	Hilton Head Isl, SC 29926	H-White/Latin, Hispanic / Male	M	2005-01-10	19	5'10"	180	49185	2024-09-15	08:16:00	2024-09-16	08:28:00	http://mugshots.bcgov.net/images/88/356688/24091508534700.jpeg	2024-11-07 22:00:04.623437
12367	GOUDY	ROMELLAH	LATISHA	12 SEA POINT DR #138; SEA POINT APTS #138; SEA POINT ; 138	City of Bft, SC 29907	N-Black, Non-Hisp / Female	F	1985-09-25	39	5'09"	160	48898	2024-08-25	15:38:00	2024-08-26	12:44:00	http://mugshots.bcgov.net/images/72/40272/24082515423300.jpeg	2024-11-07 22:00:04.626234
12368	GRABOWSKI	PETER	PAUL	90 HELMSMAN WAY # 101; Dockmaster Court Vil	Hilton Head Isl, SC 29928	N-White, Non-Hisp / Male	M	1955-10-07	69	6'01"	210	48875	2024-08-23	19:38:00	2024-08-24	09:58:00	http://mugshots.bcgov.net/images/91/170091/24082320055900.jpeg	2024-11-07 22:00:04.628093
12369	GRAHAM	RAYMOND	ALLEN	45 SPARWHEEL LN; WINDMILL HARBOR	HILTON HEAD ISL, SC 29926 1275	N-White, Non-Hisp / Male	M	2048-05-31	76	5'10"	135	49113	2024-09-10	14:44:00	\N	\N	http://mugshots.bcgov.net/images/64/109464/	2024-11-07 22:00:04.630324
12370	GRANILLO-GAYOSSO	GERADO			,	H-White/Latin, Hispanic / Male	M	1995-02-02	29	5'05"	168	49394	2024-09-30	17:40:00	2024-10-08	13:29:00	http://mugshots.bcgov.net/images/74/383674/24093017412000.jpeg	2024-11-07 22:00:04.633184
12371	GRANT	JADON	ISIAH	135 BIG ESTATES CIR	YEMASSEE, SC 29945 7518	N-Black, Non-Hisp / Male	M	2002-09-22	22	5'10"	180	49073	2024-09-07	02:26:00	2024-09-07	12:14:00	http://mugshots.bcgov.net/images/08/273008/24090703173100.jpeg	2024-11-07 22:00:04.63488
12372	GRANT	RACHAEL	MYRANDA	11 SMITH LN	BLUFFTON, SC 29910	N-White, Non-Hisp / Female	F	1990-05-14	34	5'04"	120	49134	2024-09-11	22:35:00	2024-09-16	10:05:00	http://mugshots.bcgov.net/images/47/20747/24091122432600.jpeg	2024-11-07 22:00:04.637575
12373	GRAY	AMBER	REGINA	HOMELESS	,	N-Black, Non-Hisp / Female	F	1991-02-08	33	5'06"	160	49597	2024-10-18	16:39:00	2024-10-19	09:51:00	http://mugshots.bcgov.net/images/66/54566/24101816480600.jpeg	2024-11-07 22:00:04.639377
12374	GRAY	DEXTER	LEON	JASPER COUNTY DETENTION CENTER	RIDGELAND, SC	N-Black, Non-Hisp / Male	M	1975-07-17	49	5'09"	150	49272	2024-09-22	02:57:00	2024-10-08	17:01:00	http://mugshots.bcgov.net/images/23/77623/24092203021500.jpeg	2024-11-07 22:00:04.641643
12375	GRAY	NICHOLAS	ALEXANDER	426 wagner hwy	leesville, SC 29006	N-Black, Non-Hisp / Male	M	2007-10-14	17	6'01"	155	49592	2024-10-15	21:26:00	\N	\N	http://mugshots.bcgov.net/images/40/385140/	2024-11-07 22:00:04.64381
12376	GREEN	DEMIEN	JAMAL	6 CHRISTOPHER DR	HILTON HEAD ISL, SC 29928 3611	N-Black, Non-Hisp / Male	M	1987-04-15	37	5'09"	255	49095	2024-09-09	06:06:00	2024-09-09	09:26:00	http://mugshots.bcgov.net/images/40/116240/24090906120300.jpeg	2024-11-07 22:00:04.645346
12377	GREEN	DWIGHT	ANTONIO	1514 SIFLY RD	ORANGEBURG, SC 29118 1338	N-Black, Non-Hisp / Male	M	1984-09-18	40	6'00"	245	49150	2024-09-13	01:57:00	2024-09-13	10:45:00	http://mugshots.bcgov.net/images/96/210696/24091302040400.jpeg	2024-11-07 22:00:04.646949
12378	GREEN	GIOVANNI	ARMANI	19 HOUSTON DR	Ladys Island, SC 29907	N-Black, Non-Hisp / Male	M	2006-09-03	18	4'07"	90	49162	2024-09-14	00:15:00	2024-09-14	13:41:00	http://mugshots.bcgov.net/images/04/99704/24091400373900.jpeg	2024-11-07 22:00:04.648978
12379	GREEN	JASMINE		4304 Candelite Dr	Columbia, SC 29209	N-Black, Non-Hisp / Female	F	2000-04-20	24	5'02"	155	49225	2024-09-19	18:07:00	2024-09-23	13:03:00	http://mugshots.bcgov.net/images/27/382527/24091918195600.jpeg	2024-11-07 22:00:04.651282
12380	GREEN	QUENTIN	LAMONT	6 CHRISTOPHER DR	HILTON HEAD, SC 29928 3611	N-Black, Non-Hisp / Male	M	1987-04-11	37	5'01"	160	49401	2024-10-01	02:36:00	2024-10-01	09:38:00	http://mugshots.bcgov.net/images/64/79764/24100102502200.jpeg	2024-11-07 22:00:04.654188
12381	GREEN	ROLAND	ETHAN	169 SIMMONSVILLE RD	BLUFFTON, SC 29910	N-Black, Non-Hisp / Male	M	1990-11-10	33	6'00"	220	49763	2024-11-03	19:46:00	2024-11-04	10:28:00	http://mugshots.bcgov.net/images/64/386864/24110319522600.jpeg	2024-11-07 22:00:04.656448
12382	GREEN	WHITNEY	SAMONE	1710 GREENLAWN DR APT 103	BEAUFORT, SC 29902 3858	N-Black, Non-Hisp / Female	F	1991-04-28	33	4'11"	130	49564	2024-10-15	19:38:00	2024-10-16	15:38:00	http://mugshots.bcgov.net/images/99/80899/24101606540700.jpeg	2024-11-07 22:00:04.65872
12383	GREGORY	FREDDRICK		19 BEACH RD	Pritchardville, SC 29910	N-Black, Non-Hisp / Male	M	1984-09-18	40	5'09"	170	49018	2024-09-03	07:36:00	2024-09-04	11:39:00	http://mugshots.bcgov.net/images/28/6428/24090307505100.jpeg	2024-11-07 22:00:04.661719
12384	GREMINGER	MANFRED	CARLO	125 OAKESDALE DR	BLUFFTON, SC 29909 7819	H-White/Latin, Hispanic / Male	M	1986-03-30	38	5'10"	185	49164	2024-09-14	00:51:00	2024-09-15	11:22:00	http://mugshots.bcgov.net/images/40/28040/24110617360500.jpeg	2024-11-07 22:00:04.66382
12385	GREMINGER	MANFRED	CARLO	125 OAKESDALE DR	BLUFFTON, SC 29909 7819	H-White/Latin, Hispanic / Male	M	1986-03-30	38	5'10"	185	49684	2024-10-26	22:12:00	2024-10-27	11:39:00	http://mugshots.bcgov.net/images/40/28040/24110617360500.jpeg	2024-11-07 22:00:04.667858
12386	GREMINGER	MANFRED	CARLO	125 OAKESDALE DR	BLUFFTON, SC 29909 7819	H-White/Latin, Hispanic / Male	M	1986-03-30	38	5'10"	185	49799	2024-11-06	17:29:00	2024-11-07	11:36:00	http://mugshots.bcgov.net/images/40/28040/24110617360500.jpeg	2024-11-07 22:00:04.669471
12387	GRIFFIN	FLOYD	LEROY	31A HARDING ST	BEAUFORT, SC 29902 5123	N-Black, Non-Hisp / Male	M	1983-07-31	41	5'07"	160	49161	2024-09-13	23:05:00	2024-09-16	12:18:00	http://mugshots.bcgov.net/images/79/58679/24091323205100.jpeg	2024-11-07 22:00:04.671273
12388	GRIFFIN	TORRIC	MONIQUE	208 CASTLE ROCK RD	Burton, SC 29906	N-Black, Non-Hisp / Male	M	1978-04-04	46	5'08"	155	48872	2024-08-23	14:06:00	2024-09-26	06:45:00	http://mugshots.bcgov.net/images/70/870/24082314164200.jpeg	2024-11-07 22:00:04.673307
12389	GROBER	ANDREW	LEE	250 CASTLE ROCK RD	Beaufort, SC 29906	N-Black, Non-Hisp / Male	M	1997-02-25	27	5'11"	150	49315	2024-09-25	16:57:00	2024-10-08	13:11:00	http://mugshots.bcgov.net/images/61/861/24092517131900.jpeg	2024-11-07 22:00:04.675321
12390	GROSCOST	SHAUN	SKYELOR	803 DANNER DR; MALIND BLUFF	OKATIE, SC 29909	N-White, Non-Hisp / Male	M	1989-01-30	35	5'03"	170	49347	2024-09-27	11:16:00	2024-09-28	12:27:00	http://mugshots.bcgov.net/images/24/283824/24092711175700.jpeg	2024-11-07 22:00:04.67726
12391	GUERTIN	TYLER	GRANT	9203 CORD GRASS LN	Beaufort, SC 29906	N-White, Non-Hisp / Male	M	1998-02-16	26	5'06"	140	48938	2024-08-28	03:40:00	2024-08-28	09:12:00	http://mugshots.bcgov.net/images/58/380058/24082803573900.jpeg	2024-11-07 22:00:04.679014
12392	HABERSHAM	CEDRICK	KENNARD	636 SEASIDE RD	SAINT HELENA IS, SC 29920 6319	N-Black, Non-Hisp / Male	M	1991-05-12	33	6'01"	199	49541	2024-10-13	04:02:00	2024-10-13	11:03:00	http://mugshots.bcgov.net/images/47/230047/24101304322700.jpeg	2024-11-07 22:00:04.680559
12393	HABERSHAM	JAMEL	DUZA	571 Edwards Road	Walterboro, SC 29488	N-Black, Non-Hisp / Male	M	1978-08-31	46	6'02"	300	49282	2024-09-23	09:06:00	2024-09-23	14:38:00	http://mugshots.bcgov.net/images/41/52841/24092309563500.jpeg	2024-11-07 22:00:04.682535
12394	HABERSHAM	KA'ROME	DEVELLE	11 ROBINSON HILL RD.	Seabrook, SC 29940	N-Black, Non-Hisp / Male	M	1992-12-08	31	6'01"	270	49002	2024-09-02	00:01:00	2024-09-02	14:06:00	http://mugshots.bcgov.net/images/15/35015/24090213550900.jpeg	2024-11-07 22:00:04.684096
12395	HAGAN	RYAN	ONEAL	185 COOPER DR	AIKEN, SC 29803	N-White, Non-Hisp / Male	M	1997-12-20	26	5'07"	130	48804	2024-08-17	20:31:00	2024-08-18	10:35:00	http://mugshots.bcgov.net/images/87/59387/24081720325300.jpeg	2024-11-07 22:00:04.686179
12396	HALEY	JENNIFER	PETROSHUS	3711 W SPINNAKER LN	TUCSON, AZ 85742	N-White, Non-Hisp / Female	F	1974-08-16	50	5'04"	204	49405	2024-10-01	22:55:00	2024-10-02	10:14:00	http://mugshots.bcgov.net/images/90/363790/24100123330000.jpeg	2024-11-07 22:00:04.68783
12397	HALPERIN	MARC	ALAN	17 EDGEWATER CIR; THE LAKES AT EDGEWATER; APT D	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	2046-04-18	78	6'00"	230	48995	2024-09-01	13:12:00	2024-09-03	17:30:00	http://mugshots.bcgov.net/images/62/253762/24090317251900.jpeg	2024-11-07 22:00:04.689507
12398	HAMILTON	MELVIN	TERRELL	6 DONALDSON DR.	BURTON, SC 29906	N-Black, Non-Hisp / Male	M	1983-01-24	41	6'03"	225	49700	2024-10-28	10:18:00	\N	\N	http://mugshots.bcgov.net/images/27/19127/24102810335200.jpeg	2024-11-07 22:00:04.691064
12399	HAMMOND	ZALEXEONTA		11 SOUTHWOOD PARK DR #34; HILTON HEAD GARDENS	Hilton Head Isl, SC 29926	N-Black, Non-Hisp / Female	F	1999-04-20	25	5'05"	100	48914	2024-08-26	13:54:00	2024-08-27	11:13:00	http://mugshots.bcgov.net/images/73/223573/24082613444000.jpeg	2024-11-07 22:00:04.693108
12400	HAMPTON	JOSHUA	ADAM	9201 PINCKNEY MARSH LN	BEAUFORT, SC 29906	N-White, Non-Hisp / Male	M	1982-12-06	41	6'01"	200	48743	2024-08-11	22:30:00	2024-08-18	12:38:00	http://mugshots.bcgov.net/images/05/293505/24082421470200.jpeg	2024-11-07 22:00:04.694741
12401	HAMPTON	JOSHUA	ADAM	9201 PINCKNEY MARSH LN	BEAUFORT, SC 29906	N-White, Non-Hisp / Male	M	1982-12-06	41	6'01"	200	48888	2024-08-24	21:37:00	2024-08-25	12:37:00	http://mugshots.bcgov.net/images/05/293505/24082421470200.jpeg	2024-11-07 22:00:04.696629
12402	HANNAH	JERNAUL	SHA'REE O'NEAL	5509 EMORY DR	SAVANNAH, GA 31406	N-Black, Non-Hisp / Male	M	1993-10-16	31	5'07"	162	49227	2024-09-20	01:53:00	2024-09-20	12:54:00	http://mugshots.bcgov.net/images/50/332950/24092002274900.jpeg	2024-11-07 22:00:04.69818
12403	HANSON	JANE	EDITH	11 SOUTHWOOD PARK DR #7	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Female	F	1961-06-29	63	5'09"	137	49353	2024-09-28	00:09:00	2024-09-28	12:13:00	http://mugshots.bcgov.net/images/55/21155/24092800325100.jpeg	2024-11-07 22:00:04.699901
12404	HARGROVE	EMANUELLE		686 FLOYD ROAD	RIDGELAND, SC 29936	N-Black, Non-Hisp / Male	M	2000-06-23	24	6'03"	170	49328	2024-09-25	18:31:00	2024-10-08	17:20:00	http://mugshots.bcgov.net/images/78/356078/24092518554400.jpeg	2024-11-07 22:00:04.701465
12405	HARRINGTON	TYREK	LEE	196 SQUIRE POPE RD	Hilton Head Isl, SC 29926	N-Black, Non-Hisp / Male	M	1997-01-26	27	5'11"	170	49473	2024-10-07	08:02:00	2024-10-07	12:53:00	http://mugshots.bcgov.net/images/46/7746/24100712455600.jpeg	2024-11-07 22:00:04.7032
12406	HARRIS	NICOLE	STACY	1807 SOUTH BROAD STREET	PHILADELPHIA, PA 19148	N-Black, Non-Hisp / Male	M	1988-12-28	35	5'08"	125	49138	2024-09-12	03:52:00	2024-09-12	10:14:00	http://mugshots.bcgov.net/images/86/244786/24091204220100.jpeg	2024-11-07 22:00:04.704826
12407	HARRIS WILLIAMS	LARETHA	MARGARET L	768 EBENZER RD	RINCON, GA 31326	N-Black, Non-Hisp / Female	F	2005-05-20	19	5'05"	107	49528	2024-10-12	08:34:00	2024-10-13	11:21:00	http://mugshots.bcgov.net/images/84/384884/24101208381600.jpeg	2024-11-07 22:00:04.706318
12408	HARTY	ELEANOR	PENTON	40 FOLLY FIELD RD APT C133	HILTON HEAD ISL, SC 29928 6849	N-White, Non-Hisp / Female	F	1954-09-16	70	5'05"	115	48788	2024-08-16	22:38:00	2024-08-17	12:37:00	http://mugshots.bcgov.net/images/27/121527/24081622591600.jpeg	2024-11-07 22:00:04.708087
12409	HARVEY	DANNY	WILLI	2102 RIVER ROCK WAY; RIVERPOINTE @ LIVE O	City of Bft, SC 29902	N-White, Non-Hisp / Male	M	1974-07-16	50	6'00"	240	49308	2024-09-25	08:19:00	2024-09-25	11:41:00	http://mugshots.bcgov.net/images/96/324096/24092508364100.jpeg	2024-11-07 22:00:04.710128
12410	HASSELBACK	CASSANDRA	LYNNE	170 FISHER RD	VARNVILLE, SC 29944	N-White, Non-Hisp / Female	F	2000-05-26	24	5'08"	155	49195	2024-09-16	07:30:00	2024-09-16	10:16:00	http://mugshots.bcgov.net/images/26/213926/24091608071800.jpeg	2024-11-07 22:00:04.711817
12411	HATFIELD	DAVID	CAMERON	22 STAGECOACH RD; SEABROOK POINT	Seabrook, SC 29940	N-White, Non-Hisp / Male	M	1997-04-12	27	5'07"	145	49364	2024-09-28	14:49:00	2024-10-03	17:06:00	http://mugshots.bcgov.net/images/67/3467/24092814590800.jpeg	2024-11-07 22:00:04.713984
12412	HAYES	CHRISTOPHER	ALAN	35 MULRAIN WAY	BLUFFTON, SC 29910	N-White, Non-Hisp / Male	M	1989-12-26	34	6'00"	175	49404	2024-10-01	22:34:00	2024-10-02	10:36:00	http://mugshots.bcgov.net/images/99/21299/24100122493600.jpeg	2024-11-07 22:00:04.71645
12413	HAYNES	GERALD	ANTHONY	154 SEASIDE RD	St Helena Islan, SC 29920	N-Black, Non-Hisp / Male	M	1994-10-27	30	5'11"	160	48752	2024-08-12	16:19:00	2024-08-13	12:20:00	http://mugshots.bcgov.net/images/67/47367/24110205385300.jpeg	2024-11-07 22:00:04.718316
12414	HAYNES	GERALD	ANTHONY	154 SEASIDE RD	St Helena Islan, SC 29920	N-Black, Non-Hisp / Male	M	1994-10-27	30	5'11"	160	49751	2024-11-02	05:31:00	2024-11-02	12:41:00	http://mugshots.bcgov.net/images/67/47367/24110205385300.jpeg	2024-11-07 22:00:04.720311
12415	HEATON	JOSHUA	JAMES	1 SHELTER COVE LN	HILTON HEAD, SC 29928	N-White, Non-Hisp / Male	M	1980-04-08	44	5'10"	185	49256	2024-09-21	20:17:00	2024-09-22	13:30:00	http://mugshots.bcgov.net/images/24/124424/24092120092300.jpeg	2024-11-07 22:00:04.722665
12416	HECKSHER	CHARLES	GLENDON	311 PALOMINO DR	Beaufort, SC 29906	N-White, Non-Hisp / Male	M	1982-09-16	42	6'00"	200	48733	2024-08-11	03:53:00	2024-08-11	10:41:00	http://mugshots.bcgov.net/images/12/137112/22051223023800.jpeg	2024-11-07 22:00:04.72421
12417	HENRY	LESLIE	LIVINGSTON	5916 PLEASANT FARM DR; PLEASANT FARM	BEAUFORT, SC 29906 9422	N-Black, Non-Hisp / Male	M	1975-12-15	48	5'11"	205	49237	2024-09-20	17:40:00	2024-09-23	14:41:00	http://mugshots.bcgov.net/images/46/29246/24092017553700.jpeg	2024-11-07 22:00:04.726521
12418	HENRY	SHANE	MATTHEW	139 COUNTY SHED RD	Burton, SC 29906	N-White, Non-Hisp / Male	M	1979-09-17	45	6'02"	200	49493	2024-10-09	14:14:00	2024-10-10	09:17:00	http://mugshots.bcgov.net/images/33/319733/24100914212000.jpeg	2024-11-07 22:00:04.728145
12419	HERNANDEZ	ADILSON	ANIBAL	897 FORDING ISLAND RD #2001	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	1985-09-05	39	5'08"	175	49414	2024-10-02	15:28:00	2024-10-03	14:38:00	http://mugshots.bcgov.net/images/90/331490/24100215413000.jpeg	2024-11-07 22:00:04.730159
12420	HERNANDEZ	FLOREZ		7043 HALE DR; SHELL POINT	Shell Point, SC 29906	H-White/Latin, Hispanic / Male	M	1999-05-01	25	5'09"	220	49563	2024-10-15	13:43:00	2024-10-16	18:15:00	http://mugshots.bcgov.net/images/91/385091/24101518291300.jpeg	2024-11-07 22:00:04.732676
12421	HERNANDEZ	HECTOR	ROSALINO	450 PARRIS ISLAND GATEWAY	BEAUFORT, SC 29906	H-White/Latin, Hispanic / Male	M	2002-01-03	22	6'00"	200	49260	2024-09-21	22:26:00	\N	\N	http://mugshots.bcgov.net/images/54/318554/	2024-11-07 22:00:04.734639
12422	HERNANDEZ	JASON	JAVIER	37 PINE FOREST DR	BLUFFTON, SC 29910 4013	H-White/Latin, Hispanic / Male	M	2000-09-10	24	5'11"	170	49085	2024-09-08	04:55:00	2024-09-09	11:01:00	http://mugshots.bcgov.net/images/38/25038/24090805091900.jpeg	2024-11-07 22:00:04.736262
12423	HERNANDEZ	MICHAEL	ADAM	14 SHERWOOD LN; TELFAIR	Ladys Island, SC 29907	H-White/Latin, Hispanic / Male	M	1978-07-10	46	6'00"	240	49120	2024-09-11	00:56:00	2024-09-11	10:59:00	http://mugshots.bcgov.net/images/13/1013/24091100575700.jpeg	2024-11-07 22:00:04.738944
12424	HERNANDEZ HERNANDEZ	SANTOS BERNARDINO		423 OLD MEADOW RD; OLDFIELD MEWS	Okatie, SC 29909	H-White/Latin, Hispanic / Male	M	1986-05-20	38	5'03"	195	49667	2024-10-25	21:52:00	2024-10-28	09:05:00	http://mugshots.bcgov.net/images/82/306182/24102522012000.jpeg	2024-11-07 22:00:04.740647
12425	HERNANDEZ REYES	SIMON		361 COUNTY SHED RD; TOWN AND COUNTRY MHP; TOWN & COUNTRY	Burton, SC 29906	H-White/Latin, Hispanic / Male	M	1989-03-27	35	5'07"	200	49581	2024-10-17	04:06:00	\N	\N	http://mugshots.bcgov.net/images/51/316351/24101704203700.jpeg	2024-11-07 22:00:04.743409
12426	HERNANDEZ-BERDUO	ABIMAEL	ELDIBERTO	HOMELESS	Hilton Head Isl, SC 29926	H-White/Latin, Hispanic / Male	M	1994-03-09	30	5'04"	120	49770	2024-11-04	02:22:00	2024-11-04	09:58:00	http://mugshots.bcgov.net/images/80/386880/24110402331800.jpeg	2024-11-07 22:00:04.746305
12427	HERNANDEZ-HERNANDEZ	JUAN		101 WOODHAVEN DR	Hilton Head Isl, SC 29928	H-Black, Hispanic / Male	M	1983-12-27	40	6'00"	190	49586	2024-10-17	21:25:00	\N	\N	http://mugshots.bcgov.net/images/06/104606/24101800324000.jpeg	2024-11-07 22:00:04.748386
12428	HERNANDEZ-ROMERO	LUIS	BROCK	4708 S MOSS CREEK CIRC	MURRAY, UT 84107	H-White/Latin, Hispanic / Male	M	2002-07-15	22	5'09"	208	49306	2024-09-25	04:12:00	2024-09-25	10:08:00	http://mugshots.bcgov.net/images/19/325819/24092504192200.jpeg	2024-11-07 22:00:04.752132
12429	HERNTON	CLARISSA	BERNADETTE	600 PRESERVE AVE E; PRESERVE @ PORT ROYA	Twn Port Royal, SC	N-Black, Non-Hisp / Female	F	1976-02-10	48	5'06"	236	49806	2024-11-07	15:20:00	\N	\N	http://mugshots.bcgov.net/images/40/32740/24110715341600.jpeg	2024-11-07 22:00:04.754112
12430	HERRITT	TYLER	JOHN	HOMELESS	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1993-07-02	31	5'08"	150	49438	2024-10-03	22:19:00	2024-10-21	13:51:00	http://mugshots.bcgov.net/images/52/191452/24110423105500.jpeg	2024-11-07 22:00:04.755638
12431	HERRITT	TYLER	JOHN	HOMELESS	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1993-07-02	31	5'08"	150	49780	2024-11-04	22:32:00	2024-11-05	10:13:00	http://mugshots.bcgov.net/images/52/191452/24110423105500.jpeg	2024-11-07 22:00:04.757387
12432	HESS	IAN	MICHAEL	1243 Linden Vue Dr	Canonsburg, PA 15317	N-White, Non-Hisp / Male	M	1999-07-17	25	6'01"	200	48859	2024-08-22	16:21:00	2024-08-23	11:35:00	http://mugshots.bcgov.net/images/51/286351/24082216264500.jpeg	2024-11-07 22:00:04.759548
12433	HEYWARD	KRYSTAL	CIERA	315 SQUIRE POPE RD	Hilton Head Isl, SC 29926	N-Black, Non-Hisp / Female	F	1995-07-18	29	5'00"	120	49245	2024-09-21	04:14:00	\N	\N	http://mugshots.bcgov.net/images/43/23843/24092104193100.jpeg	2024-11-07 22:00:04.761199
12434	HIGGINS	BARRY	BRYAN	68 PINE GROVE RD; PINE GROVE ESTATES	Burton, SC 29906	N-White, Non-Hisp / Male	M	1955-10-24	69	5'05"	130	49738	2024-11-01	20:33:00	2024-11-02	10:53:00	http://mugshots.bcgov.net/images/96/16996/24110120393500.jpeg	2024-11-07 22:00:04.763567
12435	HILL	BRYCE	TYLER	21 IRONGATE DR; IRONGATE	BEAUFORT, SC 29906	N-White, Non-Hisp / Male	M	1992-04-19	32	6'01"	170	48945	2024-08-28	22:52:00	2024-08-29	10:28:00	http://mugshots.bcgov.net/images/49/74349/24102521011300.jpeg	2024-11-07 22:00:04.765136
12436	HILL	BRYCE	TYLER	21 IRONGATE DR; IRONGATE	BEAUFORT, SC 29906	N-White, Non-Hisp / Male	M	1992-04-19	32	6'01"	170	49660	2024-10-25	13:41:00	2024-10-26	12:38:00	http://mugshots.bcgov.net/images/49/74349/24102521011300.jpeg	2024-11-07 22:00:04.767705
12437	HOFT	JUSTIN	D	18 BEACH RD	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1980-08-06	44	6'00"	200	49594	2024-10-18	13:33:00	2024-10-18	16:30:00	http://mugshots.bcgov.net/images/94/63394/24101813560200.jpeg	2024-11-07 22:00:04.769356
12438	HOLLOWAY	JOELETTE	MICHELLE	13 RUE DE BOIS	LADYS ISLAND, SC 29907	N-White, Non-Hisp / Female	F	1985-04-09	39	5'10"	200	49377	2024-09-29	22:48:00	\N	\N	http://mugshots.bcgov.net/images/14/214/24092922541000.jpeg	2024-11-07 22:00:04.770983
12439	HOLMAN	TIFFANY	MONIQUE	446 GREEN PL	RIDGELAND, SC 29936 7724	N-Black, Non-Hisp / Female	F	1985-05-04	39	5'07"	195	49369	2024-09-29	00:34:00	2024-09-30	16:02:00	http://mugshots.bcgov.net/images/67/24767/24092900580900.jpeg	2024-11-07 22:00:04.774121
12440	HOLMES	KA'SHAUN	JAQUAN	526 SEASIDE RD	SAINT HELENA IS, SC 29920	N-Black, Non-Hisp / Male	M	1999-04-10	25	6'04"	275	49500	2024-10-09	21:47:00	2024-10-10	09:21:00	http://mugshots.bcgov.net/images/52/8352/24100921580500.jpeg	2024-11-07 22:00:04.778998
12441	HOOD	PHILLIP	WAYNE	4924 BLUFFTON PKWY # 202; BRIDGEPOINTE CONDOS	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1992-04-28	32	5'07"	160	48974	2024-08-31	09:43:00	2024-09-01	14:27:00	http://mugshots.bcgov.net/images/50/100350/24083109552700.jpeg	2024-11-07 22:00:04.781282
12442	HOOKS	MICHAEL	MACKENZIE	793 DANNER DR; MALIND BLUFF	Okatie, SC 29909	N-White, Non-Hisp / Male	M	1988-05-01	36	6'00"	195	49383	2024-09-30	07:36:00	2024-09-30	10:30:00	http://mugshots.bcgov.net/images/91/380391/24093007451900.jpeg	2024-11-07 22:00:04.786944
12443	HOOVER	JH'LEEL	KANYE	647 COLLEGE PARK CIR; UNIVERSITY PARK	Bluffton, SC 29910	N-Black, Non-Hisp / Male	M	2003-09-04	21	5'10"	140	49712	2024-10-29	13:22:00	2024-11-07	05:23:00	http://mugshots.bcgov.net/images/83/238483/24102913360400.jpeg	2024-11-07 22:00:04.788595
12444	HORAN	HARRY	JOSEPH	5 ORISTA PL; SPANISH WELLS PLANTA	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Male	M	2005-08-11	19	5'10"	165	49505	2024-10-10	11:25:00	2024-10-12	05:32:00	http://mugshots.bcgov.net/images/12/71012/24101011342000.jpeg	2024-11-07 22:00:04.790373
12445	HORNE	YOSHIA	LESUNDRA	1305 TALBIRD RD, APT F4	BEAUFORT, SC 29902	N-Black, Non-Hisp / Female	F	1989-02-08	35	5'10"	220	48732	2024-08-11	01:44:00	2024-08-11	10:44:00	http://mugshots.bcgov.net/images/25/100025/24081101464200.jpeg	2024-11-07 22:00:04.792466
12446	HOUCK	TYLER	DAVID	232 STATION PKWY	BLUFFTON, SC 29910	N-White, Non-Hisp / Male	M	1994-07-08	30	5'01"	160	49568	2024-10-16	02:48:00	2024-10-16	11:00:00	http://mugshots.bcgov.net/images/04/60304/24101602550200.jpeg	2024-11-07 22:00:04.794165
12447	HOUSTON	BARRY	WAYNE	54 PLEASANT POINT DR	BEAUFORT, SC 29902 1101	N-Black, Non-Hisp / Male	M	1970-11-19	53	5'11"	225	49147	2024-09-12	22:29:00	2024-09-13	13:00:00	http://mugshots.bcgov.net/images/60/299560/24091222385300.jpeg	2024-11-07 22:00:04.796328
12448	HOWARD	BRANDAVION		91 OLD WILD HORSE RD	Hilton Head Isl, SC 29928	N-Black, Non-Hisp / Male	M	2007-02-22	17	5'05"	130	48817	2024-08-18	01:14:00	\N	\N	http://mugshots.bcgov.net/images/50/70950/	2024-11-07 22:00:04.798982
12449	HOWARD	CRYSTAL	ELIZABETH	HOMELESS	BEAUFORT, SC 29902	N-Black, Non-Hisp / Female	F	1985-03-07	39	5'08"	140	48962	2024-08-30	16:05:00	2024-08-31	12:23:00	http://mugshots.bcgov.net/images/03/16703/24042016512000.jpeg	2024-11-07 22:00:04.801075
12450	HOWARD	CRYSTAL	ELIZABETH	HOMELESS	BEAUFORT, SC 29902	N-Black, Non-Hisp / Female	F	1985-03-07	39	5'08"	140	49102	2024-09-09	17:09:00	2024-09-11	13:14:00	http://mugshots.bcgov.net/images/03/16703/24042016512000.jpeg	2024-11-07 22:00:04.802628
12451	HOWARD	CRYSTAL	ELIZABETH	HOMELESS	BEAUFORT, SC 29902	N-Black, Non-Hisp / Female	F	1985-03-07	39	5'08"	140	49135	2024-09-11	21:48:00	2024-09-12	11:32:00	http://mugshots.bcgov.net/images/03/16703/24042016512000.jpeg	2024-11-07 22:00:04.804033
12452	HOWARD	CRYSTAL	ELIZABETH	HOMELESS	BEAUFORT, SC 29902	N-Black, Non-Hisp / Female	F	1985-03-07	39	5'08"	140	49314	2024-09-25	15:22:00	2024-09-26	16:22:00	http://mugshots.bcgov.net/images/03/16703/24042016512000.jpeg	2024-11-07 22:00:04.807486
12453	HOWARD	CRYSTAL	ELIZABETH	HOMELESS	BEAUFORT, SC 29902	N-Black, Non-Hisp / Female	F	1985-03-07	39	5'08"	140	49420	2024-10-02	23:16:00	2024-10-24	17:04:00	http://mugshots.bcgov.net/images/03/16703/24042016512000.jpeg	2024-11-07 22:00:04.810561
12454	HOWLAND	AMY	ELIZABETH	35 THREE MAST LN; THREE MAST LANE	Hilton Head Isl, SC 29928	N-White, Non-Hisp / Female	F	1967-03-02	57	5'05"	135	49752	2024-11-02	15:34:00	2024-11-03	10:41:00	http://mugshots.bcgov.net/images/87/239887/24110215421400.jpeg	2024-11-07 22:00:04.812158
12455	HYATT	MELISSA	ANN	30 BIG OAK ST	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Female	F	1978-09-03	46	5'06"	180	49632	2024-10-22	17:24:00	2024-10-23	11:33:00	http://mugshots.bcgov.net/images/66/83166/24102217572400.jpeg	2024-11-07 22:00:04.813684
12456	IGNACIO-BARRAGAN	ABEL		200 1ST STREET	Hardeeville, SC 29927	H-Black, Hispanic / Male	M	1999-02-15	25	5'07"	165	49168	2024-09-14	03:00:00	2024-09-14	13:30:00	http://mugshots.bcgov.net/images/09/381909/24091403214900.jpeg	2024-11-07 22:00:04.816316
12457	IRELAND	MICHAEL	JOSEPH	93 STATION LOOP; LAWTON STATION	Twn of Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1976-09-08	48	6'00"	210	49606	2024-10-19	07:28:00	2024-11-04	15:17:00	http://mugshots.bcgov.net/images/16/385416/24101904551200.png dbTubjbBnmYrjHUlOC1PzyfoL9I=                                 	2024-11-07 22:00:04.818053
12458	IULO	ROBERT	MICHAEL	5 BANK SWALLOW LAGOON; HILTON HEAD PLANTATION	Hilton Head Isl, SC 29926	N-White, Non-Hisp / Male	M	1962-05-31	62	5'11"	210	49200	2024-09-17	06:10:00	2024-09-17	09:40:00	http://mugshots.bcgov.net/images/79/223679/24091706291400.jpeg	2024-11-07 22:00:04.819649
12459	JACKSON	LARON	FRANCIS	325 PLANTATION LN	WALTERBORO, SC 29488 4578	N-Black, Non-Hisp / Male	M	1987-05-01	37	6'01"	187	49789	2024-11-05	15:29:00	2024-11-06	10:20:00	http://mugshots.bcgov.net/images/43/231443/24110517444800.jpeg	2024-11-07 22:00:04.821148
12460	JACKSON	MICHAEL	J	4 FERRY DR; OAKLAND	BEAUFORT, SC 29907 1616	N-White, Non-Hisp / Male	M	1984-02-11	40	6'00"	215	48926	2024-08-27	09:09:00	2024-08-27	15:28:00	http://mugshots.bcgov.net/images/68/159368/24100712405800.jpeg	2024-11-07 22:00:04.823269
12461	JACKSON	MICHAEL	J	4 FERRY DR; OAKLAND	BEAUFORT, SC 29907 1616	N-White, Non-Hisp / Male	M	1984-02-11	40	6'00"	215	49474	2024-10-07	12:09:00	2024-10-07	15:50:00	http://mugshots.bcgov.net/images/68/159368/24100712405800.jpeg	2024-11-07 22:00:04.824939
12462	JACKSON	SAMUEL	THOMAS	11 SOUTHWOOD PARK DR # 73; HILTON HEAD GARDENS	Hilton Head Isl, SC 29926	N-Black, Non-Hisp / Male	M	1986-04-01	38	5'11"	220	49468	2024-10-06	20:23:00	2024-10-11	16:03:00	http://mugshots.bcgov.net/images/15/72015/24100620300000.jpeg	2024-11-07 22:00:04.827509
12463	JACQUES	MAURICE	ANDRE	1830 RIBAUT RD APT 7F	PORT ROYAL, SC 29935 1834	N-Black, Non-Hisp / Male	M	1990-11-07	34	6'03"	275	49259	2024-09-21	22:58:00	2024-09-22	13:57:00	http://mugshots.bcgov.net/images/21/12421/24092123074800.jpeg	2024-11-07 22:00:04.831075
12464	JAMES	ALEXIS	BRYANT	1098 OTTER CIR	BEAUFORT, SC 29902 5864	N-Black, Non-Hisp / Male	M	1985-05-21	39	6'03"	310	49749	2024-11-02	05:15:00	2024-11-02	11:40:00	http://mugshots.bcgov.net/images/26/726/24110205255800.jpeg	2024-11-07 22:00:04.832741
12465	JAMES	DEWALTER	DEVONTE	152 SIMMONSVILLE RD	BLUFFTON, SC 29910	N-Black, Non-Hisp / Male	M	1995-08-12	29	5'08"	200	49254	2024-09-21	11:36:00	\N	\N	http://mugshots.bcgov.net/images/43/67143/21112005112100.jpeg	2024-11-07 22:00:04.834577
12466	JAMES	JAQUAN	DEMONTRE	705 CAL CAUSEWAY RD	TILLMAN, SC 29943	N-Black, Non-Hisp / Male	M	2004-05-15	20	5'09"	174	49397	2024-09-30	20:04:00	2024-10-08	17:14:00	http://mugshots.bcgov.net/images/78/383678/24093020065800.jpeg	2024-11-07 22:00:04.837118
12467	JAMES	JERMEL	VOSHAWN	113 CASTLE ROCK RD	Burton, SC 29906	N-Black, Non-Hisp / Male	M	1984-09-08	40	6'03"	225	49009	2024-09-02	21:52:00	2024-09-03	20:04:00	http://mugshots.bcgov.net/images/40/21040/24090221512100.jpeg	2024-11-07 22:00:04.83904
12468	JAMES	ZLJAHUC	LOGAN	20 ISLAND TANK RD; THE WOODLANDS MHP	Burton, SC 29906	N-Black, Non-Hisp / Male	M	1990-02-12	34	5'10"	180	49655	2024-10-24	20:11:00	2024-10-30	19:53:00	http://mugshots.bcgov.net/images/77/264477/24102420231100.jpeg	2024-11-07 22:00:04.841581
12469	JENKINS	DEVON	JAMAHL	20 DONALDSON CAMP RD	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1996-05-13	28	5'09"	199	49742	2024-11-01	23:29:00	2024-11-02	12:43:00	http://mugshots.bcgov.net/images/98/3198/24110123305200.jpeg	2024-11-07 22:00:04.845693
12470	JENKINS	FRANKLIN		24 PARADISE LN	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1960-05-07	64	5'09"	170	49019	2024-09-03	10:25:00	2024-09-03	16:24:00	http://mugshots.bcgov.net/images/21/12321/24090310414100.jpeg	2024-11-07 22:00:04.848813
12471	JENKINS	JUQUETTA		4 FAWNWOOD LN # B	Seabrook, SC 29940	N-Black, Non-Hisp / Female	F	1971-03-07	53	5'05"	154	48781	2024-08-16	11:48:00	2024-08-17	12:48:00	http://mugshots.bcgov.net/images/85/340085/24081611543100.jpeg	2024-11-07 22:00:04.850217
12472	JENNETTE	TAREY	OMARIQUE	806 ELIZABETH LN	BEAUFORT, SC 29902 6608	N-Black, Non-Hisp / Male	M	1997-05-28	27	6'00"	187	49522	2024-10-11	22:06:00	\N	\N	http://mugshots.bcgov.net/images/20/77920/	2024-11-07 22:00:04.85195
12473	JENSEN	BRODIE	MARK	1 BRADFORD CT; PICKET FENCES	Twn Port Royal, SC 29902	N-White, Non-Hisp / Male	M	1970-03-18	54	5'10"	240	48916	2024-08-26	16:22:00	2024-08-27	08:56:00	http://mugshots.bcgov.net/images/65/348965/24082616241700.jpeg	2024-11-07 22:00:04.85327
12474	JESSIE	ADAM	WAYNE	68 SAGO PALM DR; PALMETTO POINT	BLUFFTON, SC 29910 9502	N-White, Non-Hisp / Male	M	2002-09-06	22	5'10"	180	49137	2024-09-12	02:03:00	2024-09-12	10:24:00	http://mugshots.bcgov.net/images/30/340230/24110522483300.jpeg	2024-11-07 22:00:04.854666
12475	JESSIE	ADAM	WAYNE	68 SAGO PALM DR; PALMETTO POINT	BLUFFTON, SC 29910 9502	N-White, Non-Hisp / Male	M	2002-09-06	22	5'10"	180	49792	2024-11-05	22:39:00	2024-11-06	09:56:00	http://mugshots.bcgov.net/images/30/340230/24110522483300.jpeg	2024-11-07 22:00:04.856922
12476	JILES	JEROME	EUGENE	1301 CONGRESS ST	BEAUFORT, SC 29902	N-Black, Non-Hisp / Male	M	1973-07-06	51	5'05"	165	48730	2024-08-11	02:16:00	2024-08-11	11:02:00	http://mugshots.bcgov.net/images/20/38020/24081102452700.jpeg	2024-11-07 22:00:04.858788
12477	JIMENEZ	ALEXIS		260 CHERRY POINT RD N	Okatie, SC 29909	H-White/Latin, Hispanic / Male	M	2000-02-26	24	5'10"	150	49201	2024-09-17	07:36:00	\N	\N	http://mugshots.bcgov.net/images/66/379266/24091707401700.jpeg	2024-11-07 22:00:04.860275
12478	JIMENEZ JIMENEZ	JUAN		5842 S OKATIE HWY	OKATIE, SC 29927	H-White/Latin, Hispanic / Male	M	1993-02-08	31	5'04"	146	49160	2024-09-13	22:38:00	2024-09-14	13:23:00	http://mugshots.bcgov.net/images/38/366738/24091322501400.jpeg	2024-11-07 22:00:04.862507
12479	JIMENEZ SERRANO	MAX	ARMANDO	33 JAMES O CT; VERDIER VIEW	BLUFFTON, SC 29910 6734	H-White/Latin, Hispanic / Male	M	2005-11-03	19	5'10"	198	49588	2024-10-17	20:21:00	\N	\N	http://mugshots.bcgov.net/images/59/270759/	2024-11-07 22:00:04.863833
12480	JIMENEZ-CORONADO	OSCAR		44 BENTON LN	BLUFFTON, SC 29910 6602	H-White/Latin, Hispanic / Male	M	1998-02-19	26	5'06"	135	49593	2024-10-18	09:48:00	\N	\N	http://mugshots.bcgov.net/images/60/13460/24101809581600.jpeg	2024-11-07 22:00:04.865391
12481	JOHNS	TANISHA	SHAVESS	37 FAMILY LANE	ST HELENA ISLAN, SC 29920	N-Black, Non-Hisp / Female	F	1996-04-02	28	5'04"	120	48787	2024-08-16	19:52:00	2024-08-17	11:14:00	http://mugshots.bcgov.net/images/47/87647/24081620054500.jpeg	2024-11-07 22:00:04.869613
12482	JOHNSON	CLINISE	BERNICE	4921 BLUFFTON PKWY # 1014; THE BLUESTONE	Bluffton, SC 29910	N-Black, Non-Hisp / Female	F	1981-06-09	43	5'10"	180	49732	2024-11-01	04:25:00	2024-11-01	10:49:00	http://mugshots.bcgov.net/images/31/312731/24110104461500.jpeg	2024-11-07 22:00:04.87143
12483	JOHNSON	DA'QUAN	VASHON	321A SQUIRE POPE RD	HILTON HEAD, SC 29926	N-Black, Non-Hisp / Male	M	1994-10-06	30	6'03"	171	49560	2024-10-15	07:53:00	2024-10-15	10:17:00	http://mugshots.bcgov.net/images/19/71119/24101507531800.jpeg	2024-11-07 22:00:04.873169
12484	JOHNSON	DAKOTA	JAMES	104 CORDILLO PKWY # B2; HEDGES	Hilton Head Isl, SC 29928	N-White, Non-Hisp / Male	M	1998-01-28	26	5'11"	180	48921	2024-08-26	21:34:00	2024-09-07	12:33:00	http://mugshots.bcgov.net/images/71/35471/24082621274500.jpeg	2024-11-07 22:00:04.875092
12485	JOHNSON	DAVID	QUINCY	5 MARLEY DR	BEAUFORT, SC 29906 7914	N-White, Non-Hisp / Male	M	1994-11-30	29	5'11"	190	49599	2024-10-18	19:40:00	2024-10-19	10:19:00	http://mugshots.bcgov.net/images/78/3178/24101820090600.jpeg	2024-11-07 22:00:04.877461
12486	JOHNSON	DEA'RONTIA	RAYVON	31 SAXONVILLE RD	SAINT HELENA IS, SC 29920 6214	N-Black, Non-Hisp / Male	M	1992-09-27	32	5'11"	350	49682	2024-10-26	19:33:00	2024-10-27	10:21:00	http://mugshots.bcgov.net/images/61/5361/24102619403600.jpeg	2024-11-07 22:00:04.87895
12487	JOHNSON	GARRET	MATHEW	25 GRANDE OAKS DR; GRANDE OAKS	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1999-08-17	25	5'10"	190	49419	2024-10-02	23:10:00	2024-10-03	12:51:00	http://mugshots.bcgov.net/images/11/159111/24100304071900.jpeg	2024-11-07 22:00:04.880466
12488	JOHNSON	JAHEEM	MALIK	21 ZENOBIA LANE	YEMASSEE, SC 29945	N-Black, Non-Hisp / Male	M	2006-06-12	18	5'08"	158	49204	2024-09-17	17:44:00	2024-09-18	09:22:00	http://mugshots.bcgov.net/images/80/65680/24091718120300.jpeg	2024-11-07 22:00:04.882106
12489	JOHNSON	JAKHI	JOEL	322 SHANKLIN RD	Beaufort, SC 29906	N-Black, Non-Hisp / Male	M	2006-01-18	18	6'00"	130	49303	2024-09-25	00:43:00	2024-10-29	09:35:00	http://mugshots.bcgov.net/images/14/185814/24092500580500.jpeg	2024-11-07 22:00:04.883818
12490	JOHNSON	JULIAN	JOHN	32 JESSICA DR	HILTON HEAD, SC 29926	N-Black, Non-Hisp / Male	M	1972-09-16	52	5'08"	150	49734	2024-11-01	11:11:00	2024-11-02	12:37:00	http://mugshots.bcgov.net/images/52/89552/24110413520400.jpeg	2024-11-07 22:00:04.886424
12491	JOHNSON	JULIAN	JOHN	32 JESSICA DR	HILTON HEAD, SC 29926	N-Black, Non-Hisp / Male	M	1972-09-16	52	5'08"	150	49773	2024-11-04	13:50:00	\N	\N	http://mugshots.bcgov.net/images/52/89552/24110413520400.jpeg	2024-11-07 22:00:04.88813
12492	JOHNSON	KENDEL	DEION	46 MELODY LN	SAINT HELENA IS, SC 29920 5301	N-Black, Non-Hisp / Male	M	1993-02-08	31	6'01"	175	48720	2024-08-10	01:09:00	2024-08-10	11:04:00	http://mugshots.bcgov.net/images/23/27823/24081002024600.jpeg	2024-11-07 22:00:04.889784
12493	JOHNSON	KENNETH		904 SILK HOPE LANE	SMOAKS, SC 29481	N-Black, Non-Hisp / Male	M	1969-10-24	55	6'03"	0	49211	2024-09-18	11:47:00	2024-09-18	14:44:00	http://mugshots.bcgov.net/images/61/382361/24101016031000.jpeg	2024-11-07 22:00:04.892185
12494	JOHNSON	KENNETH		904 SILK HOPE LANE	SMOAKS, SC 29481	N-Black, Non-Hisp / Male	M	1969-10-24	55	6'03"	0	49508	2024-10-10	15:41:00	2024-10-22	11:40:00	http://mugshots.bcgov.net/images/61/382361/24101016031000.jpeg	2024-11-07 22:00:04.893868
12495	JOHNSON	MARCUS	JAMEL	642 HENRY LAWTON RD	RIDGELAND, SC 29936	N-Black, Non-Hisp / Male	M	1988-04-10	36	6'00"	246	48946	2024-08-29	01:52:00	2024-08-29	11:05:00	http://mugshots.bcgov.net/images/38/52538/24082901575000.jpeg	2024-11-07 22:00:04.895207
12496	JOHNSON	MCKINLEY	CLAY	9 DUEY HILL DR	Hilton Head Isl, SC 29926	N-Black, Non-Hisp / Male	M	1988-02-16	36	5'10"	160	49715	2024-10-29	16:25:00	2024-11-04	05:02:00	http://mugshots.bcgov.net/images/05/159605/24102917484800.jpeg	2024-11-07 22:00:04.897382
12497	JOHNSON	MEGHAN	NICOLE	40 DAVIS LOVE DR; FRIPP ISLAND	FRIPP ISLAND, SC 29920 7057	N-White, Non-Hisp / Female	F	1983-02-26	41	5'11"	180	49689	2024-10-27	04:51:00	2024-10-27	10:38:00	http://mugshots.bcgov.net/images/86/190986/24102705121400.jpeg	2024-11-07 22:00:04.899675
12498	JOHNSON	NICHOLAS	QUENTIN	1005 HODGE DR	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1984-04-09	40	6'00"	200	49692	2024-10-27	12:15:00	\N	\N	http://mugshots.bcgov.net/images/70/126170/17093004394300.jpg Gr2jUoNyZ0oF96nJup6pIAlTL0c=                                 	2024-11-07 22:00:04.90131
12499	JONES	DJUAN	MONTAVIOUS	HOMELESS	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1998-09-01	26	6'01"	222	48821	2024-08-19	03:47:00	2024-08-19	09:25:00	http://mugshots.bcgov.net/images/65/128565/24091607540000.jpeg	2024-11-07 22:00:04.903145
12500	JONES	DJUAN	MONTAVIOUS	HOMELESS	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1998-09-01	26	6'01"	222	49165	2024-09-14	01:39:00	2024-09-14	08:54:00	http://mugshots.bcgov.net/images/65/128565/24091607540000.jpeg	2024-11-07 22:00:04.904662
12501	JONES	DJUAN	MONTAVIOUS	HOMELESS	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1998-09-01	26	6'01"	222	49191	2024-09-15	23:36:00	2024-09-26	14:23:00	http://mugshots.bcgov.net/images/65/128565/24091607540000.jpeg	2024-11-07 22:00:04.906348
12502	JONES	DJUAN	MONTAVIOUS	HOMELESS	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1998-09-01	26	6'01"	222	49343	2024-09-26	18:15:00	2024-09-27	14:19:00	http://mugshots.bcgov.net/images/65/128565/24091607540000.jpeg	2024-11-07 22:00:04.908159
12503	JONES	DJUAN	MONTAVIOUS	HOMELESS	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1998-09-01	26	6'01"	222	49357	2024-09-28	05:47:00	2024-09-28	14:28:00	http://mugshots.bcgov.net/images/65/128565/24091607540000.jpeg	2024-11-07 22:00:04.911054
12504	JONES	DJUAN	MONTAVIOUS	HOMELESS	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1998-09-01	26	6'01"	222	49378	2024-09-29	21:12:00	\N	\N	http://mugshots.bcgov.net/images/65/128565/24091607540000.jpeg	2024-11-07 22:00:04.912471
12505	JONES	RODERICK	DERRELL	7 BLUEBELL LN	HILTON HEAD, SC 29926 1417	N-Black, Non-Hisp / Male	M	1969-03-04	55	5'07"	205	49060	2024-09-06	13:46:00	2024-09-18	21:07:00	http://mugshots.bcgov.net/images/75/98775/24090613540000.jpeg	2024-11-07 22:00:04.9149
12506	JONES	ROSETTA	YOLANDA	489 BROAD RIVER BLVD	Beaufort, SC 29906 9491	N-Black, Non-Hisp / Female	F	1980-09-28	44	5'09"	275	49509	2024-10-10	17:04:00	2024-10-11	10:25:00	http://mugshots.bcgov.net/images/27/37027/24101016445700.jpeg	2024-11-07 22:00:04.916899
12507	JONTE	JUSTIN	S	1321 GRATIS RD NW	MONROE, GA 30656 4829	N-White, Non-Hisp / Male	M	1995-04-15	29	5'05"	185	48773	2024-08-14	20:23:00	\N	\N	http://mugshots.bcgov.net/images/41/378741/24081500015800.png d3M7t6yvjOw00Q0DwwFEI1ImwJY=                                 	2024-11-07 22:00:04.918653
12508	JORDAN	JAYLEN	DEWAYNE	18 BRENDAN LN	Twn of Bluffton, SC	N-Black, Non-Hisp / Male	M	2007-07-30	17	5'10"	150	48818	2024-08-18	01:14:00	\N	\N	http://mugshots.bcgov.net/images/96/148396/	2024-11-07 22:00:04.920251
12509	JUAREZ CONTRERAS	JULIO CESAR	C	40 GUMTREE ROAD	HILTON HEAD ISL, SC 29926	H-White/Latin, Hispanic / Male	M	1992-01-06	32	5'11"	185	49463	2024-10-06	07:58:00	2024-10-07	08:18:00	http://mugshots.bcgov.net/images/66/279866/24100607593700.jpeg	2024-11-07 22:00:04.921848
12510	JURJANS	JEFFERSON	KARL	40 FOLLY FIELD RD #E2	HILTON HEAD, SC 29928	N-White, Non-Hisp / Male	M	2005-07-06	19	6'00"	180	49519	2024-10-11	14:54:00	\N	\N	http://mugshots.bcgov.net/images/54/165154/24071211540400.jpeg	2024-11-07 22:00:04.924107
12511	JUST	ANDREW	JAREK	890 MAGNOLIA BLUFF CIR; MAGNOLIA BLUFF	Shell Point, SC 29902	N-White, Non-Hisp / Male	M	1986-01-09	38	6'00"	170	48813	2024-08-18	14:43:00	2024-08-19	16:56:00	http://mugshots.bcgov.net/images/21/379021/24081814364700.jpeg	2024-11-07 22:00:04.926127
12512	KASPER-LITTLE	NATHANIEL	JOSEPH	117 WINSOR RD	BEAUFORT, SC 29906 6235	N-White, Non-Hisp / Male	M	1994-06-20	30	5'07"	140	48751	2024-08-12	15:25:00	2024-08-13	13:55:00	http://mugshots.bcgov.net/images/18/44018/24081314240100.jpeg	2024-11-07 22:00:04.927832
12513	KEARNS	KENYON	PAUL	79 GRANTHAM LANE	PINELAND, SC 29934	N-White, Non-Hisp / Male	M	1984-04-30	40	5'11"	160	48871	2024-08-23	07:25:00	2024-11-07	05:24:00	http://mugshots.bcgov.net/images/23/52223/24082307321000.jpeg	2024-11-07 22:00:04.929283
12514	KELLY	GENEVE	SPALDING	200 FORT HOWELL DR.	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Female	F	1982-12-23	41	5'04"	120	49652	2024-10-24	21:41:00	2024-10-25	11:58:00	http://mugshots.bcgov.net/images/58/299358/24102421474000.jpeg	2024-11-07 22:00:04.930876
12515	KICKLIGHTER	RICHARD	LLOYD	1 PADDINGTON LN; OLDE TOWNE VILLAGE	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1990-05-02	34	5'08"	145	49292	2024-09-24	08:02:00	2024-09-24	10:05:00	http://mugshots.bcgov.net/images/48/300748/24092408181800.jpeg	2024-11-07 22:00:04.933059
12516	KIRKLAND	DUSTIN	LEE	11 SOUTHWOOD PARK DR UNIT 69	HILTON HEAD, SC 29926	N-Black, Non-Hisp / Male	M	2000-08-06	24	6'00"	156	48747	2024-08-12	02:15:00	2024-08-12	11:20:00	http://mugshots.bcgov.net/images/13/68013/24081203230800.jpeg	2024-11-07 22:00:04.934545
12517	KIRKLAND	KENYATA	MARCELL	142 WILLIAM HILTON PKWY	HILTON HEAD, SC 29926 1593	N-Black, Non-Hisp / Male	M	1977-03-01	47	6'03"	175	48759	2024-08-13	23:00:00	2024-08-15	12:06:00	http://mugshots.bcgov.net/images/12/24512/24081323031500.jpeg	2024-11-07 22:00:04.938978
12518	KITTS	RANDALL	CHASE	HOMELESS	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1991-06-08	33	5'03"	130	49733	2024-11-01	03:39:00	2024-11-01	14:34:00	http://mugshots.bcgov.net/images/97/18497/24110103445400.jpeg	2024-11-07 22:00:04.94126
12519	KLEIN	KIRA	ANNE	2 NAPLES LN	POOLER, GA 16301	N-White, Non-Hisp / Female	F	2000-02-22	24	5'07"	200	48763	2024-08-13	22:30:00	2024-09-04	13:08:00	http://mugshots.bcgov.net/images/45/378645/24081322503800.jpeg	2024-11-07 22:00:04.943371
12520	KNIGHT	D'KENDRICK	JAMILE	241 BUCK ISLAND RD	BLUFFTON, SC 29910 5931	N-Black, Non-Hisp / Male	M	2000-06-28	24	6'02"	180	49290	2024-09-24	02:46:00	2024-09-24	10:59:00	http://mugshots.bcgov.net/images/35/38735/24092402554500.jpeg	2024-11-07 22:00:04.94553
12521	KOGER	DEANNA	MARIE	7 BATTERY LN; PARRIS ISLAND CONDO	BEAUFORT, SC 29902 6943	N-White, Non-Hisp / Female	F	1991-09-08	33	5'01"	130	48795	2024-08-17	05:04:00	2024-08-17	11:20:00	http://mugshots.bcgov.net/images/88/81588/24081705480600.jpeg	2024-11-07 22:00:04.947032
12522	KORNELUK	NICHOLAS	A	8 VICTORIA SQUARE DR; Victoria Square	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Male	M	2007-02-15	17	6'00"	170	49221	2024-09-19	10:49:00	\N	\N	http://mugshots.bcgov.net/images/86/348386/	2024-11-07 22:00:04.948726
12523	LABORDE LOPEZ	IMANOL		50 MARSHLAND RD APT 12	HILTON HEAD ISL, SC 29926 2319	H-White/Latin, Hispanic / Male	M	2001-02-06	23	5'09"	190	48791	2024-08-17	01:33:00	2024-08-17	12:51:00	http://mugshots.bcgov.net/images/56/185656/24081701442000.jpeg	2024-11-07 22:00:04.950401
12524	LANDRY	DYLAN	HUNTER	5615 WALKER CIR; COLONIAL HEIGHTS	Burton, SC 29906	N-White, Non-Hisp / Male	M	1998-10-13	26	5'08"	175	49096	2024-09-09	07:14:00	2024-09-09	14:50:00	http://mugshots.bcgov.net/images/56/15356/24090907271500.jpeg	2024-11-07 22:00:04.952967
12525	LANGFORD	CASEY	ELIZABETH	104 Hillside	Rincon, GA 31326	N-White, Non-Hisp / Female	F	1991-11-11	32	5'06"	150	49244	2024-09-21	01:13:00	2024-09-21	12:04:00	http://mugshots.bcgov.net/images/66/193166/24092101272900.jpeg	2024-11-07 22:00:04.954726
12526	LASSITER	KELLY	GRIFFIN	11 PARKLANDS DR UNIT 8	BLUFFTON, SC 29910 5177	N-White, Non-Hisp / Female	F	1978-02-10	46	5'08"	220	49373	2024-09-29	13:03:00	2024-09-30	10:27:00	http://mugshots.bcgov.net/images/83/199383/24092913492800.jpeg	2024-11-07 22:00:04.956204
12527	LAUDER	JOSHUA	ROBERT	11211 N BLACK CANYON RD	PHOENIX, AZ 85029	N-White, Non-Hisp / Male	M	1993-07-11	31	5'09"	150	48739	2024-08-11	15:40:00	2024-08-12	13:35:00	http://mugshots.bcgov.net/images/83/355583/24081116103900.jpeg	2024-11-07 22:00:04.957766
12528	LAUTH	MICHAEL	ETHAN ROME	50 CEDAR CREEK CIR; SHADOW MOSS	BEAUFORT, SC 29906 3000	N-White, Non-Hisp / Male	M	2002-03-29	22	5'08"	110	49614	2024-10-20	01:39:00	2024-10-20	11:31:00	http://mugshots.bcgov.net/images/56/72456/24102001470900.jpeg	2024-11-07 22:00:04.960147
12529	LAWSON	ALENA	KATHRYN	9 HAWTHORNE CT; OLD CAROLINA	Bluffton, SC 29910	N-White, Non-Hisp / Female	F	1990-03-29	34	5'06"	160	49766	2024-11-03	20:50:00	2024-11-04	12:26:00	http://mugshots.bcgov.net/images/76/386876/24110320551700.jpeg	2024-11-07 22:00:04.961744
12530	LAWSON	RICHARD	ERWIN	196 SHANKLIN RD	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1987-03-28	37	5'07"	135	49291	2024-09-24	04:34:00	2024-09-28	14:21:00	http://mugshots.bcgov.net/images/52/37552/24092404162800.jpeg	2024-11-07 22:00:04.964418
12531	LAWYER	WARREN	SAVON	8 CORNER LOOP	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1994-04-07	30	6'02"	265	49362	2024-09-28	07:54:00	\N	\N	http://mugshots.bcgov.net/images/53/6453/17072417033400.jpeg	2024-11-07 22:00:04.965969
12532	LEE	PARKER	THOMAS	112 UNION CEMETERY UNIT 117	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Male	M	1993-11-19	30	5'10"	170	48845	2024-08-21	21:02:00	2024-08-23	12:46:00	http://mugshots.bcgov.net/images/11/277911/24082121191500.jpeg	2024-11-07 22:00:04.967437
12533	LEMMON	TEDD	ALAN	12 ROYAL START DR	LADYS ISLAND, SC 29907	N-White, Non-Hisp / Male	M	1958-05-25	66	5'10"	212	49575	2024-10-16	16:56:00	2024-10-17	10:35:00	http://mugshots.bcgov.net/images/98/385198/24101617265700.jpeg	2024-11-07 22:00:04.968961
12534	LEWIS	CARRIE	JO	100 STUART TOWNE LN; STUART TOWNE	Twn Port Royal, SC 29935	N-White, Non-Hisp / Female	F	1981-06-11	43	5'07"	204	49748	2024-11-02	02:45:00	2024-11-02	10:04:00	http://mugshots.bcgov.net/images/24/111424/24110202573600.jpeg	2024-11-07 22:00:04.970466
12535	LEWIS	DEREK	ANDREW	2825 KINGS RD	ST AUGUSTINE, FL 32086	N-White, Non-Hisp / Male	M	1986-06-07	38	6'00"	160	49490	2024-10-09	05:43:00	2024-10-14	12:16:00	http://mugshots.bcgov.net/images/32/384532/24100905581800.jpeg	2024-11-07 22:00:04.973241
12536	LEWIS	OMAR	FITZGERALD	8 SOUTHWOOD PARK DR # 174; SANDALWOOD TERRACE	Hilton Head Isl, SC 29926	N-Black, Non-Hisp / Male	M	1985-11-28	38	6'01"	190	49709	2024-10-29	11:26:00	\N	\N	http://mugshots.bcgov.net/images/34/18034/24103023334800.jpeg	2024-11-07 22:00:04.97576
12537	LIOU	SHADIA	SE-CHU	2412 WADDELL RD	PORT ROYAL, SC 29935 1353	N-Asian/Pacific Islander, Non- / Female	F	1985-12-16	38	4'11"	103	48828	2024-08-19	16:19:00	2024-08-20	10:03:00	http://mugshots.bcgov.net/images/19/379119/24081916282300.jpeg	2024-11-07 22:00:04.978053
12538	LIPSEY	MY'LASIA	NIGERIA	24 SCARBOROUGH ST	SAVANNAH, GA 314056546	N-Black, Non-Hisp / Female	F	2000-04-02	24	5'06"	145	49774	2024-11-04	15:40:00	2024-11-05	10:11:00	http://mugshots.bcgov.net/images/52/384352/24110416382700.jpeg	2024-11-07 22:00:04.979546
12539	LISENBY	ROBERT	DANIEL	65 SKY EXCHANGE DR APT	ASHEVILLE, NC 28803 0392	N-White, Non-Hisp / Male	M	1987-10-22	37	6'00"	300	49615	2024-10-20	03:51:00	2024-10-20	13:15:00	http://mugshots.bcgov.net/images/41/385441/24102003533300.jpeg	2024-11-07 22:00:04.981195
12540	LITTLE	WARREN	BERRY	13 S CAMPUS DR; USCB Bluffton Campus	OKATIE, SC 29909	N-White, Non-Hisp / Male	M	2003-05-10	21	5'11"	180	49181	2024-09-15	01:48:00	2024-09-15	10:40:00	http://mugshots.bcgov.net/images/62/381962/24091501573100.jpeg	2024-11-07 22:00:04.98312
12541	LONGORIA LONGORIA	ROBERTO	RIBELINO	100 MATHEWS DR APT 29	Hilton Head Isl, SC 29926	H-White/Latin, Hispanic / Male	M	1977-10-28	47	5'09"	180	49472	2024-10-07	04:49:00	2024-10-08	14:59:00	http://mugshots.bcgov.net/images/98/384298/24100704551000.jpeg	2024-11-07 22:00:04.984688
12542	LOPEZ	CARMINA	SHECCID	662 SUMMERLAKE CIR APT 201	RIDGELAND, SC 29936	H-White/Latin, Hispanic / Female	F	1998-02-05	26	5'03"	140	49198	2024-09-17	00:04:00	2024-09-17	09:44:00	http://mugshots.bcgov.net/images/29/5529/24091700151800.jpeg	2024-11-07 22:00:04.987038
12543	LOPEZ	CHRISTIAN	JOAN	32 OLD SOUTH CT APT G	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	2001-09-17	23	5'03"	175	49559	2024-10-15	00:17:00	2024-10-16	17:43:00	http://mugshots.bcgov.net/images/30/23630/24101500012800.jpeg	2024-11-07 22:00:04.988608
12544	LOPEZ	JAIR			,	H-White/Latin, Hispanic / Male	M	2001-01-19	23	5'08"	154	49320	2024-09-25	17:33:00	2024-10-08	12:57:00	http://mugshots.bcgov.net/images/72/383272/24092517345200.jpeg	2024-11-07 22:00:04.990961
12545	LOPEZ	ROBERT	ENRIQUE	128 KNIGHTSBRIDGE RD; WOOD BRIDGE	Bluffton, SC 29910	H-White/Latin, Hispanic / Male	M	2000-08-08	24	5'11"	190	49355	2024-09-28	04:25:00	2024-09-28	12:18:00	http://mugshots.bcgov.net/images/94/102194/24092804363700.jpeg	2024-11-07 22:00:04.993148
12546	LOPEZ GARCIA	JORGE	IVAN	1 CAPE JASMIN	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	2003-06-06	21	5'07"	160	48832	2024-08-20	00:48:00	2024-08-20	18:15:00	http://mugshots.bcgov.net/images/84/379184/24082001021000.jpeg	2024-11-07 22:00:04.994791
12547	LOPEZ GUTIERREZ	ANIVAL	SALVADOR	450 PARRIS ISLAND GTWY	Twn Port Royal, SC 29906	H-White/Latin, Hispanic / Male	M	1973-11-02	51	5'04"	200	48966	2024-08-31	00:03:00	2024-08-31	12:39:00	http://mugshots.bcgov.net/images/92/380492/24083100333500.jpeg	2024-11-07 22:00:04.997178
12548	LOPEZ LOPEZ	LENIN		699 FARM LAKE DR; THE FARM @ BUCKWALTE	Bluffton, SC 29910	H-White/Latin, Hispanic / Male	M	1986-10-05	38	5'02"	180	49252	2024-09-21	05:50:00	2024-09-22	09:55:00	http://mugshots.bcgov.net/images/02/382702/24092105580900.jpeg	2024-11-07 22:00:04.999879
12549	LOPEZ RODRIGUEZ	ISMAEL		450 PARRIS ISLAND GTWY LOT 13	BEAUFORT, SC 29906	H-White/Latin, Hispanic / Male	M	1994-06-17	30	5'02"	130	49251	2024-09-21	02:17:00	\N	\N	http://mugshots.bcgov.net/images/55/263155/20090702120400.jpeg	2024-11-07 22:00:05.001986
12550	LOPEZ RODRIGUEZ	ISMAEL		450 PARRIS ISLAND GTWY LOT 13	BEAUFORT, SC 29906	H-White/Latin, Hispanic / Male	M	1994-06-17	30	5'02"	130	49250	2024-09-21	04:07:00	2024-09-21	12:27:00	http://mugshots.bcgov.net/images/55/263155/20090702120400.jpeg	2024-11-07 22:00:05.00397
12551	LOPEZ-PEREZ	GUSTAVO		201 MARSHLAND RD # 23; ROLLERS TRAILER PARK	Hilton Head Isl, SC 29926	H-White/Latin, Hispanic / Male	M	2003-03-20	21	5'04"	154	48870	2024-08-23	04:01:00	2024-08-23	16:41:00	http://mugshots.bcgov.net/images/74/86774/24082304063500.jpeg	2024-11-07 22:00:05.005755
12552	LOPEZ-RIVERA	YHADER		90 DILLON RD APT A2	HILTON HEAD ISL, SC 29926	H-White/Latin, Hispanic / Male	M	1968-11-14	55	5'08"	180	49526	2024-10-12	05:13:00	2024-10-12	11:23:00	http://mugshots.bcgov.net/images/88/41088/24101205530000.jpeg	2024-11-07 22:00:05.0076
12553	LORD	FYNLEY	GRACE MARIE	141 INSPIRATION AVE # 5303; MYSTIC BLUFF APARTMENTS	Twn of Bluffton, SC 29910	N-White, Non-Hisp / Female	F	2006-01-12	18	5'08"	120	49372	2024-09-29	05:01:00	2024-09-29	10:50:00	http://mugshots.bcgov.net/images/57/375157/24092905061100.jpeg	2024-11-07 22:00:05.01078
12554	LUCCI	CLINTON	RYAN	62 FLICKER ST; PALMETTO BLUFF	BLUFFTON, SC 29910	N-White, Non-Hisp / Male	M	1991-02-17	33	6'00"	175	49447	2024-10-04	22:36:00	2024-10-05	11:46:00	http://mugshots.bcgov.net/images/90/31290/24101213035000.jpeg	2024-11-07 22:00:05.012491
12555	LUCCI	CLINTON	RYAN	62 FLICKER ST; PALMETTO BLUFF	BLUFFTON, SC 29910	N-White, Non-Hisp / Male	M	1991-02-17	33	6'00"	175	49529	2024-10-12	12:52:00	2024-10-13	11:17:00	http://mugshots.bcgov.net/images/90/31290/24101213035000.jpeg	2024-11-07 22:00:05.014338
12556	MADRID REYNOSO	RIGOBERTO		20 SIMMONSVILLE RD APT 506	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	1992-12-01	31	5'08"	190	49231	2024-09-20	11:42:00	2024-09-26	07:39:00	http://mugshots.bcgov.net/images/98/318898/24092011591900.jpeg	2024-11-07 22:00:05.015922
12557	MAIRENA CRUZ	ANABELLE		104 CORDILLO PKWY APT O4	HILTON HEAD ISL, SC 29928 7540	H-White/Latin, Hispanic / Female	F	1972-06-16	52	5'02"	179	49697	2024-10-28	02:33:00	\N	\N	http://mugshots.bcgov.net/images/53/386153/24102805132300.jpeg	2024-11-07 22:00:05.02134
12558	MAIRENA CRUZ	ANABELLE		104 CORDILLO PKWY APT O4	HILTON HEAD ISL, SC 29928 7540	H-White/Latin, Hispanic / Female	F	1972-06-16	52	5'02"	179	49698	2024-10-28	04:58:00	2024-10-28	10:08:00	http://mugshots.bcgov.net/images/53/386153/24102805132300.jpeg	2024-11-07 22:00:05.02277
12559	MALDONADO GOMEZ	PEDRO		91 MARSHALL PARLINE	RIDGELAND, SC 29936	H-White/Latin, Hispanic / Male	M	1992-06-29	32	5'08"	160	49247	2024-09-21	02:46:00	\N	\N	http://mugshots.bcgov.net/images/92/382692/24092103055800.jpeg	2024-11-07 22:00:05.025298
12560	MANIGO	RUSSELL	TRENT	40 ALEXANDRA LOOP; MAJESTIC MHP	Burton, SC	N-Black, Non-Hisp / Male	M	1992-09-22	32	6'02"	163	48989	2024-09-01	03:46:00	2024-09-03	12:39:00	http://mugshots.bcgov.net/images/85/19785/24090104124900.jpeg	2024-11-07 22:00:05.028334
12561	MANUEL	ALINA	BEVERLY	104 PRITCHARD ST; MANUEL WORKS	BLUFFTON, SC 29910 5528	N-White, Non-Hisp / Female	F	1998-07-23	26	5'03"	170	49323	2024-09-25	19:36:00	2024-09-26	10:32:00	http://mugshots.bcgov.net/images/13/57813/24092519550300.jpeg	2024-11-07 22:00:05.031012
12562	MANZANARES GARCIA	JOSE	TOMAS	183 JOE FRAZIER RD; PINE OAKS MHP; PINE OAKS	Burton, SC 29906	H-White/Latin, Hispanic / Male	M	1985-09-01	39	5'09"	150	49453	2024-10-05	00:26:00	2024-10-07	08:21:00	http://mugshots.bcgov.net/images/57/384157/24100500401900.jpeg	2024-11-07 22:00:05.033138
12563	MARKULIK	JACOB	HOWARD	6219 BALLINGER RD	GREENSBORO, NC 27410	N-White, Non-Hisp / Male	M	1996-01-21	28	5'10"	180	49688	2024-10-27	03:06:00	2024-10-27	12:44:00	http://mugshots.bcgov.net/images/03/386103/24102703172000.jpeg	2024-11-07 22:00:05.035613
12564	MARLER	JESSICA	LEIGH	215 HOLMES STREET	BLUFFTON, SC 29910	N-White, Non-Hisp / Female	F	1997-12-29	26	5'09"	176	49574	2024-10-16	09:58:00	2024-10-17	23:11:00	http://mugshots.bcgov.net/images/41/297641/24101610080800.jpeg	2024-11-07 22:00:05.037072
12565	MARTE-DELGADO	YUNIOR		95 LAUREL ST E; LAUREL ACRES	Burton, SC 29906	H-White/Latin, Hispanic / Male	M	1988-07-17	36	6'00"	220	49011	2024-09-02	22:52:00	2024-09-03	13:47:00	http://mugshots.bcgov.net/images/88/380688/24090222592300.jpeg	2024-11-07 22:00:05.03889
12566	MARTIN	JACOB	FARRELL	42 STARSHINE CIR; PALMETTO POINTE TOWN	BLUFFTON, SC 29910 4509	N-White, Non-Hisp / Male	M	1995-09-21	29	6'01"	250	49744	2024-11-02	03:06:00	2024-11-02	10:12:00	http://mugshots.bcgov.net/images/36/131236/24110203143800.jpeg	2024-11-07 22:00:05.040707
12567	MARTIN	MARK	ELLIOTT	1073 DEERFIELD RD	HARDEEVILLE, SC 29927 4921	N-Black, Non-Hisp / Male	M	1991-09-24	33	5'07"	135	49390	2024-09-30	16:09:00	2024-10-08	17:27:00	http://mugshots.bcgov.net/images/11/23311/24093016111600.jpeg	2024-11-07 22:00:05.042794
12568	MARTINEZ	JERON	ANTHONY	1975 BLAKERS BLVD; MILL CREEK AT CYPRES	Twn of Bluffton, SC 29909	N-Black, Non-Hisp / Male	M	1976-10-20	48	6'02"	235	49158	2024-09-13	17:18:00	\N	\N	http://mugshots.bcgov.net/images/37/377337/24091319564900.jpeg	2024-11-07 22:00:05.044669
12569	MARTINEZ	JERON	ANTHONY	1975 BLAKERS BLVD; MILL CREEK AT CYPRES	Twn of Bluffton, SC 29909	N-Black, Non-Hisp / Male	M	1976-10-20	48	6'02"	235	49159	2024-09-13	19:46:00	2024-09-14	13:28:00	http://mugshots.bcgov.net/images/37/377337/24091319564900.jpeg	2024-11-07 22:00:05.046359
12570	MARTINEZ	JULIAN	RAYMOND	9 W MORNINGSIDE DR	BLUFFTON, SC 29910	N-White, Non-Hisp / Male	M	1984-10-27	40	5'10"	155	49203	2024-09-17	13:41:00	\N	\N	http://mugshots.bcgov.net/images/32/259932/24091713514500.jpeg	2024-11-07 22:00:05.046912
12571	MARTINEZ ALVARADO	FRANCLIN	ROCAEL	324 SAMS POINT RD	BEAUFORT, SC 29907 2018	H-White/Latin, Hispanic / Male	M	1981-08-09	43	5'02"	163	49695	2024-10-27	20:27:00	\N	\N	http://mugshots.bcgov.net/images/42/386142/24102722474800.jpeg	2024-11-07 22:00:05.048479
12572	MARTINEZ ALVARADO	FRANCLIN	ROCAEL	324 SAMS POINT RD	BEAUFORT, SC 29907 2018	H-White/Latin, Hispanic / Male	M	1981-08-09	43	5'02"	163	49696	2024-10-27	22:30:00	2024-10-29	08:29:00	http://mugshots.bcgov.net/images/42/386142/24102722474800.jpeg	2024-11-07 22:00:05.049955
12573	MARTINEZ-BASILIO	DIEGO	MANUEL	322 SHADY GLEN CIRCLE	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	1999-02-21	25	5'05"	180	49358	2024-09-28	07:27:00	2024-09-30	14:03:00	http://mugshots.bcgov.net/images/15/355615/24092807372300.jpeg	2024-11-07 22:00:05.051207
12574	MARTINEZ-NORALES	MARLON			,	H-White/Latin, Hispanic / Male	M	1985-06-09	39	5'06"	210	49327	2024-09-25	18:30:00	2024-10-08	17:06:00	http://mugshots.bcgov.net/images/57/383257/24092518531600.jpeg	2024-11-07 22:00:05.053897
12575	MARTINEZ-PABLO	DELI		156 DILLON RD # 327; COTTON HOPE VILLAS BLDG 300	Hilton Head Isl, SC 29926	H-White/Latin, Hispanic / Female	F	1992-07-29	32	5'04"	130	48724	2024-08-10	11:45:00	2024-08-13	12:23:00	http://mugshots.bcgov.net/images/80/370280/24081012044700.jpeg	2024-11-07 22:00:05.055311
12576	MARTINEZ-RUIZ	EDWIN	HUMBERTO	31 HILANDA DR; HILANDA MHP	BEAUFORT, SC 29906	H-White/Latin, Hispanic / Male	M	1990-11-16	33	5'05"	169	48956	2024-08-30	11:54:00	\N	\N	http://mugshots.bcgov.net/images/26/380426/24083012001300.jpeg	2024-11-07 22:00:05.057666
12577	MASTON	MICHAEL	CODY	237 TURKEY OAK DR	BLUFFTON, SC 29910	N-White, Non-Hisp / Male	M	1989-02-23	35	5'11"	190	49625	2024-10-22	04:32:00	2024-10-22	09:20:00	http://mugshots.bcgov.net/images/18/385618/24102204341900.jpeg	2024-11-07 22:00:05.059847
12578	MATUTE ARGUETA	KEVIN	YONATHAN	8 WHITTLE LN	Pritchardville, SC 29910	H-White/Latin, Hispanic / Male	M	1995-11-09	28	5'05"	150	49757	2024-11-03	01:23:00	2024-11-04	08:40:00	http://mugshots.bcgov.net/images/03/386803/24110302331600.jpeg	2024-11-07 22:00:05.061654
12579	MAYO	LUKE		111111 ARCHWOOD DR	SAVANNAH, GA 31407	N-White, Non-Hisp / Male	M	1972-11-03	52	6'00"	220	49389	2024-09-30	16:07:00	2024-10-08	17:31:00	http://mugshots.bcgov.net/images/59/383659/24093016085600.jpeg	2024-11-07 22:00:05.064143
12580	MCBRIDE	NICOLE	JAMISON	HOMELESS	BLUFFTON, SC 29910	N-White, Non-Hisp / Female	F	1989-05-24	35	5'00"	120	48758	2024-08-13	23:38:00	2024-08-14	10:55:00	http://mugshots.bcgov.net/images/50/25950/24091221555300.jpeg	2024-11-07 22:00:05.065469
12581	MCBRIDE	NICOLE	JAMISON	HOMELESS	BLUFFTON, SC 29910	N-White, Non-Hisp / Female	F	1989-05-24	35	5'00"	120	48887	2024-08-24	20:35:00	2024-08-25	10:24:00	http://mugshots.bcgov.net/images/50/25950/24091221555300.jpeg	2024-11-07 22:00:05.067039
12582	MCBRIDE	NICOLE	JAMISON	HOMELESS	BLUFFTON, SC 29910	N-White, Non-Hisp / Female	F	1989-05-24	35	5'00"	120	48922	2024-08-27	01:13:00	2024-08-27	11:16:00	http://mugshots.bcgov.net/images/50/25950/24091221555300.jpeg	2024-11-07 22:00:05.068792
12583	MCBRIDE	NICOLE	JAMISON	HOMELESS	BLUFFTON, SC 29910	N-White, Non-Hisp / Female	F	1989-05-24	35	5'00"	120	48941	2024-08-28	12:46:00	2024-08-29	11:35:00	http://mugshots.bcgov.net/images/50/25950/24091221555300.jpeg	2024-11-07 22:00:05.07038
12584	MCBRIDE	NICOLE	JAMISON	HOMELESS	BLUFFTON, SC 29910	N-White, Non-Hisp / Female	F	1989-05-24	35	5'00"	120	49146	2024-09-12	21:27:00	\N	\N	http://mugshots.bcgov.net/images/50/25950/24091221555300.jpeg	2024-11-07 22:00:05.071655
12585	MCCLINTIC	KATHERINE	FOSS	507 NORTH ST	BEAUFORT, SC 29902 4770	N-White, Non-Hisp / Female	F	2048-09-14	76	5'05"	140	49669	2024-10-25	22:49:00	2024-10-26	12:21:00	http://mugshots.bcgov.net/images/61/52261/24102523103300.jpeg	2024-11-07 22:00:05.073256
12586	MCCRAY	LAMAR		4365 PINEWOOD CIR	BEAUFORT, SC 29906 3639	N-Black, Non-Hisp / Male	M	1996-02-10	28	5'11"	189	49677	2024-10-26	01:38:00	\N	\N	http://mugshots.bcgov.net/images/63/55963/24010321340600.jpeg	2024-11-07 22:00:05.07622
12587	MCDANIEL	JOSEPH	HAYS	221 BRICKYARD POINT RD S	BEAUFORT, SC 29907 1232	N-White, Non-Hisp / Male	M	1999-03-06	25	5'09"	175	49248	2024-09-21	03:19:00	2024-09-21	11:19:00	http://mugshots.bcgov.net/images/09/82809/24092103280700.jpeg	2024-11-07 22:00:05.078554
12588	MCDOMICK	ANTONIO	MAURICE	596 TULFINNY RD	BEAUFORT, SC 29945	N-Black, Non-Hisp / Male	M	1985-11-03	39	5'11"	145	49542	2024-10-13	04:36:00	2024-10-13	11:00:00	http://mugshots.bcgov.net/images/35/6735/24101306132200.jpeg	2024-11-07 22:00:05.080801
12589	MCGILLEN	NICOLE	MARIE	2979 ARMSTRONG STREET	JACKSONVILLE, FL 32218	N-White, Non-Hisp / Female	F	1985-11-13	38	5'06"	130	49055	2024-09-06	03:08:00	2024-09-17	11:00:00	http://mugshots.bcgov.net/images/59/380059/24090603522200.jpeg	2024-11-07 22:00:05.08261
12590	MCKAUGHAN	ALEXANDRA	KAYE	9 WHITES DR	BEAUFORT, SC 29906 8487	N-White, Non-Hisp / Female	F	1992-12-28	31	5'06"	160	49216	2024-09-19	03:17:00	2024-09-19	10:35:00	http://mugshots.bcgov.net/images/62/55862/24091903410800.jpeg	2024-11-07 22:00:05.084642
12591	MCKEE	DERRICK	JERROD	123 Old Salem Rd. Apt H-1	Beaufort, SC 29945	N-Black, Non-Hisp / Male	M	2007-02-21	17	5'11"	184	49443	2024-10-04	13:46:00	\N	\N	http://mugshots.bcgov.net/images/75/302975/24100414001800.jpeg	2024-11-07 22:00:05.085968
12592	MCKEE	VERNON		30 GREGORY DR	SAINT HELENA IS, SC 29920 5118	N-Black, Non-Hisp / Male	M	1968-09-12	56	5'06"	130	48775	2024-08-15	09:26:00	2024-08-15	14:23:00	http://mugshots.bcgov.net/images/97/38197/24081509573700.jpeg	2024-11-07 22:00:05.088588
12593	MCKENZIE	DUSTIN		HOMELESS	MARION, AR 72687	N-White, Non-Hisp / Male	M	1991-08-30	33	6'02"	250	49492	2024-10-09	13:59:00	2024-10-10	10:10:00	http://mugshots.bcgov.net/images/72/384572/24101007325800.jpeg	2024-11-07 22:00:05.090713
12594	MCKINSEY	MICHAEL	LAMONT	302 COUNTY SHED ROAD	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1985-07-25	39	5'07"	210	49013	2024-09-03	00:32:00	2024-09-03	10:43:00	http://mugshots.bcgov.net/images/62/71262/24090306325000.jpeg	2024-11-07 22:00:05.092837
12595	MCLAUGHLIN	TIMOTHY	JOSEPH	2 REDDAM RD	PLAISTOW, NH 03865	N-White, Non-Hisp / Male	M	1997-03-01	27	6'00"	180	49037	2024-09-04	15:47:00	2024-09-05	11:09:00	http://mugshots.bcgov.net/images/81/289681/24090416095700.jpeg	2024-11-07 22:00:05.09501
12596	MCLEOD	FREDRICK	CHARLES	195 SEABROOK RD	SEABROOK, SC 29940	N-White, Non-Hisp / Male	M	1975-06-26	49	6'02"	215	49100	2024-09-09	18:01:00	2024-09-10	10:18:00	http://mugshots.bcgov.net/images/09/255209/24090918232500.jpeg	2024-11-07 22:00:05.097411
12597	MCMANUS	JAMIE	LYNN	241 OLD RIVER RD; OLDFIELD MEWS	Okatie, SC	N-White, Non-Hisp / Female	F	1988-06-14	36	5'00"	115	49313	2024-09-25	12:05:00	2024-09-26	11:57:00	http://mugshots.bcgov.net/images/79/100879/24092512294700.jpeg	2024-11-07 22:00:05.098673
12598	MCMICHAEL	AKEEM RASHAD		911 WALTER E DAVIS SR DR	MACON, GA 31217	N-Black, Non-Hisp / Male	M	1989-07-31	35	6'00"	170	49729	2024-10-31	20:02:00	2024-11-01	10:59:00	http://mugshots.bcgov.net/images/45/220545/24103119285400.jpeg	2024-11-07 22:00:05.1006
12599	MCNAIR	MARVIN	JAMAINE	897 FORDING ISLAND RD	Bluffton, SC 29910	N-Black, Non-Hisp / Male	M	1989-12-11	34	6'02"	180	49471	2024-10-07	02:50:00	\N	\N	http://mugshots.bcgov.net/images/62/8562/24012408153200.jpeg	2024-11-07 22:00:05.102287
12600	MCOWEN	TERRY	MICHAEL	9 BROWN THRASHER ROAD	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Male	M	1963-11-02	61	6'00"	200	48864	2024-08-22	19:15:00	2024-08-23	13:46:00	http://mugshots.bcgov.net/images/11/219411/24082220042700.jpeg	2024-11-07 22:00:05.10402
12601	MEIJA	GERMAN	ERNESTO	30 ROSALES LN	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	2003-07-04	21	5'05"	170	49755	2024-11-02	23:10:00	2024-11-04	08:34:00	http://mugshots.bcgov.net/images/93/386793/24110223225400.jpeg	2024-11-07 22:00:05.105675
12602	MEJIA	HECTOR	IGNACIO	136 HAVENWOOD DRIVE	GASTON, SC	H-White/Latin, Hispanic / Male	M	2005-12-17	18	5'05"	180	49531	2024-10-12	16:21:00	2024-10-13	20:00:00	http://mugshots.bcgov.net/images/99/384899/24101216415200.jpeg	2024-11-07 22:00:05.107818
12603	MELCHOR-CARRILLO	ANIBAL	GEOVANNY	705 FARM LAKE DR; THE FARM	Bluffton, SC 29910	H-White/Latin, Hispanic / Male	M	2002-08-18	22	6'00"	180	49619	2024-10-20	13:50:00	2024-10-21	13:54:00	http://mugshots.bcgov.net/images/89/314689/24102014184000.jpeg	2024-11-07 22:00:05.110574
12604	MELCHORO ABAD	ARTURO		1100 SAMS POINT RD	Ladys Island, SC 29907	H-White/Latin, Hispanic / Male	M	2003-07-12	21	5'06"	180	49507	2024-10-10	12:50:00	2024-10-10	14:40:00	http://mugshots.bcgov.net/images/98/384698/24101013034200.jpeg	2024-11-07 22:00:05.112576
12605	MELECIO	JASELYN	MARIE	11 SOUTHWOOD PARK DR APT 99	HILTON HEAD ISL, SC 29926 8401	H-White/Latin, Hispanic / Female	F	1987-01-21	37	5'02"	150	48865	2024-08-22	21:52:00	2024-08-23	14:37:00	http://mugshots.bcgov.net/images/58/29158/24082221543700.jpeg	2024-11-07 22:00:05.114724
12606	MELTER	MELISSA	LYNN	28 SPRINGFIELD RD; SPRINGFIELD	Ladys Island, SC	N-White, Non-Hisp / Female	F	1977-10-19	47	5'07"	140	49391	2024-09-30	17:04:00	2024-10-04	11:55:00	http://mugshots.bcgov.net/images/08/27608/24102117010500.jpeg	2024-11-07 22:00:05.116535
12607	MELTER	MELISSA	LYNN	28 SPRINGFIELD RD; SPRINGFIELD	Ladys Island, SC	N-White, Non-Hisp / Female	F	1977-10-19	47	5'07"	140	49624	2024-10-21	16:22:00	2024-10-30	13:27:00	http://mugshots.bcgov.net/images/08/27608/24102117010500.jpeg	2024-11-07 22:00:05.117978
12608	MELTON	AMY	LOU	92 GIBBET RD	Pritchardville, SC 29909	N-White, Non-Hisp / Female	F	1980-10-15	44	5'08"	210	49109	2024-09-10	07:47:00	2024-09-10	16:32:00	http://mugshots.bcgov.net/images/13/352813/24091007582300.jpeg	2024-11-07 22:00:05.119449
12609	MELTON	BILLY	WAYNE	412 WAIGHT ST	City of Bft, SC 29902	N-White, Non-Hisp / Male	M	1971-04-19	53	5'07"	170	49661	2024-10-25	15:05:00	2024-11-07	15:13:00	http://mugshots.bcgov.net/images/96/16396/24102515053300.jpeg	2024-11-07 22:00:05.121089
12610	MENDEZ-JUAREZ	DILSON	FACUNDO	707 STUART STREET	SAVANNAH, GA 31405	H-White/Latin, Hispanic / Male	M	1994-11-07	30	5'06"	230	49286	2024-09-23	15:40:00	2024-09-26	07:42:00	http://mugshots.bcgov.net/images/52/382952/24092316452100.jpeg	2024-11-07 22:00:05.122542
12611	MENDOZA CUBAS	JOSE DANIEL		96 MATHEWS DR APT 41	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Male	M	1997-07-15	27	5'10"	200	48978	2024-08-31	17:15:00	\N	\N	http://mugshots.bcgov.net/images/47/366847/	2024-11-07 22:00:05.125783
12612	MENEFEE	JELANI	HAKEEM	170 ORANGE GROVE RD	RIDGELAND, SC 29936	N-Black, Non-Hisp / Male	M	1995-06-15	29	6'00"	240	49275	2024-09-22	12:03:00	\N	\N	http://mugshots.bcgov.net/images/77/6077/24092213543700.jpeg	2024-11-07 22:00:05.127563
12613	MENEFEE	JELANI	HAKEEM	170 ORANGE GROVE RD	RIDGELAND, SC 29936	N-Black, Non-Hisp / Male	M	1995-06-15	29	6'00"	240	49276	2024-09-22	13:31:00	2024-09-23	09:59:00	http://mugshots.bcgov.net/images/77/6077/24092213543700.jpeg	2024-11-07 22:00:05.129161
12614	MENIER	FRANNZY		13125 231ST ST	LAURELTON, NY 11413	N-Black, Non-Hisp / Male	M	1985-01-01	39	5'08"	185	49653	2024-10-24	19:37:00	2024-10-25	12:00:00	http://mugshots.bcgov.net/images/97/385897/24102419432100.jpeg	2024-11-07 22:00:05.130712
12615	MIDDLETON	MONTERREAL		60 SHANKLIN RD LOT 34	Beaufort, SC 29906 8489	N-Black, Non-Hisp / Male	M	1987-08-02	37	5'11"	180	49435	2024-10-03	17:48:00	2024-10-04	10:18:00	http://mugshots.bcgov.net/images/40/83240/24100318474500.jpeg	2024-11-07 22:00:05.132535
12616	MILLIDGE	TRAVON		1811 PRINCE ST	City of Bft, SC	N-Black, Non-Hisp / Male	M	2003-02-24	21	5'05"	100	49039	2024-09-04	17:51:00	2024-09-05	10:19:00	http://mugshots.bcgov.net/images/52/67652/24090417581500.jpeg	2024-11-07 22:00:05.135459
12617	MINDERMAN	SHAWN	MICHAEL	92 SHANKLIN RD	Beaufort, SC 29906	N-White, Non-Hisp / Male	M	1988-12-09	35	5'07"	170	48737	2024-08-11	14:34:00	2024-08-12	10:58:00	http://mugshots.bcgov.net/images/81/2381/24081114400000.jpeg	2024-11-07 22:00:05.137365
12618	MITCHELL	GEORGE	SCOTT	333 BUCK ISLAND RD	BLUFFTON, SC 29910	N-Black, Non-Hisp / Male	M	1974-03-11	50	5'07"	159	49310	2024-09-25	10:22:00	2024-09-25	14:44:00	http://mugshots.bcgov.net/images/78/154778/24092513583900.jpeg	2024-11-07 22:00:05.138813
12619	MITCHELL	LESLEY	KEYEISHA	55 DETOUR RD	SEABROOK, SC 29940	N-Black, Non-Hisp / Female	F	1989-04-06	35	5'05"	148	48895	2024-08-26	08:09:00	2024-08-26	12:31:00	http://mugshots.bcgov.net/images/28/278228/24082608085000.jpeg	2024-11-07 22:00:05.14017
12620	MIXSON	CHRISTOPHER	CALEB	703 ISLAND PINES DR	PORT ROYAL, SC 29935 1529	N-White, Non-Hisp / Male	M	1992-10-28	32	6'00"	165	48745	2024-08-11	23:33:00	2024-08-12	11:48:00	http://mugshots.bcgov.net/images/82/224582/24081200471800.jpeg	2024-11-07 22:00:05.142607
12621	MIZE	JAMES	L	27499 W 161ST SOUTH	BRISTO, OK 74041	N-White, Non-Hisp / Male	M	1982-09-01	42	6'00"	250	48965	2024-08-30	23:09:00	2024-09-03	17:11:00	http://mugshots.bcgov.net/images/89/380489/24083023160500.jpeg	2024-11-07 22:00:05.14418
12622	MODZELEWSKI	ALEX	BRYANT	7 CHINABERRY CIR; CHINABERRY RIDGE	HILTON HEAD, SC 29926	N-White, Non-Hisp / Male	M	2002-08-03	22	6'00"	180	48984	2024-09-01	00:43:00	2024-09-01	10:58:00	http://mugshots.bcgov.net/images/51/210351/24090100522600.jpeg	2024-11-07 22:00:05.146392
12623	MOLINARI	FABRIZZIO	LEANDRO	5 GUM TREE RD # G8; MARSH SIDE	Hilton Head Isl, SC 29926	H-White/Latin, Hispanic / Male	M	1978-07-19	46	6'03"	198	49487	2024-10-09	01:11:00	2024-10-09	10:47:00	http://mugshots.bcgov.net/images/27/55827/24100901222000.jpeg	2024-11-07 22:00:05.14789
12624	MONDRAGON	JOSE LUIS	LAGOS	39 PINE FORES DR	Bluffton, SC 29910	H-White/Latin, Hispanic / Male	M	1974-04-16	50	5'05"	170	49605	2024-10-19	04:23:00	2024-10-19	15:12:00	http://mugshots.bcgov.net/images/71/222071/24101904570000.jpeg	2024-11-07 22:00:05.150537
12625	MONSON	ERICA	PRISCILLA	434 LAUREL BAY RD	Burton, SC	N-White, Non-Hisp / Female	F	1988-05-18	36	5'09"	160	48825	2024-08-19	13:50:00	2024-08-19	15:08:00	http://mugshots.bcgov.net/images/87/13787/24081914065200.jpeg	2024-11-07 22:00:05.153164
12626	MONTANINO	LAUREN	ROSE	7 WHITE OAKS CIR; ROSE HILL PLANTATION	BLUFFTON, SC 29910 5700	N-White, Non-Hisp / Female	F	1990-06-27	34	5'01"	110	48899	2024-08-25	17:19:00	2024-08-26	16:19:00	http://mugshots.bcgov.net/images/56/3056/24082517363900.jpeg	2024-11-07 22:00:05.154628
12627	MONTANO	ANDERSON		14 RHINER DR	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Male	M	2007-06-03	17	5'08"	200	48985	2024-08-31	22:43:00	\N	\N	http://mugshots.bcgov.net/images/92/141292/	2024-11-07 22:00:05.157133
12628	MONTERO	JAYDIN	ISAIAH	H & H BN PO BOX 18001	Parris Island, SC 29905	H-White/Latin, Hispanic / Male	M	2003-07-20	21	5'10"	155	49166	2024-09-14	02:15:00	2024-09-14	13:14:00	http://mugshots.bcgov.net/images/04/381904/24091402170500.jpeg	2024-11-07 22:00:05.159277
12629	MOODY	JASHEEN	AMEER	81 MURRAY DR	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1981-02-28	43	6'01"	210	49182	2024-09-15	01:11:00	2024-09-22	15:14:00	http://mugshots.bcgov.net/images/54/45654/24091501182900.jpeg	2024-11-07 22:00:05.160974
12630	MOON	DAVID	LEE	35 PEPPERMINT RD	SAINT HELENA IS, SC 29920 6233	N-Black, Non-Hisp / Male	M	1982-10-22	42	5'11"	285	49551	2024-10-14	10:04:00	2024-10-14	15:41:00	http://mugshots.bcgov.net/images/65/2765/24101410534200.jpeg	2024-11-07 22:00:05.162681
12631	MOORE	JASON	ANTHONY	98 Sago Palm Dr	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1990-09-14	34	5'09"	150	49179	2024-09-15	01:52:00	2024-10-08	14:11:00	http://mugshots.bcgov.net/images/84/371684/24091502124200.jpeg	2024-11-07 22:00:05.164546
12632	MOORE	KAI	REEF	1035 ASHTON PT BLVD	BEAUFORT, SC 29926	N-White, Non-Hisp / Male	M	2003-06-06	21	5'07"	130	48756	2024-08-13	17:26:00	2024-08-16	04:55:00	http://mugshots.bcgov.net/images/69/235869/24081317375300.jpeg	2024-11-07 22:00:05.165924
12633	MORALES	SILVIA	SANTIAGO	6 GREAT BARRACUDA LN	HILTON HEAD ISL, SC 29926	H-White/Latin, Hispanic / Male	M	1983-06-20	41	5'06"	130	49190	2024-09-15	17:24:00	2024-10-06	03:49:00	http://mugshots.bcgov.net/images/11/382011/24091517440300.jpeg	2024-11-07 22:00:05.16767
12634	MORALES-LOPEZ	LEONAY		31 KATY CIRCLE	Beaufort, SC 29902	H-White/Latin, Hispanic / Male	M	1996-06-18	28	5'03"	175	49539	2024-10-13	03:10:00	2024-10-13	11:14:00	http://mugshots.bcgov.net/images/23/384923/24101303225000.jpeg	2024-11-07 22:00:05.17046
12635	MORANO	JENNY	GALVAN	14 GIBBET RD	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Female	F	1999-08-02	25	5'04"	130	49136	2024-09-11	22:50:00	2024-09-12	10:20:00	http://mugshots.bcgov.net/images/48/104348/24091123110000.jpeg	2024-11-07 22:00:05.172659
12636	MORENO-MEJIA	DENYS	ULICES	839 WILLIAM HILTON PKWY # 102; CHIMNEY COVE VILLAGE	Hilton Head Isl, SC 29926	H-White/Latin, Hispanic / Male	M	1976-06-28	48	5'06"	170	48735	2024-08-11	12:48:00	2024-10-21	14:00:00	http://mugshots.bcgov.net/images/80/300280/24081112475300.jpeg	2024-11-07 22:00:05.174135
12637	MORRELL	DANELL	JAMES	65 PELICAN CIRCLE	City of Bft, SC 29906	N-Black, Non-Hisp / Male	M	1985-10-23	39	6'04"	205	49121	2024-09-11	01:50:00	2024-09-11	13:09:00	http://mugshots.bcgov.net/images/71/77771/24091101480200.jpeg	2024-11-07 22:00:05.176669
12638	MORRIS	EDWIN	KEITH	65 DETOUR ROAD	SEABROOK, SC 29940	N-Black, Non-Hisp / Male	M	1981-06-24	43	5'08"	190	49363	2024-09-28	11:39:00	2024-09-29	11:05:00	http://mugshots.bcgov.net/images/94/178494/24092811530200.jpeg	2024-11-07 22:00:05.17814
12639	MORRIS	KHALIL	RAHEEM	107 WADE HAMPTON RD	HAMPTON, SC 29924 2560	N-Black, Non-Hisp / Male	M	1998-06-08	26	5'10"	175	49079	2024-09-07	23:00:00	2024-09-08	11:37:00	http://mugshots.bcgov.net/images/49/381249/24090723211400.jpeg	2024-11-07 22:00:05.179621
12640	MORRIS	TITO	JERMAINE	2170 N LAKE DR APT 4036	COLUMBIA, SC 29212 8125	N-Black, Non-Hisp / Male	M	1980-10-06	44	5'08"	162	48749	2024-08-12	10:14:00	2024-08-12	14:23:00	http://mugshots.bcgov.net/images/16/68116/24081210154200.jpeg	2024-11-07 22:00:05.181392
12641	MORRISON	KENNETH	ALPHONZO	237 BROAD ST APT 2B	SUMTER, SC 29150	N-Black, Non-Hisp / Male	M	1963-04-10	61	5'10"	169	48920	2024-08-26	20:48:00	2024-10-23	10:13:00	http://mugshots.bcgov.net/images/72/43472/24082620235100.jpeg	2024-11-07 22:00:05.18443
12642	MORTON	JAYLA	MIRANDA	48 HARDING ST; PALMETTO ESTATES	Burton, SC 29902	N-Black, Non-Hisp / Female	F	2001-10-20	23	5'04"	155	49274	2024-09-22	07:39:00	2024-09-22	12:12:00	http://mugshots.bcgov.net/images/13/1813/24092207410000.jpeg	2024-11-07 22:00:05.186223
12643	MOSCO	CARTER	REYELT	1 GLOUCESTER RD APT 206	HILTON HEAD ISL, SC 29928 0801	N-White, Non-Hisp / Male	M	1998-10-15	26	6'04"	190	48849	2024-08-22	04:39:00	2024-08-22	12:14:00	http://mugshots.bcgov.net/images/86/67286/24082204412900.jpeg	2024-11-07 22:00:05.188777
12644	MOSSING	TIMOTHY	CHARLES	45 WICKLOW DR; WEXFORD	Hilton Head Isl, SC 29928	N-White, Non-Hisp / Male	M	1980-08-11	44	5'09"	200	49745	2024-11-02	02:15:00	2024-11-02	10:50:00	http://mugshots.bcgov.net/images/38/386738/24110202274000.jpeg	2024-11-07 22:00:05.190749
12645	MOSSO ORTIZ	FABIOLA		136 CALF PEN BAY RD	PINELAND, SC 29934	H-White/Latin, Hispanic / Female	F	1994-05-19	30	5'07"	230	49365	2024-09-28	15:19:00	2024-09-29	12:11:00	http://mugshots.bcgov.net/images/70/383470/24092816164000.jpeg	2024-11-07 22:00:05.192885
12646	MOTA ADAME	BRAULIO		1749 CHURCH RD	HARDEEVILLE, SC	H-White/Latin, Hispanic / Male	M	1974-05-13	50	5'07"	155	49319	2024-09-25	17:30:00	2024-10-08	12:51:00	http://mugshots.bcgov.net/images/09/292709/24092517340400.jpeg	2024-11-07 22:00:05.195994
12647	MOULTRIE	CHRISTOPHER		20 POLITE DR	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1959-07-12	65	5'11"	186	48994	2024-09-01	11:24:00	2024-09-02	10:26:00	http://mugshots.bcgov.net/images/20/6520/24090111253100.jpeg	2024-11-07 22:00:05.197539
12648	MOULTRIE	MALIK	LAMOND	1842 TRASK PKWY	Lobeco, SC 29940	N-Black, Non-Hisp / Male	M	1996-09-02	28	6'01"	150	48837	2024-08-20	20:06:00	2024-10-24	11:08:00	http://mugshots.bcgov.net/images/33/27433/24082020300200.jpeg	2024-11-07 22:00:05.199235
12649	MOULTRIE	MALIK	TY'SHAWN	14 NEWBERRY CIR	YEMASSEE, SC 29945 7521	N-Black, Non-Hisp / Male	M	2001-11-23	22	5'06"	132	49071	2024-09-07	02:25:00	2024-09-16	16:46:00	http://mugshots.bcgov.net/images/16/111116/24090703401700.jpeg	2024-11-07 22:00:05.202018
12650	MULHOLLAND	LOGAN	BRIANA	22 CHISWICK WAY	BLUFFTON, SC 29910	N-White, Non-Hisp / Female	F	1999-06-01	25	5'04"	160	49786	2024-11-05	12:15:00	2024-11-06	11:08:00	http://mugshots.bcgov.net/images/69/78669/24110513171000.jpeg	2024-11-07 22:00:05.204075
12651	MULLEN	JASERI	SAEED	328 MORGAN ROAD	LOBECO, SC 29940	N-Black, Non-Hisp / Male	M	1996-11-01	28	5'05"	180	49220	2024-09-19	09:35:00	2024-09-19	12:35:00	http://mugshots.bcgov.net/images/03/21003/24091909534800.jpeg	2024-11-07 22:00:05.207076
12652	MULLIGAN	BRANDON	ONEAL	107 ALLEN DR	RIDGELAND, SC 29936 6403	N-Black, Non-Hisp / Male	M	1992-08-05	32	6'02"	165	49455	2024-10-05	00:20:00	2024-10-06	11:31:00	http://mugshots.bcgov.net/images/94/44994/24100500454100.jpeg	2024-11-07 22:00:05.209193
12653	MUNGIN	TERRELL	DORAN	4348 PINEWOOD CIR; PINEWOOD SUBDIVISION	Burton, SC 29906	N-Black, Non-Hisp / Male	M	1986-12-09	37	6'00"	240	49218	2024-09-19	07:46:00	2024-11-03	05:08:00	http://mugshots.bcgov.net/images/81/155981/24091907525400.jpeg	2024-11-07 22:00:05.211292
12654	MURRAY	CARDRE	PIERRE	1 EAGIN CT	HILTON HEAD ISL, SC 29926 2907	N-Black, Non-Hisp / Male	M	1974-02-03	50	6'01"	178	49239	2024-09-20	19:27:00	2024-09-26	06:34:00	http://mugshots.bcgov.net/images/99/4499/24092019371900.jpeg	2024-11-07 22:00:05.212531
12655	MYDELL	ABRAHAM	RANDOLPH	619 W 7TH STREET	RINCON, GA 31326	N-Black, Non-Hisp / Male	M	1981-07-05	43	5'05"	140	49767	2024-11-03	21:10:00	2024-11-04	17:54:00	http://mugshots.bcgov.net/images/74/386874/24110321150400.jpeg	2024-11-07 22:00:05.21433
12656	MYERS	QUINTH	ANTHONY	649 BROAD RIVER BLVD LOT 6	BEAUFORT, SC 29906 9487	N-Black, Non-Hisp / Male	M	1969-01-28	55	5'07"	155	49175	2024-09-14	12:40:00	2024-09-15	09:08:00	http://mugshots.bcgov.net/images/53/99553/24091412473400.jpeg	2024-11-07 22:00:05.216
12657	MYERS	SIOBHAN	LYN	HOMELESS	BLUFFTON, SC 29910	N-White, Non-Hisp / Female	F	1981-01-17	43	5'06"	120	48940	2024-08-28	05:01:00	2024-08-28	09:49:00	http://mugshots.bcgov.net/images/87/338787/24083008084400.jpeg	2024-11-07 22:00:05.217451
12658	MYERS	SIOBHAN	LYN	HOMELESS	BLUFFTON, SC 29910	N-White, Non-Hisp / Female	F	1981-01-17	43	5'06"	120	48954	2024-08-30	07:50:00	2024-09-24	17:10:00	http://mugshots.bcgov.net/images/87/338787/24083008084400.jpeg	2024-11-07 22:00:05.219365
12659	NAJERA	EDUARDO	ARCOS	377 BIG ESTATE CIR	Sheldon, SC 29910	H-White/Latin, Hispanic / Male	M	2006-08-30	18	5'06"	155	49031	2024-09-04	03:45:00	2024-09-04	10:55:00	http://mugshots.bcgov.net/images/89/319889/24090404151900.jpeg	2024-11-07 22:00:05.221052
12660	NAVA ADAME	ISRAEL		201 MARSHLAND RD # 14; ROLLERS TRAILER PARK	Hilton Head Isl, SC 29926	H-White/Latin, Hispanic / Male	M	1985-02-23	39	5'07"	200	49354	2024-09-28	01:03:00	2024-09-28	14:41:00	http://mugshots.bcgov.net/images/41/383441/24092801100900.jpeg	2024-11-07 22:00:05.222547
12661	NEISWENDER	JOHN	EMERSON	50 W MORNINGSIDE DR; SANDY POINTE	BLUFFTON, SC 29910 7801	N-White, Non-Hisp / Male	M	1971-04-01	53	5'09"	165	48902	2024-08-25	21:49:00	2024-08-27	15:56:00	http://mugshots.bcgov.net/images/76/333176/24082522024300.jpeg	2024-11-07 22:00:05.224505
12662	NELSON	DAE QUANDREA	TREVALL	1248 OLD BAILEY RD	RIDGELAND, SC 29936 8045	N-Black, Non-Hisp / Male	M	1998-02-21	26	5'09"	205	49056	2024-09-06	03:54:00	2024-09-06	08:43:00	http://mugshots.bcgov.net/images/34/77434/24090916454600.jpeg	2024-11-07 22:00:05.227331
12663	NELSON	DAE QUANDREA	TREVALL	1248 OLD BAILEY RD	RIDGELAND, SC 29936 8045	N-Black, Non-Hisp / Male	M	1998-02-21	26	5'09"	205	49101	2024-09-09	16:33:00	2024-09-10	13:15:00	http://mugshots.bcgov.net/images/34/77434/24090916454600.jpeg	2024-11-07 22:00:05.229048
12664	NELSON	EREK	LIAM	314 HAMPTON LAKE XING; HAMPTON LAKE	BLUFFTON, SC 29910 9334	N-White, Non-Hisp / Male	M	1999-12-31	24	6'04"	195	49416	2024-09-25	02:29:00	\N	\N	http://mugshots.bcgov.net/images/95/211495/	2024-11-07 22:00:05.230456
12665	NELSON	JAYDON	KAYLON	129 PECAN GROVE LN	RIDGELAND, SC 29936 4649	N-Black, Non-Hisp / Male	M	2001-08-18	23	5'09"	220	49440	2024-10-04	01:13:00	2024-10-04	12:18:00	http://mugshots.bcgov.net/images/67/367167/24100401165700.jpeg	2024-11-07 22:00:05.232116
12666	NELSON	KYMANI	WILHELMINA	358 ELDERS POND CIRLE	COLUMBIA, SC 24224	N-Black, Non-Hisp / Female	F	2004-07-09	20	5'03"	155	49570	2024-10-16	03:17:00	2024-10-16	10:55:00	http://mugshots.bcgov.net/images/50/385150/24101603340300.jpeg	2024-11-07 22:00:05.233996
12667	NEVINS	STARLIN	MALIK	166 COOKS LANDING RD	HARDEEVILLE, SC 29927	N-Black, Non-Hisp / Male	M	1998-07-31	26	6'01"	210	49641	2024-10-23	17:20:00	2024-10-24	20:00:00	http://mugshots.bcgov.net/images/36/180836/24102317293400.jpeg	2024-11-07 22:00:05.235981
12668	NORRIS	JEFFREY	DAVID	1656 ANTIOCH CHURCH RD	DUNN, NC 28334	N-White, Non-Hisp / Male	M	1979-10-10	45	5'10"	165	49339	2024-09-26	12:29:00	2024-10-08	09:53:00	http://mugshots.bcgov.net/images/35/381335/24092612410900.jpeg	2024-11-07 22:00:05.238176
12669	NORTHCUTT	RACHEL	ELIZABETH	52 CARSON RD	SAINT HELENA IS, SC 29920 4409	N-White, Non-Hisp / Female	F	1998-11-13	25	5'03"	110	49705	2024-10-28	23:23:00	2024-10-29	09:40:00	http://mugshots.bcgov.net/images/39/124039/24102823435500.jpeg	2024-11-07 22:00:05.240528
12670	OBREGON	JUSTIN	CAMPENELLA	26 CHRISTINE DR	BEAUFORT, SC 29907 2262	N-White, Non-Hisp / Male	M	2002-11-07	22	5'06"	135	48838	2024-08-20	21:14:00	2024-08-22	12:17:00	http://mugshots.bcgov.net/images/05/143705/24082021321300.jpeg	2024-11-07 22:00:05.24274
12671	OERTNER	RYLEI	GARLAND	2248 DEERFIELD RD	HARDEEVILLE, SC 29927	N-White, Non-Hisp / Female	F	2002-12-09	21	5'05"	125	49337	2024-09-26	05:28:00	2024-09-26	10:19:00	http://mugshots.bcgov.net/images/79/348079/24092605380000.jpeg	2024-11-07 22:00:05.244636
12672	OHARA	DALLAS	ANDREW	2807 POLK ST; POLK VILLAGE	BEAUFORT, SC 29902 3738	N-White, Non-Hisp / Male	M	1993-11-01	31	5'09"	170	49212	2024-09-18	12:45:00	2024-09-20	12:47:00	http://mugshots.bcgov.net/images/53/331053/24091812542600.jpeg	2024-11-07 22:00:05.246206
12673	OKEEFE	JOSHUA	CHARLES	HOMELESS	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1980-05-18	44	6'01"	180	49359	2024-09-28	08:16:00	2024-09-29	11:13:00	http://mugshots.bcgov.net/images/82/183382/24100512021600.png OsP31Pw8gf1DzwpE3dCHW+zXIHE=                                 	2024-11-07 22:00:05.248439
12674	OKEEFE	JOSHUA	CHARLES	HOMELESS	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1980-05-18	44	6'01"	180	49717	2024-10-29	18:38:00	2024-10-30	10:08:00	http://mugshots.bcgov.net/images/82/183382/24100512021600.png OsP31Pw8gf1DzwpE3dCHW+zXIHE=                                 	2024-11-07 22:00:05.249994
12675	OKEEFE	JOSHUA	CHARLES	HOMELESS	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1980-05-18	44	6'01"	180	49791	2024-11-05	19:40:00	2024-11-06	11:57:00	http://mugshots.bcgov.net/images/82/183382/24100512021600.png OsP31Pw8gf1DzwpE3dCHW+zXIHE=                                 	2024-11-07 22:00:05.251374
12676	OLIVER	SAMPSON		1924 Azalea Dr	Beaufort, SC 29902	N-Black, Non-Hisp / Male	M	1955-12-26	68	5'05"	130	49280	2024-09-23	01:05:00	2024-09-23	10:08:00	http://mugshots.bcgov.net/images/45/382845/24092301115700.jpeg	2024-11-07 22:00:05.252955
12677	ORELLANA	DIANNE	LYNN	50 MARSHLAND RD # 11; BRIDGETOWN APARTMENTS	Hilton Head Isl, SC 29926	H-White/Latin, Hispanic / Female	F	1975-01-30	49	5'07"	200	49142	2024-09-12	13:34:00	2024-09-13	09:41:00	http://mugshots.bcgov.net/images/60/12260/24110712254600.jpeg	2024-11-07 22:00:05.254681
12678	ORELLANA	DIANNE	LYNN	50 MARSHLAND RD # 11; BRIDGETOWN APARTMENTS	Hilton Head Isl, SC 29926	H-White/Latin, Hispanic / Female	F	1975-01-30	49	5'07"	200	49805	2024-11-07	12:11:00	\N	\N	http://mugshots.bcgov.net/images/60/12260/24110712254600.jpeg	2024-11-07 22:00:05.256169
12679	ORESIC	KATHRYN	FRANCES	561 MILL ST	BLUFFTON, SC 29910 5854	N-White, Non-Hisp / Female	F	1976-10-05	48	5'06"	135	49486	2024-10-09	03:04:00	2024-10-09	14:40:00	http://mugshots.bcgov.net/images/12/98012/24100903344600.jpeg	2024-11-07 22:00:05.257665
12680	ORTIZ	WANDY	JOSEFA	45 GRAHAM HALL S	RIDGELAND, SC 29936	H-White/Latin, Hispanic / Female	F	1996-09-08	28	4'11"	175	48806	2024-08-17	21:45:00	2024-08-18	13:41:00	http://mugshots.bcgov.net/images/23/366723/24081721590500.jpeg	2024-11-07 22:00:05.2604
12681	ORTIZ BENAVIDES	LUIS	M	195 UNIVERSITY PKWY; UNIVERSITY PARK	OKATIE, SC 29909	H-White/Latin, Hispanic / Male	M	1984-12-11	39	5'09"	165	49249	2024-09-21	07:02:00	2024-09-21	11:49:00	http://mugshots.bcgov.net/images/98/382698/24092107434500.jpeg	2024-11-07 22:00:05.262698
12682	ORTIZ-ROLON	JAN	LOUIS	797 MIDWAY CIR	RIDGELAND, SC 29936	H-White/Latin, Hispanic / Male	M	1999-04-05	25	6'03"	300	49368	2024-09-28	17:51:00	2024-09-29	12:03:00	http://mugshots.bcgov.net/images/54/334554/24092818260300.jpeg	2024-11-07 22:00:05.264167
12683	PACHECO BARRERA	WILTHER	MANUEL	6217 BEES CREEK RD	RIDGELAND, SC 29936	H-White/Latin, Hispanic / Male	M	1976-04-06	48	5'08"	180	48988	2024-09-01	07:28:00	2024-09-03	11:31:00	http://mugshots.bcgov.net/images/85/371185/24090107413800.jpeg	2024-11-07 22:00:05.266294
12684	PARKER	JERARD	LAVAR	1712 W PARIS AVE LOT 32	PORT ROYAL, SC 29935 1945	N-Black, Non-Hisp / Male	M	1978-10-19	46	6'01"	260	49235	2024-09-20	15:20:00	2024-09-23	14:42:00	http://mugshots.bcgov.net/images/43/235643/24092015284500.jpeg	2024-11-07 22:00:05.267548
12685	PATERSON	RYAN	S	2605 MCCHESNEY LN; COTTAGE FARMS	City of Bft, SC 29902	N-White, Non-Hisp / Male	M	1978-05-01	46	6'01"	185	49633	2024-10-22	18:46:00	2024-10-23	11:25:00	http://mugshots.bcgov.net/images/73/300873/24102308175700.jpeg	2024-11-07 22:00:05.26903
12686	PATTERSON	ROBERT	FLETCHER	605 Woodlawn Street	Clearwater, FL 33756	N-White, Non-Hisp / Male	M	1986-03-03	38	5'09"	170	49596	2024-10-18	13:49:00	\N	\N	http://mugshots.bcgov.net/images/63/384863/24101813571300.jpeg	2024-11-07 22:00:05.270755
12687	PATTERSON	WAVERLY	RICARDO	1507 PONY AVE; FOREST FIELDS	Burton, SC 29906	N-Black, Non-Hisp / Male	M	1971-10-19	53	6'02"	256	49793	2024-11-05	23:49:00	2024-11-06	10:27:00	http://mugshots.bcgov.net/images/31/76231/24110601404700.jpeg	2024-11-07 22:00:05.272103
12688	PAULAUSKAS	PAULIUS		4 WELLS EAST DR	HILTON HEAD ISL, SC 29926 2024	N-White, Non-Hisp / Male	M	1982-09-24	42	5'09"	170	49111	2024-09-10	10:59:00	\N	\N	http://mugshots.bcgov.net/images/58/205958/	2024-11-07 22:00:05.273453
12689	PAZ	MARISOL		48 ISLE OF PALMS W	Bluffton, SC 29910 9500	N-White, Non-Hisp / Female	F	1996-10-10	28	5'04"	130	49436	2024-10-03	18:02:00	\N	\N	http://mugshots.bcgov.net/images/34/237334/	2024-11-07 22:00:05.275566
12690	PEARSON	KAYSIE	BRIANNA	36 WESLEY AVE; PAULKIE ISLAND	Grays Hill, SC 29906	N-White, Non-Hisp / Female	F	1995-07-23	29	4'08"	130	48723	2024-08-10	04:43:00	2024-08-10	10:55:00	http://mugshots.bcgov.net/images/75/122575/24081005063200.jpeg	2024-11-07 22:00:05.277971
12691	PEARSON	MICHAEL	PAUL	36 SEA PINES DR; COFFIN POINT PLT	ST. HELENA ISLA, SC 29920	N-White, Non-Hisp / Male	M	1961-07-02	63	5'07"	152	48766	2024-08-14	08:38:00	2024-08-19	23:01:00	http://mugshots.bcgov.net/images/41/258441/24081408534200.jpeg	2024-11-07 22:00:05.279611
12692	PENNINGTON	SAMUEL	RAYMOND	5833 GALLIA ST	SCIOTOVILLE, OH 45662	N-White, Non-Hisp / Male	M	1991-12-18	32	6'00"	220	49523	2024-10-11	22:19:00	\N	\N	http://mugshots.bcgov.net/images/75/384875/24101201360200.jpeg	2024-11-07 22:00:05.282127
12693	PENNINGTON	SAMUEL	RAYMOND	5833 GALLIA ST	SCIOTOVILLE, OH 45662	N-White, Non-Hisp / Male	M	1991-12-18	32	6'00"	220	49521	2024-10-12	01:25:00	2024-10-12	11:42:00	http://mugshots.bcgov.net/images/75/384875/24101201360200.jpeg	2024-11-07 22:00:05.283709
12694	PERALES-PEREZ	PEDRO		1 WINDY LAKE CT; SUGAREE	Bluffton, SC 29910	H-White/Latin, Hispanic / Male	M	1973-10-21	51	5'07"	170	49334	2024-09-26	01:25:00	2024-09-28	09:42:00	http://mugshots.bcgov.net/images/79/294079/24092601242300.jpeg	2024-11-07 22:00:05.284713
12695	PEREZ CUELLAR	ENZO	BLADIMIR	400 WILLIAM HILTON PKWY	HILTON HEAD, SC 29926 2455	H-White/Latin, Hispanic / Male	M	1973-03-02	51	6'01"	180	48794	2024-08-17	06:09:00	2024-08-19	11:42:00	http://mugshots.bcgov.net/images/84/288684/24081709561500.jpeg	2024-11-07 22:00:05.287089
12696	PEREZ JR	MARIO		51 Azalea Gardens Rd	Hardeeville, SC 29927	H-White/Latin, Hispanic / Male	M	2007-01-18	17	5'05"	140	49382	2024-09-29	02:35:00	\N	\N	http://mugshots.bcgov.net/images/30/380630/24093005575400.jpg 1YohDn1OO1wDD2Eh6F2eCqZgvzc=                                 	2024-11-07 22:00:05.289482
12697	PEREZ ROSADO	JOSE		10 KINGSWOOD PATH	BLUFFTON, SC 29910 4553	Unknown / Male	M	1992-04-25	32	5'08"	135	49617	2024-10-20	10:23:00	2024-10-21	10:23:00	http://mugshots.bcgov.net/images/91/147991/24102010462300.jpeg	2024-11-07 22:00:05.291718
12698	PERKINS	MICHAEL	DEWIGHT	482 Parris Island GTWY; Lot 63	Beaufort, SC 29906	N-White, Non-Hisp / Male	M	1972-09-20	52	6'03"	210	49180	2024-09-15	00:44:00	2024-09-15	09:26:00	http://mugshots.bcgov.net/images/60/171060/24091500462100.jpeg	2024-11-07 22:00:05.293662
12699	PERRY	DVANTE	MAURICE	85 CATFISH CR	RIDGELAND, SC 29936	N-Black, Non-Hisp / Male	M	2006-07-03	18	5'10"	160	49439	2024-10-04	00:10:00	2024-10-04	09:31:00	http://mugshots.bcgov.net/images/94/101694/24100403474200.jpeg	2024-11-07 22:00:05.295988
12700	PERRY	RASHAD	ANTOINE	101 SAXONVILLE RD	ST HELENA ISL, SC 29920	N-Black, Non-Hisp / Male	M	1989-11-23	34	5'04"	174	48757	2024-08-13	18:54:00	2024-08-16	17:32:00	http://mugshots.bcgov.net/images/50/47450/24091720165200.jpeg	2024-11-07 22:00:05.297999
12701	PERRY	RASHAD	ANTOINE	101 SAXONVILLE RD	ST HELENA ISL, SC 29920	N-Black, Non-Hisp / Male	M	1989-11-23	34	5'04"	174	49114	2024-09-10	16:54:00	2024-09-11	16:43:00	http://mugshots.bcgov.net/images/50/47450/24091720165200.jpeg	2024-11-07 22:00:05.299397
12702	PERRY	RASHAD	ANTOINE	101 SAXONVILLE RD	ST HELENA ISL, SC 29920	N-Black, Non-Hisp / Male	M	1989-11-23	34	5'04"	174	49205	2024-09-17	19:48:00	2024-09-18	16:40:00	http://mugshots.bcgov.net/images/50/47450/24091720165200.jpeg	2024-11-07 22:00:05.30239
12703	PERRYMAN	IVORY	JOE	13 STANLEY FARM RD	BEAUFORT, SC 29906 8400	N-Black, Non-Hisp / Male	M	1952-06-12	72	6'04"	260	49123	2024-09-11	04:20:00	2024-09-11	11:06:00	http://mugshots.bcgov.net/images/19/380519/24091104255800.jpeg	2024-11-07 22:00:05.304302
12704	PETERS	DONALD	EUGENE	1592 CAROLINA AVE; CAROLINA ESTATES	Grays Hill, SC 29906	N-White, Non-Hisp / Male	M	1996-06-17	28	4'11"	102	49431	2024-09-04	16:47:00	\N	\N	http://mugshots.bcgov.net/images/22/45522/24100311243800.jpeg	2024-11-07 22:00:05.30574
12705	PETERS	DONALD	EUGENE	1592 CAROLINA AVE; CAROLINA ESTATES	Grays Hill, SC 29906	N-White, Non-Hisp / Male	M	1996-06-17	28	4'11"	102	49430	2024-10-03	08:40:00	2024-10-03	14:41:00	http://mugshots.bcgov.net/images/22/45522/24100311243800.jpeg	2024-11-07 22:00:05.307964
12706	PETERS	ERIC	LEE	17 CAPEHART CIRCLE	Beaufort, SC 29906	N-White, Non-Hisp / Male	M	1982-11-19	41	5'10"	190	48868	2024-08-23	02:45:00	\N	\N	http://mugshots.bcgov.net/images/38/50138/24082302490600.jpeg	2024-11-07 22:00:05.309496
12707	PETERSON	MEGAN	ALISSA ANN	169 SILVERS LN	ERWIN, TN 37650	N-White, Non-Hisp / Female	F	1993-08-19	31	5'05"	175	49118	2024-09-10	21:45:00	2024-09-11	11:13:00	http://mugshots.bcgov.net/images/22/381522/24091021520400.jpeg	2024-11-07 22:00:05.311916
12708	PINCKNEY	ELIZABETH	HELEN	HOMELESS	BEAUFORT, SC 29902	N-White, Non-Hisp / Female	F	1974-10-28	50	5'02"	165	49565	2024-10-15	20:12:00	2024-10-16	10:26:00	http://mugshots.bcgov.net/images/36/2736/24101520372900.jpeg	2024-11-07 22:00:05.313426
12709	PINCKNEY	JAMES	SIGMONDRE	3 ALLEY OOP LN	BLUFFTON, SC 29910 6202	N-Black, Non-Hisp / Male	M	1998-11-08	25	6'00"	163	48746	2024-08-12	03:14:00	2024-08-12	12:33:00	http://mugshots.bcgov.net/images/80/166980/24081203300400.jpeg	2024-11-07 22:00:05.31501
12710	PINCKNEY	PHILIPPE	DELON	11 CENTERFIELD LN	BLUFFTON, SC 29910 5929	N-Black, Non-Hisp / Male	M	1976-07-31	48	5'08"	170	49672	2024-10-26	01:33:00	2024-10-26	13:26:00	http://mugshots.bcgov.net/images/14/12514/24102602280400.jpeg	2024-11-07 22:00:05.317605
12711	PINKNEY	NICHYRIN	LEE	18 W MORNINGSIDE DR; SANDY POINTE	BLUFFTON, SC 29910	N-Black, Non-Hisp / Male	M	2006-04-21	18	5'06"	170	49078	2024-09-07	22:40:00	2024-09-08	11:48:00	http://mugshots.bcgov.net/images/07/360207/24090722482900.jpeg	2024-11-07 22:00:05.318985
12712	PITTARD	MATTHEW	AARON	130 GLEN EAGLES LN	MILLS RIVER, NC 28759	N-White, Non-Hisp / Male	M	1980-03-05	44	5'10"	220	49460	2024-10-06	03:33:00	2024-10-07	15:56:00	http://mugshots.bcgov.net/images/39/384239/24100603414900.jpeg	2024-11-07 22:00:05.320557
12713	POLITE	DERRICK	CORNELIUS	7 VIDALIA RD	Seabrook, SC 29940	N-Black, Non-Hisp / Male	M	1974-06-20	50	6'00"	200	49106	2024-09-10	01:18:00	2024-09-11	12:59:00	http://mugshots.bcgov.net/images/95/6795/24091113031000.jpeg	2024-11-07 22:00:05.322866
12714	POLITE	DONNELL		221 KEANS NECK RD	DALE, SC 29940	N-Black, Non-Hisp / Male	M	1979-07-26	45	5'06"	135	49145	2024-09-12	21:29:00	2024-09-16	12:51:00	http://mugshots.bcgov.net/images/68/47068/24091222094300.jpeg	2024-11-07 22:00:05.32507
12715	POLITE	JASMINE	REGENA	632 SEASIDE RD	St Helena Islan, SC 29920	N-Black, Non-Hisp / Female	F	1994-03-09	30	5'01"	220	49724	2024-10-31	09:06:00	2024-10-31	14:48:00	http://mugshots.bcgov.net/images/98/19998/24103109255500.jpeg	2024-11-07 22:00:05.328071
12716	POLITE	STORM	LEMONT ZOP	115 COMMUNITY CENTER RD	Lobeco, SC	N-Black, Non-Hisp / Male	M	2001-01-02	23	5'09"	265	49409	2024-10-02	12:47:00	\N	\N	http://mugshots.bcgov.net/images/20/123320/24100212510200.jpeg	2024-11-07 22:00:05.329433
12717	POMASQUI-TREJOS	SANTIAGO			,	H-White/Latin, Hispanic / Male	M	1995-05-31	29	5'08"	160	49395	2024-09-30	18:00:00	2024-10-08	12:33:00	http://mugshots.bcgov.net/images/75/383675/24093018013000.jpeg	2024-11-07 22:00:05.33228
12718	PONCE GONZALEZ	MAURICIO	GONZALEZ	10 PINE FIELD RD	HILTON HEAD, SC 29926	H-White/Latin, Hispanic / Male	M	1996-08-11	28	5'09"	230	48968	2024-08-14	08:17:00	\N	\N	http://mugshots.bcgov.net/images/82/69282/24102300223800.jpeg	2024-11-07 22:00:05.333887
12719	PONCE GONZALEZ	MAURICIO	GONZALEZ	10 PINE FIELD RD	HILTON HEAD, SC 29926	H-White/Latin, Hispanic / Male	M	1996-08-11	28	5'09"	230	48967	2024-08-31	01:10:00	2024-10-14	12:39:00	http://mugshots.bcgov.net/images/82/69282/24102300223800.jpeg	2024-11-07 22:00:05.334586
12720	PONCE GONZALEZ	MAURICIO	GONZALEZ	10 PINE FIELD RD	HILTON HEAD, SC 29926	H-White/Latin, Hispanic / Male	M	1996-08-11	28	5'09"	230	49635	2024-10-23	00:18:00	2024-10-29	16:02:00	http://mugshots.bcgov.net/images/82/69282/24102300223800.jpeg	2024-11-07 22:00:05.337311
12721	POOLE	MILES	ALEXANDER	11 WHITE OAKS CIR; ROSE HILL PLANTATION	Bluffton, SC 31419	N-White, Non-Hisp / Male	M	1988-02-23	36	5'10"	165	48874	2024-08-23	16:51:00	2024-08-26	17:49:00	http://mugshots.bcgov.net/images/81/255281/24082317073900.jpeg	2024-11-07 22:00:05.339186
12722	PORTER	SUSAN	R	18 REDTAIL ROAD	BLUFTON, SC 29909	N-White, Non-Hisp / Female	F	2047-04-19	77	5'00"	170	48841	2024-08-21	08:43:00	2024-08-21	10:55:00	http://mugshots.bcgov.net/images/11/379311/24082109004100.jpeg	2024-11-07 22:00:05.341217
12723	PORTER	TERRILL	LAMAR	11 SOUTHWOOD PARK DR # 109	Hilton Head Isl, SC 29926	N-Black, Non-Hisp / Male	M	1984-10-26	40	5'06"	150	49710	2024-10-29	11:28:00	2024-10-29	16:00:00	http://mugshots.bcgov.net/images/60/318360/24102912580400.jpeg	2024-11-07 22:00:05.343722
12724	POTTER	ANTON	BEAUX SHANE	8114 LEGACY CREEK DR	TOMBALL, TX 77375	N-White, Non-Hisp / Male	M	1997-10-15	27	5'11"	155	49451	2024-10-04	20:39:00	2024-10-05	10:49:00	http://mugshots.bcgov.net/images/07/18507/24100420510800.jpeg	2024-11-07 22:00:05.345364
12725	PRICE	RONALD	PATRICK	3 WHITEPOINT GARDENS WAY; THE HAVEN @ NEW RIVE	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1974-01-15	50	6'01"	200	49478	2024-10-08	02:27:00	2024-10-08	09:34:00	http://mugshots.bcgov.net/images/08/361608/24100802402800.jpeg	2024-11-07 22:00:05.34673
12726	PRIEST	ANTHONY	BYRON	914 MAGNOLIA BLUFF	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1980-04-19	44	5'07"	210	49434	2024-10-03	17:22:00	2024-10-05	12:02:00	http://mugshots.bcgov.net/images/58/113358/24100318443600.jpeg	2024-11-07 22:00:05.348461
12727	PRIESTER	JOHN	DONTUE	HOMELESS	Beaufort,	N-Black, Non-Hisp / Male	M	1991-09-15	33	5'08"	180	48930	2024-08-27	15:40:00	2024-08-28	15:02:00	http://mugshots.bcgov.net/images/26/59026/24082716530100.jpeg	2024-11-07 22:00:05.350279
12728	PRIMUS	BERNARD	MARQUIS	843 DELOSS POINT RD	RIDGELAND, SC 29936 5132	N-White, Non-Hisp / Male	M	1996-03-08	28	5'07"	212	49398	2024-09-30	20:26:00	2024-10-08	17:17:00	http://mugshots.bcgov.net/images/37/153637/24093020333500.jpeg	2024-11-07 22:00:05.351738
12729	PRITCHETT	SEAN	ANTHONY	4346 PINEWOOD CIR	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1988-05-12	36	6'02"	183	48738	2024-08-11	15:54:00	2024-08-22	13:00:00	http://mugshots.bcgov.net/images/82/7082/24081116084600.jpeg	2024-11-07 22:00:05.353427
12730	PRYOR	ERICA	LASHAY	11 CRAIG LN	Grays Hill, SC 29906	N-Black, Non-Hisp / Female	F	1987-02-10	37	5'02"	215	49054	2024-09-06	02:03:00	\N	\N	http://mugshots.bcgov.net/images/96/8396/24090602263900.jpeg	2024-11-07 22:00:05.355515
12731	RABON	SHAUN	TRAVIS	82 SPRINGFIELD RD	Ladys Island, SC 29907	N-White, Non-Hisp / Male	M	1992-01-07	32	6'01"	240	49428	2024-10-03	07:48:00	2024-10-03	11:34:00	http://mugshots.bcgov.net/images/26/99726/24100307501800.jpeg	2024-11-07 22:00:05.358929
12732	RAHN	DAVID	CHARLES	110 E Long St.	Rincon, GA 31326	N-White, Non-Hisp / Male	M	1970-06-02	54	5'09"	215	48925	2024-08-27	04:51:00	2024-10-23	15:19:00	http://mugshots.bcgov.net/images/59/379959/24082704532100.jpeg	2024-11-07 22:00:05.360501
12733	RAMIREZ	SISSIKI		7150 EAST AVE	HANOVER PARK, IL 60133	H-White/Latin, Hispanic / Female	F	2002-02-06	22	5'02"	104	49307	2024-09-25	06:17:00	2024-09-25	10:04:00	http://mugshots.bcgov.net/images/86/323786/24092506275900.jpeg	2024-11-07 22:00:05.362546
12734	RAMIREZ MARTINEZ	SAMUEL		19 MANATEE WAY	HILTON HEAD ISL, SC 29926	H-White/Latin, Hispanic / Male	M	1984-01-04	40	5'05"	160	48905	2024-08-26	00:40:00	2024-08-26	13:42:00	http://mugshots.bcgov.net/images/64/287064/24082601061900.jpeg	2024-11-07 22:00:05.363828
12735	RAY	JADA	SIERRA	2208 SOUTHSIDE BLVD 52	Port Royal, SC 29906	H-White/Latin, Hispanic / Female	F	2002-05-07	22	5'06"	165	49008	2024-09-02	21:49:00	2024-09-03	10:18:00	http://mugshots.bcgov.net/images/67/257067/24090221554500.jpeg	2024-11-07 22:00:05.365366
12736	REED	DANIEL	GUY	1616 CHARLESTON DR; CAROLINA ESTATES	BEAUFORT, SC 29906 9710	N-White, Non-Hisp / Male	M	1995-04-06	29	6'01"	210	49638	2024-10-23	03:59:00	2024-10-23	12:04:00	http://mugshots.bcgov.net/images/66/213766/24102304043800.jpeg	2024-11-07 22:00:05.368338
12737	REID	JAMES	EDWARD	6 CALYPSO LN	BEAUFORT, SC 29906 8802	N-Black, Non-Hisp / Male	M	1981-11-16	42	5'06"	155	49516	2024-10-11	09:11:00	2024-10-11	12:42:00	http://mugshots.bcgov.net/images/12/50512/24101109232700.jpeg	2024-11-07 22:00:05.37062
12738	REID	JUROSADI	NAVAEH ZAYON	1518 GABRIEL SNIPE PL	Port Royal, SC 29935	N-Black, Non-Hisp / Male	M	2007-03-21	17	5'07"	155	48896	2024-08-25	12:23:00	2024-08-26	15:02:00	http://mugshots.bcgov.net/images/86/358686/24082512500500.jpeg	2024-11-07 22:00:05.372066
12739	REID	ROLANDO	ROMARO	5 TIDAL BLUFF RD #26A	Hilton Head Isl, SC 299262930	N-Black, Non-Hisp / Male	M	1998-06-04	26	6'02"	165	49427	2024-10-03	07:45:00	2024-10-04	13:43:00	http://mugshots.bcgov.net/images/38/336738/24100308182100.jpeg	2024-11-07 22:00:05.373451
12740	REYES LARA	LEONARDO		5465 BEES CREEK RD	RIDGELAND, SC 29936	H-White/Latin, Hispanic / Male	M	1999-10-01	25	5'08"	180	48992	2024-09-01	07:34:00	2024-09-02	10:57:00	http://mugshots.bcgov.net/images/88/380588/24090107364600.jpeg	2024-11-07 22:00:05.375353
12741	REYES OSEGUERA	MELVIN	FRANCISCO	8522 GREENLEAF ST	ALEXANDRIA, SC 22309	H-White/Latin, Hispanic / Male	M	1984-04-03	40	5'05"	230	49174	2024-09-14	05:09:00	2024-09-17	17:37:00	http://mugshots.bcgov.net/images/15/381915/24091405191100.jpeg	2024-11-07 22:00:05.378057
12742	RHODEN	ODIS			,	N-White, Non-Hisp / Male	M	1971-11-04	53	6'01"	200	49330	2024-09-25	18:39:00	2024-10-08	13:20:00	http://mugshots.bcgov.net/images/76/383276/24092518514300.jpeg	2024-11-07 22:00:05.379544
12743	RHODES	JOHN	MARTIN	571 TIDEWATER CHASE LN	SUMMERVILLE, SC 29486 2403	N-White, Non-Hisp / Male	M	1954-04-21	70	6'00"	240	48937	2024-08-28	05:57:00	2024-08-28	10:14:00	http://mugshots.bcgov.net/images/61/380061/24082806041600.jpeg	2024-11-07 22:00:05.380986
12744	RICHARDSON	STARDAISHA	RAIGENE	325 AMBROSE RUN # BLDG 20; BLDG 200; CROSS CREEK APTS #204	City of Bft, SC 29906	N-Black, Non-Hisp / Female	F	1998-03-31	26	5'04"	205	48777	2024-08-15	17:40:00	\N	\N	http://mugshots.bcgov.net/images/21/378821/24081517550400.jpeg	2024-11-07 22:00:05.382609
12745	RILEY	DONOVAN	CHASE	425 WADE HAMPTON RD	Hampton, SC 29924	N-Black, Non-Hisp / Male	M	1993-05-24	31	5'07"	150	49082	2024-09-08	01:59:00	2024-09-08	09:27:00	http://mugshots.bcgov.net/images/23/281023/24090802115800.jpeg	2024-11-07 22:00:05.384133
12746	RIVAS	MILTON	ALEXIA	26 BLUEHAW CT; WELLSTONE COMMUNITY	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	2001-09-07	23	5'08"	190	49527	2024-10-12	07:31:00	2024-10-12	11:13:00	http://mugshots.bcgov.net/images/86/87686/24101207400600.jpeg	2024-11-07 22:00:05.38599
12747	RIVAS SANTOS	JOSSELIN	ROXANA	450 PARRIS ISLAND GTWY LOT 6	BEAUFORT, SC 29906	H-White/Latin, Hispanic / Female	F	1993-04-27	31	6'03"	150	49603	2024-10-19	01:32:00	2024-10-19	10:06:00	http://mugshots.bcgov.net/images/06/385406/24101901380000.jpeg	2024-11-07 22:00:05.387427
12748	RIVERA-PEREZ	CRUZ	JAVIER	18 CEDAR VIEW CIRCLE	BLUFFTON, SC 29909	H-Black, Hispanic / Male	M	1993-08-14	31	5'05"	260	49130	2024-09-11	14:44:00	\N	\N	http://mugshots.bcgov.net/images/26/347426/24091115025600.jpeg	2024-11-07 22:00:05.389024
12749	RIVERS	ADRIAN	DEMAR	1012 UNION ST APT 7	BEAUFORT, SC 29902	N-Black, Non-Hisp / Male	M	1982-11-28	41	5'08"	200	48792	2024-08-17	01:57:00	2024-08-17	11:25:00	http://mugshots.bcgov.net/images/07/336607/24081702464400.jpeg	2024-11-07 22:00:05.392378
12750	RIVERS	JACOB	GABRIEL	30 KENNEDY ST	ESTILL, SC 29918	N-Black, Non-Hisp / Male	M	1990-06-26	34	6'00"	160	49321	2024-09-25	17:52:00	2024-10-08	13:03:00	http://mugshots.bcgov.net/images/65/19665/24092517590000.jpeg	2024-11-07 22:00:05.394253
12751	RIVERS	PERRONNEAU	ROYAL	1601 DORCHESTER DR	Grays Hill, SC 29906	N-White, Non-Hisp / Male	M	1960-04-30	64	5'11"	130	49467	2024-10-06	19:32:00	\N	\N	http://mugshots.bcgov.net/images/15/28015/24100619473400.jpeg	2024-11-07 22:00:05.396212
12752	RIVERS	RASHEM	ANTOINE	52 PARKER DR	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1986-07-22	38	5'08"	300	48919	2024-08-27	00:13:00	2024-08-29	12:33:00	http://mugshots.bcgov.net/images/50/250/24082708144300.jpeg	2024-11-07 22:00:05.398075
12753	RIVERS	TYONNA	RUBY	8 BEAR SWAMP RD	SEABROOK, SC 29940 3203	N-Black, Non-Hisp / Female	F	2001-05-15	23	5'04"	215	49445	2024-10-04	14:04:00	\N	\N	http://mugshots.bcgov.net/images/29/245429/	2024-11-07 22:00:05.400256
12754	RIVERS	XAVIER	KENDRELL	22 STARLIGHT LN	Ladys Island, SC 29907	N-Black, Non-Hisp / Male	M	1995-08-02	29	5'06"	170	49601	2024-10-19	00:20:00	\N	\N	http://mugshots.bcgov.net/images/03/203/24101900330400.jpeg	2024-11-07 22:00:05.402825
12755	ROBERTS	MICHAEL	ANTHONY	11 SOUTHWOOD PARK DRIVE # 102	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Male	M	1968-02-01	56	5'08"	155	48755	2024-08-13	19:58:00	2024-08-14	10:53:00	http://mugshots.bcgov.net/images/14/18014/24090516331400.jpeg	2024-11-07 22:00:05.409673
12756	ROBERTS	MICHAEL	ANTHONY	11 SOUTHWOOD PARK DRIVE # 102	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Male	M	1968-02-01	56	5'08"	155	49050	2024-09-05	16:08:00	2024-10-07	15:23:00	http://mugshots.bcgov.net/images/14/18014/24090516331400.jpeg	2024-11-07 22:00:05.412181
12757	ROBINSON	DRECCO	KEWARN	4467 CULP RD	EDGEMOOR, SC 29712 7765	N-Black, Non-Hisp / Male	M	1979-12-14	44	6'01"	195	48767	2024-08-14	09:01:00	2024-09-03	11:22:00	http://mugshots.bcgov.net/images/15/170715/24081409091500.jpeg	2024-11-07 22:00:05.414767
12758	ROBINSON	DRIA	DANA	20 ROBERTS LN	BEAUFORT, SC 29906 7921	N-Black, Non-Hisp / Female	F	2000-05-17	24	5'04"	116	49023	2024-09-03	17:29:00	2024-09-03	18:08:00	http://mugshots.bcgov.net/images/41/79941/24090317542900.jpeg	2024-11-07 22:00:05.416904
12759	ROBINSON	HA'SHAUN	SHYHEIM	602 OLD FORT RD; OLD FORT	Port Royal, SC 29935	N-Black, Non-Hisp / Male	M	2003-10-24	21	5'06"	130	49686	2024-10-27	01:59:00	2024-10-29	15:58:00	http://mugshots.bcgov.net/images/38/89738/24102702050500.jpeg	2024-11-07 22:00:05.419715
12760	ROBINSON	LAMECH	LAWAN	1221 MORGANDOLLAR RD	COOSAWHATCHIE, SC 29936 3942	N-Black, Non-Hisp / Male	M	1992-12-30	31	5'05"	150	49223	2024-09-19	13:03:00	\N	\N	http://mugshots.bcgov.net/images/19/149019/24091914154100.jpeg	2024-11-07 22:00:05.422174
12761	ROBINSON	LAMECH	LAWAN	1221 MORGANDOLLAR RD	COOSAWHATCHIE, SC 29936 3942	N-Black, Non-Hisp / Male	M	1992-12-30	31	5'05"	150	49222	2024-09-19	14:10:00	2024-09-20	14:31:00	http://mugshots.bcgov.net/images/19/149019/24091914154100.jpeg	2024-11-07 22:00:05.424257
12762	RODRIGUEZ	CHRISTAIN	JOLE	339 SUMMERLANE CIR APT	RIDGELAND, SC 29936	H-White/Latin, Hispanic / Male	M	2001-12-28	22	5'07"	170	49533	2024-10-12	20:11:00	2024-10-13	12:45:00	http://mugshots.bcgov.net/images/12/384912/24101222161000.jpeg	2024-11-07 22:00:05.426901
12763	RODRIGUEZ	GAVRIEL		27 FERGUSON LN	HILTON HEAD ISL, SC 29926 3728	H-White/Latin, Hispanic / Male	M	2001-04-05	23	5'06"	120	49621	2024-10-20	21:40:00	2024-10-21	11:57:00	http://mugshots.bcgov.net/images/33/199833/24102021474300.jpeg	2024-11-07 22:00:05.428744
12764	RODRIGUEZ	SUNNY	EARNHARDT	6 POINT COMFORT RD UNIT 14B	HILTON HEAD ISL, SC 29928 7152	N-White, Non-Hisp / Male	M	2007-06-12	17	5'09"	140	49345	2024-09-26	17:03:00	\N	\N	http://mugshots.bcgov.net/images/51/287651/	2024-11-07 22:00:05.431261
12765	RODRIGUEZ-BANOS	JONATHAN		39 AIKEN PL	Hilton Head Isl, SC 29926	H-White/Latin, Hispanic / Male	M	1981-04-21	43	5'10"	180	49481	2024-10-08	17:53:00	\N	\N	http://mugshots.bcgov.net/images/79/29979/24100818042500.jpeg	2024-11-07 22:00:05.434161
12766	RODRIGUEZ-CASTILLO	JOSE	SEBASTIAN	67 WILKINSON WAY # 11106; ENCLAVE AT BLUFFTON PARK	Bluffton, SC 29910	H-White/Latin, Hispanic / Male	M	1994-07-18	30	5'08"	210	49058	2024-09-06	07:05:00	\N	\N	http://mugshots.bcgov.net/images/78/381078/24090608380500.jpeg	2024-11-07 22:00:05.438803
12767	RODRIGUEZ-CASTILLO	JOSE	SEBASTIAN	67 WILKINSON WAY # 11106; ENCLAVE AT BLUFFTON PARK	Bluffton, SC 29910	H-White/Latin, Hispanic / Male	M	1994-07-18	30	5'08"	210	49057	2024-09-06	08:32:00	2024-09-06	13:52:00	http://mugshots.bcgov.net/images/78/381078/24090608380500.jpeg	2024-11-07 22:00:05.44212
12768	RODRIGUEZ-PACHECO	JIMMY	STANLEY	2504 GRAYS HWY	RIDGELAND, SC 29936 5456	N-White, Non-Hisp / Male	M	1995-02-08	29	5'10"	235	49177	2024-09-14	14:21:00	\N	\N	http://mugshots.bcgov.net/images/85/18785/	2024-11-07 22:00:05.444786
12769	RODRIGUEZ-TOLEDO	ELIAS		19 PHILLIP DR	Hilton Head Isl, SC 29926	H-White/Latin, Hispanic / Male	M	1998-09-20	26	5'08"	290	49645	2024-10-24	00:45:00	\N	\N	http://mugshots.bcgov.net/images/31/112631/24102400520400.jpeg	2024-11-07 22:00:05.446457
12770	RODRIGUEZ-TORRES	YILSMARIE		10 CLARENCE J SIMMONS LN	Burton, SC 29906	H-White/Latin, Hispanic / Female	F	1998-07-02	26	5'06"	140	49155	2024-09-13	10:54:00	2024-10-02	13:39:00	http://mugshots.bcgov.net/images/91/327891/24091311080800.jpeg	2024-11-07 22:00:05.449461
12771	ROGERS	HANNAH	SUSAN	623 East Grady Street	Savannah, GA 30458	N-White, Non-Hisp / Female	F	1992-11-23	31	5'02"	135	49623	2024-10-21	14:55:00	2024-10-22	09:37:00	http://mugshots.bcgov.net/images/75/382375/24102114532400.jpeg	2024-11-07 22:00:05.451243
12772	ROJAS-GUZMAN	JUAN		2 GOETHE ROASD	Bluffton, SC 29910	H-White/Latin, Hispanic / Male	M	1984-05-16	40	5'05"	140	49267	2024-09-22	01:44:00	2024-09-22	14:45:00	http://mugshots.bcgov.net/images/44/285544/24092201505700.jpeg	2024-11-07 22:00:05.453477
12773	ROLLERSON	TERRANCE	JERMAINE	1 ALBANY DR	SEABROOK, SC 29940 3420	N-Black, Non-Hisp / Male	M	1973-02-25	51	5'08"	150	49299	2024-09-24	17:30:00	2024-09-25	14:07:00	http://mugshots.bcgov.net/images/19/58319/24092417281500.jpeg	2024-11-07 22:00:05.455579
12774	ROMERO	EDWIN	JOSE	20 SIMMONSVILLE RD APT 1608	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	2001-05-04	23	5'05"	125	49178	2024-09-15	00:12:00	2024-09-15	09:39:00	http://mugshots.bcgov.net/images/56/202056/24091500264300.jpeg	2024-11-07 22:00:05.457823
12775	ROMERO CASTRO	ALBERTO		155 DILLON ROAD APT 2527	HILTON HEAD ISL, SC 29926	H-White/Latin, Hispanic / Male	M	1995-07-12	29	5'05"	180	48904	2024-08-25	22:49:00	2024-08-26	13:28:00	http://mugshots.bcgov.net/images/44/379844/24082523024600.jpeg	2024-11-07 22:00:05.460606
12776	ROMERO MEJIA	PATRICIO		763 ELAINE FARM RD	HILTON HEAD ISL, SC 29928	H-White/Latin, Hispanic / Male	M	2002-03-17	22	5'00"	140	49184	2024-09-15	05:21:00	2024-09-16	08:31:00	http://mugshots.bcgov.net/images/01/325601/24091505483400.jpeg	2024-11-07 22:00:05.462235
12777	RONDE	JOSEPH	FRANK	606 OLD RIVER CT; OLDFIELD MEWS	Okatie, SC 29909	N-White, Non-Hisp / Male	M	1984-09-04	40	5'10"	280	49589	2024-10-18	02:16:00	2024-10-18	10:20:00	http://mugshots.bcgov.net/images/37/385337/24101802544600.jpeg	2024-11-07 22:00:05.464546
12778	ROPER	RYAN	OWEN	216 RILEY FARMS ROAD	RIDGELAND, SC 29936	N-White, Non-Hisp / Male	M	1987-01-01	37	6'03"	180	49775	2024-11-04	15:56:00	2024-11-05	19:50:00	http://mugshots.bcgov.net/images/90/7090/24110417443900.jpeg	2024-11-07 22:00:05.466305
12779	ROSS	AMBER	LASHAWN	181 Midway Cir	Ridgeland, SC 29936	N-Black, Non-Hisp / Female	F	1988-11-06	36	5'05"	165	49053	2024-09-05	22:13:00	2024-09-06	11:15:00	http://mugshots.bcgov.net/images/08/2508/24090522271400.jpeg	2024-11-07 22:00:05.468276
12780	ROSS	AMY	JILL	69 DOE ISLAND RD.	BLUFFTON, SC 29910	N-White, Non-Hisp / Female	F	1981-03-18	43	5'03"	120	49418	2024-10-02	22:59:00	2024-10-03	15:15:00	http://mugshots.bcgov.net/images/40/113040/24100223364400.jpeg	2024-11-07 22:00:05.469646
12781	ROSS	TONI	ANGELINA	10 KELLIE CT APT H	BLUFFTON, SC 29910 8552	N-White, Non-Hisp / Female	F	1992-11-29	31	5'05"	120	49591	2024-10-18	02:54:00	2024-10-18	10:21:00	http://mugshots.bcgov.net/images/16/14516/24101804121700.jpeg	2024-11-07 22:00:05.472012
12782	ROSSETTI	BRITTANI	SEARS	131 HARVEST CIR	Bluffton, SC 29910	N-White, Non-Hisp / Female	F	1990-08-23	34	5'03"	102	49336	2024-09-26	04:11:00	2024-09-26	11:17:00	http://mugshots.bcgov.net/images/51/18451/24092604082300.jpeg	2024-11-07 22:00:05.473495
12783	ROSTRO BARRON	ANGEL	ALFONZO	20 SIMMONSVILLE RD	Bluffton, SC 29910	H-Black, Hispanic / Male	M	2006-07-20	18	5'06"	120	49094	2024-09-09	03:53:00	2024-09-09	14:04:00	http://mugshots.bcgov.net/images/18/281318/24090903564500.jpeg	2024-11-07 22:00:05.475206
12784	ROWAN	KENNETH	JOSEPH	HOMELESS	Hilton Head Isl, SC 29926	N-White, Non-Hisp / Male	M	1965-08-03	59	5'05"	130	49702	2024-10-28	17:06:00	2024-10-29	10:04:00	http://mugshots.bcgov.net/images/99/62299/24102817394900.jpeg	2024-11-07 22:00:05.477191
12785	RUBIO ROMERO	ROBERTO		20 SIMMONSVILLE RD #306	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	2000-09-11	24	5'07"	150	48810	2024-08-18	10:28:00	2024-08-19	16:23:00	http://mugshots.bcgov.net/images/88/378988/24081810271100.jpeg	2024-11-07 22:00:05.479867
12786	RUIZ VALENZUELA	OMAR		3 WOODBRIDGE LN; THE LAKES @ EDGEWATE	Bluffton, SC 29910	H-White/Latin, Hispanic / Male	M	2001-07-06	23	5'07"	130	49459	2024-10-06	01:51:00	2024-10-06	10:49:00	http://mugshots.bcgov.net/images/36/384236/24100601534500.jpeg	2024-11-07 22:00:05.481402
12787	RULE-SILVEIRA	ASHLEY	NICOLE	3 POSSUM POINT LN #B	Twn of Bluffton, SC 29910	N-White, Non-Hisp / Female	F	2003-06-11	21	5'05"	140	48790	2024-08-17	01:34:00	2024-08-17	12:45:00	http://mugshots.bcgov.net/images/99/259499/24101105095900.jpeg	2024-11-07 22:00:05.483563
12788	RULE-SILVEIRA	ASHLEY	NICOLE	3 POSSUM POINT LN #B	Twn of Bluffton, SC 29910	N-White, Non-Hisp / Female	F	2003-06-11	21	5'05"	140	49512	2024-10-11	04:53:00	2024-10-11	10:21:00	http://mugshots.bcgov.net/images/99/259499/24101105095900.jpeg	2024-11-07 22:00:05.485879
12789	RUTLEDGE	KENNETH		54 REEDY PL; SUN CITY HILTON HEAD	BLUFFTON, SC 29910	N-White, Non-Hisp / Male	M	1959-08-12	65	6'04"	190	49415	2024-10-02	17:34:00	2024-10-03	11:47:00	http://mugshots.bcgov.net/images/34/340434/24100219141200.jpeg	2024-11-07 22:00:05.488104
12790	RYAN	JEFFREY	WAYNE	215 DILLARD MILL DR; MILL CREEK AT CYPRESS RIDGE	BLUFFTON, SC 29909	N-White, Non-Hisp / Male	M	2006-04-18	18	5'10"	140	49107	2024-09-10	02:34:00	\N	\N	http://mugshots.bcgov.net/images/07/231807/24091709384500.jpg BvK2RDVwclorGw/VbmCqe1t22fA=SC DMV 20240814                  	2024-11-07 22:00:05.489541
12791	RYAN	JEFFREY	WAYNE	215 DILLARD MILL DR; MILL CREEK AT CYPRESS RIDGE	BLUFFTON, SC 29909	N-White, Non-Hisp / Male	M	2006-04-18	18	5'10"	140	49202	2024-09-17	09:24:00	\N	\N	http://mugshots.bcgov.net/images/07/231807/24091709384500.jpg BvK2RDVwclorGw/VbmCqe1t22fA=SC DMV 20240814                  	2024-11-07 22:00:05.491188
12792	SALCEDO-BONILLA	GENESIS	G	57 SIMMONSVILLE RD APT 603	BLUFFTON, SC 29910	N-White, Non-Hisp / Female	F	1991-10-31	33	5'00"	125	49030	2024-09-04	03:51:00	2024-09-04	10:29:00	http://mugshots.bcgov.net/images/28/184828/24090403543200.jpeg	2024-11-07 22:00:05.493819
12793	SALGADO	JOSE	LUIS	HOMELESS	,	H-White/Latin, Hispanic / Male	M	1987-11-26	36	5'05"	120	49265	2024-09-22	01:31:00	2024-09-22	13:11:00	http://mugshots.bcgov.net/images/69/382769/24092208013200.jpeg	2024-11-07 22:00:05.495184
12794	SALGADO ROMERO	LUIS	DAVID	613 SHADY GLEN CIR	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	1996-02-13	28	5'06"	170	49084	2024-09-08	02:59:00	2024-09-18	10:15:00	http://mugshots.bcgov.net/images/51/330351/24090803290900.jpeg	2024-11-07 22:00:05.496775
12795	SANCHEZ	EVAN		247 STONEY XING; EDGEFIELD	Bluffton, SC 299236	H-White/Latin, Hispanic / Male	M	1993-09-17	31	5'10"	145	49024	2024-09-03	19:05:00	2024-09-19	15:07:00	http://mugshots.bcgov.net/images/39/10339/24090321271900.jpeg	2024-11-07 22:00:05.499215
12796	SANCHEZ	EVAN		247 STONEY XING; EDGEFIELD	Bluffton, SC 299236	H-White/Latin, Hispanic / Male	M	1993-09-17	31	5'10"	145	49038	2024-09-04	15:00:00	\N	\N	http://mugshots.bcgov.net/images/39/10339/24090321271900.jpeg	2024-11-07 22:00:05.503027
12797	SANCHEZ	JUAN	MANUEL	3 KELLIE CT APT C	BLUFFTON, SC 29910 8570	H-White/Latin, Hispanic / Male	M	1992-06-06	32	6'02"	185	49335	2024-09-26	04:05:00	2024-09-26	11:00:00	http://mugshots.bcgov.net/images/73/14273/24092608430800.jpeg	2024-11-07 22:00:05.504448
12798	SANCHEZ	PEDRO		5 GARDEN ANGLE PL	HILTON HEAD ISL, SC 29926	H-White/Latin, Hispanic / Male	M	1995-09-29	29	5'10"	190	49637	2024-10-23	04:49:00	2024-10-23	11:39:00	http://mugshots.bcgov.net/images/62/385762/24102304571400.jpeg	2024-11-07 22:00:05.506907
12799	SANCHEZ BARRIENTOS	FLORENCIO		100 HERON LAKE #14	HILTON HEAD ISL, SC 29928	H-White/Latin, Hispanic / Male	M	1967-02-23	57	5'07"	200	49413	2024-10-02	15:50:00	2024-10-03	12:19:00	http://mugshots.bcgov.net/images/26/119226/24100216130500.jpeg	2024-11-07 22:00:05.509932
12800	SANCHEZ-PEREZ	ANAIS	ROSA	189 CASTLE ROCK RD	Burton, SC 29906	H-White/Latin, Hispanic / Female	F	1988-08-15	36	5'05"	160	48857	2024-08-22	13:33:00	2024-08-23	13:26:00	http://mugshots.bcgov.net/images/27/351027/24082213352200.jpeg	2024-11-07 22:00:05.511232
12801	SANTOS GUERRERO	GENARDO		5 LAKESIDE DR; HIDDEN LAKES	Twn of Bluffton, SC 29910	H-White/Latin, Hispanic / Male	M	2001-04-30	23	5'05"	140	49151	2024-09-13	02:40:00	\N	\N	http://mugshots.bcgov.net/images/95/381795/	2024-11-07 22:00:05.51285
12802	SCANTLING	TYLER	MATTHEW	4921 BLUFFTON PKWY ATP 924	BLUFFTON, SC 29910	N-Black, Non-Hisp / Male	M	1994-12-09	29	5'11"	215	49141	2024-09-12	12:16:00	2024-09-12	14:23:00	http://mugshots.bcgov.net/images/89/40889/24091212253000.jpeg	2024-11-07 22:00:05.514524
12803	SCARBOROUGH	DANIEL	LEE	8 TWIN LAKES RD; TWIN LAKES	BEAUFORT, SC 29902 6549	N-White, Non-Hisp / Male	M	1974-08-21	50	6'00"	250	49194	2024-09-16	07:28:00	2024-09-16	09:11:00	http://mugshots.bcgov.net/images/63/43963/24091608054900.jpeg	2024-11-07 22:00:05.516395
12804	SCARCELLI	RUSS	ANTHONY	13 SALT WIND WAY; HILTON HEAD PLANTATI	HILTON HEAD, SC 29926 1954	N-White, Non-Hisp / Male	M	1987-04-08	37	5'08"	150	49144	2024-09-12	19:43:00	2024-09-13	13:00:00	http://mugshots.bcgov.net/images/61/380261/24091219591300.jpeg	2024-11-07 22:00:05.518964
12805	SCHEUER	KIMBERLY	MICHELLE	26 BEACH RD	BLUFFTON, SC 29910 6902	N-White, Non-Hisp / Female	F	1976-09-01	48	5'03"	102	49027	2024-09-03	23:42:00	2024-09-04	11:08:00	http://mugshots.bcgov.net/images/62/89062/24090403211500.jpeg	2024-11-07 22:00:05.52059
12806	SCHUMACHER	HALEY	MADISON	388 COTTLE DR	TIFTON, GA 31795	N-White, Non-Hisp / Female	F	1991-10-15	33	5'03"	200	49092	2024-09-08	20:24:00	2024-09-09	10:27:00	http://mugshots.bcgov.net/images/94/381294/24090820385000.jpeg	2024-11-07 22:00:05.522193
12807	SCHWARTZ	MARIO	JEROME	10 ESSEX CT; OLDE TOWNE VILLAGE	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1971-03-11	53	6'00"	240	48771	2024-08-14	17:04:00	2024-08-15	11:15:00	http://mugshots.bcgov.net/images/34/378734/24081417164400.jpeg	2024-11-07 22:00:05.525834
12808	SCHWEGLER	COURTNEY	RENEE	115 BRAYS ISLAND DR	SHELDON, SC 29941 3058	N-White, Non-Hisp / Female	F	1987-08-20	37	5'08"	145	49103	2024-09-09	21:41:00	2024-09-10	10:23:00	http://mugshots.bcgov.net/images/00/324500/24091003442900.jpeg	2024-11-07 22:00:05.527996
12809	SCOTT	ANTONIDIES	K	41 SHELDON DR	BEAUFORT, SC 29940	N-Black, Non-Hisp / Male	M	1982-10-06	42	5'09"	142	49536	2024-10-13	01:47:00	2024-10-13	10:55:00	http://mugshots.bcgov.net/images/79/20679/24101308493700.jpeg	2024-11-07 22:00:05.52971
12810	SCOTT	DAN		993 KINLOCH RD	Dale, SC 29940	N-Black, Non-Hisp / Male	M	1978-10-22	46	6'03"	220	49067	2024-09-06	19:26:00	2024-09-07	12:26:00	http://mugshots.bcgov.net/images/94/126094/24090619551700.jpeg	2024-11-07 22:00:05.531474
12811	SCOTT	DENISE	LATRICE	342 MARISTINE LN	RIDGELAND, SC 29936	N-Black, Non-Hisp / Female	F	1983-04-01	41	5'03"	180	49152	2024-09-13	08:00:00	2024-09-13	13:00:00	http://mugshots.bcgov.net/images/84/192484/24091308053700.jpeg	2024-11-07 22:00:05.533182
12812	SCOTT	ROBERTA	DENISE	21 VALENTINE ST APT 5	CAMBRIDGE, MA 02139	N-Black, Non-Hisp / Female	F	1977-03-10	47	5'10"	180	49673	2024-10-26	00:02:00	\N	\N	http://mugshots.bcgov.net/images/64/261764/	2024-11-07 22:00:05.534996
12813	SCOTT	ROLAND	FLOYD	7 FULLER CT	BLUFFTON, SC 29910	N-Black, Non-Hisp / Male	M	1972-08-26	52	5'10"	167	49654	2024-10-24	19:09:00	\N	\N	http://mugshots.bcgov.net/images/55/123555/22090613533300.jpeg	2024-11-07 22:00:05.536495
12814	SCRIVEN	CALVIN	LINERE	30 MATHEWS DR # 304; TABBY WALK	Hilton Head Isl, SC 29926	N-Black, Non-Hisp / Male	M	1986-03-22	38	5'10"	170	49080	2024-09-08	00:53:00	2024-09-08	12:30:00	http://mugshots.bcgov.net/images/83/8783/24090800553300.jpeg	2024-11-07 22:00:05.538022
12815	SEGUEDA-TORRES	RAMIRO	RAYMUNDO		,	H-White/Latin, Hispanic / Male	M	1984-04-19	40	5'00"	100	49326	2024-09-25	18:18:00	2024-10-08	13:14:00	http://mugshots.bcgov.net/images/74/383274/24092518253200.jpeg	2024-11-07 22:00:05.540305
12816	SEGURA-SALGADO	LAURA	ESTHER	48 MUIRFIELD DR	BLUFFTON, SC 29909 4617	H-White/Latin, Hispanic / Female	F	2003-06-30	21	5'05"	160	49088	2024-09-08	13:19:00	2024-09-09	12:28:00	http://mugshots.bcgov.net/images/69/381269/24090812595900.jpeg	2024-11-07 22:00:05.541748
12817	SENG	JACOB	WESLEY	45 HONEYSUCKLE LN	BEAUFORT, SC 29907 2139	N-White, Non-Hisp / Male	M	2005-08-11	19	5'07"	230	49491	2024-10-09	07:47:00	2024-10-09	14:37:00	http://mugshots.bcgov.net/images/71/270971/24100907550900.jpeg	2024-11-07 22:00:05.5442
12818	SERNA	RAMIRO		2201 MOSSY OAKS RD APT G9	BEAUFORT, SC 29902 7619	N-White, Non-Hisp / Male	M	1990-10-06	34	5'04"	160	49726	2024-10-31	13:49:00	2024-10-31	14:56:00	http://mugshots.bcgov.net/images/62/209862/24103113553500.jpeg	2024-11-07 22:00:05.546894
12819	SHAHEED	HAKEEM	ABDUL	4865 GILLISON BRANCH RD	RIDGELAND, SC 29936	N-Black, Non-Hisp / Male	M	1974-12-18	49	6'00"	214	49126	2024-09-11	07:57:00	2024-09-11	11:03:00	http://mugshots.bcgov.net/images/43/65243/24091108072400.jpeg	2024-11-07 22:00:05.548385
12820	SHIPSEY	COLIN	MORGAN	HOMELESS	Beaufort, SC 29906	N-White, Non-Hisp / Male	M	1995-07-27	29	6'05"	160	48826	2024-08-19	16:12:00	2024-08-21	14:59:00	http://mugshots.bcgov.net/images/99/2599/23111306334900.jpeg	2024-11-07 22:00:05.549971
12821	SHIRLEY	EDWIN	S	61 SALUDA WAY; SHADOW MOSS	Twn Port Royal, SC 29906	N-White, Non-Hisp / Male	M	1978-07-19	46	5'06"	150	49731	2024-11-01	03:05:00	2024-11-01	09:12:00	http://mugshots.bcgov.net/images/60/48060/24110103265600.jpeg	2024-11-07 22:00:05.552871
12822	SILVA FIGUEROA	MISAEL		4 ARBORMEADE CIR; ARBORWOOD @ GRANDE O	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	2003-05-29	21	5'02"	140	49693	2024-10-27	01:23:00	\N	\N	http://mugshots.bcgov.net/images/76/302176/	2024-11-07 22:00:05.555016
12823	SILVER	CHRISTIAN	TODD	140 PINECREST CIR; PINECREST	BLUFFTON, SC 29910 7872	N-White, Non-Hisp / Male	M	1967-03-14	57	6'00"	215	49613	2024-10-20	01:03:00	2024-10-20	11:38:00	http://mugshots.bcgov.net/images/04/1604/24102001143200.jpeg	2024-11-07 22:00:05.556646
12824	SILVER	DAVID		2122 6TH AVE N	SAINT PETERSBUR, FL 33713	N-White, Non-Hisp / Male	M	1978-01-31	46	5'11"	200	49025	2024-09-03	21:38:00	2024-09-04	11:05:00	http://mugshots.bcgov.net/images/32/380832/24090401161500.jpeg	2024-11-07 22:00:05.558301
12825	SIMMONS	CAYLA	MORGAN	1601 STILLWOOD DRIVE	SAVANNAH, GA 31419	N-White, Non-Hisp / Female	F	1989-08-15	35	5'04"	150	49561	2024-10-15	10:27:00	2024-10-16	13:57:00	http://mugshots.bcgov.net/images/94/368794/24101510285300.jpeg	2024-11-07 22:00:05.560542
12826	SIMMONS	CHARLES	LEON	25 BEN AND FLOSSIE DR	BEAUFORT, SC 29907 1661	N-Black, Non-Hisp / Male	M	1960-12-26	63	6'02"	180	49187	2024-09-15	10:25:00	2024-09-15	11:56:00	http://mugshots.bcgov.net/images/93/22593/24091510340600.jpeg	2024-11-07 22:00:05.561879
12827	SIMMONS	JUSTIN	RAMON	71 PLUMGRASS ST; WELLSTONE COMMUNITY	Twn of Bluffton, SC 29910	N-Black, Non-Hisp / Male	M	1986-04-10	38	5'10"	155	49764	2024-11-03	19:58:00	2024-11-04	10:23:00	http://mugshots.bcgov.net/images/14/152514/24110320054700.jpeg	2024-11-07 22:00:05.563523
12828	SINGLETON	ASHTON	MARQUISE	110 THATCER RD UNIT 104	Hardeeville, SC 29927	N-Black, Non-Hisp / Male	M	1998-09-08	26	5'08"	186	49026	2024-09-03	21:12:00	2024-09-04	10:37:00	http://mugshots.bcgov.net/images/77/34977/24090321053000.jpeg	2024-11-07 22:00:05.565307
12829	SINGLETON	DEMETRIC	RENARD	18 SOLOMAN WHITE LN	YEMASSEE, SC 29945 7404	N-Black, Non-Hisp / Male	M	2000-02-08	24	5'08"	130	48721	2024-08-10	01:32:00	\N	\N	http://mugshots.bcgov.net/images/70/142870/	2024-11-07 22:00:05.566965
12830	SINGLETON	HALEY	SIMONE	53 ERNEST DR	ST HELENA, SC 29920	N-Black, Non-Hisp / Female	F	1981-09-20	43	5'08"	179	49566	2024-10-15	22:26:00	2024-10-16	10:51:00	http://mugshots.bcgov.net/images/34/73434/24101522385700.jpeg	2024-11-07 22:00:05.568953
12831	SINGLETON	HENRY		13 NEIGHBOR LN	SAINT HELENA IS, SC 29920 3216	N-Black, Non-Hisp / Male	M	1981-09-12	43	5'09"	230	49045	2024-09-05	11:30:00	2024-09-05	12:25:00	http://mugshots.bcgov.net/images/68/868/24090511354800.jpeg	2024-11-07 22:00:05.570672
12832	SINGLETON	MICHAEL	FRANK	71 POSSUM HILL ROAD	BEAUFORT, SC 29902	N-Black, Non-Hisp / Male	M	1958-12-22	65	5'05"	165	48980	2024-08-31	23:35:00	2024-09-19	05:06:00	http://mugshots.bcgov.net/images/11/14111/23012513574800.jpeg	2024-11-07 22:00:05.571966
12833	SLATER	LENZY	ANDRE	340 MOUNT OLIVE ROAD	EARLY BRANCH, SC 29916	N-Black, Non-Hisp / Male	M	1980-02-24	44	5'11"	300	49657	2024-10-25	00:56:00	2024-10-26	12:07:00	http://mugshots.bcgov.net/images/20/52620/24102501004500.jpeg	2024-11-07 22:00:05.576022
12834	SMALLS	JOSEPH	LEROY	9 ORANGE GROVE RD	St Helena Islan, SC 29920	N-Black, Non-Hisp / Male	M	1985-04-10	39	5'10"	175	48897	2024-08-25	14:02:00	2024-08-26	16:54:00	http://mugshots.bcgov.net/images/12/2412/24011023382300.jpeg	2024-11-07 22:00:05.578946
12835	SMALLS	MARKTAZIUS	JOVAN	9 SAXONVILLE RD	SAINT HELENA IS, SC 29920 6214	N-Black, Non-Hisp / Male	M	2002-03-26	22	6'02"	220	49678	2024-10-26	08:30:00	2024-10-28	11:58:00	http://mugshots.bcgov.net/images/71/36171/24102608414800.jpeg	2024-11-07 22:00:05.582147
12836	SMALLS	MONICA	CHARISSE	23 WHITE RD	ST HELENA ISL, SC 29920	N-Black, Non-Hisp / Female	F	1973-03-20	51	5'06"	260	49683	2024-10-26	19:31:00	2024-10-27	12:05:00	http://mugshots.bcgov.net/images/40/640/24102619451700.jpeg	2024-11-07 22:00:05.585249
12837	SMALLS	QUINTIN	RASHAE	315 SQUIRE POPE RD	HILTON HEAD ISL, SC 29926 1250	N-Black, Non-Hisp / Male	M	1992-12-09	31	5'04"	130	49356	2024-09-28	05:00:00	2024-09-28	12:23:00	http://mugshots.bcgov.net/images/06/7706/24092805443400.jpeg	2024-11-07 22:00:05.587116
12838	SMITH	BENJAMIN	WARREN	101 LYNN COVE ROAD	ASHEVILLE, NC 28804	N-White, Non-Hisp / Male	M	1986-07-07	38	6'04"	250	49125	2024-09-11	01:47:00	\N	\N	http://mugshots.bcgov.net/images/38/381538/24091104475100.jpeg	2024-11-07 22:00:05.590494
12839	SMITH	BENJAMIN	WARREN	101 LYNN COVE ROAD	ASHEVILLE, NC 28804	N-White, Non-Hisp / Male	M	1986-07-07	38	6'04"	250	49124	2024-09-11	04:45:00	2024-09-11	16:17:00	http://mugshots.bcgov.net/images/38/381538/24091104475100.jpeg	2024-11-07 22:00:05.592283
12840	SMITH	BRADLEY	ALBERT	126 BESSELEIU CT; HERITAGE LAKES	BLUFFTON, SC 29910	N-White, Non-Hisp / Male	M	1984-06-17	40	5'08"	140	49515	2024-10-11	08:17:00	2024-10-11	15:20:00	http://mugshots.bcgov.net/images/30/93930/24101108343100.jpeg	2024-11-07 22:00:05.594178
12841	SMITH	BRIDGETT	JUDITH	539 CANDIDA DR; AZALEA SQUARE	Twn Port Royal, SC 29906	N-Black, Non-Hisp / Female	F	1999-12-20	24	5'03"	210	49746	2024-11-02	02:07:00	2024-11-02	10:10:00	http://mugshots.bcgov.net/images/16/361316/24110202350800.jpeg	2024-11-07 22:00:05.595864
12842	SMITH	DARRYN	LOGAN	3317 RIVERS HILL RD	VARNVILLE, SC 29944	N-White, Non-Hisp / Male	M	2005-02-14	19	5'10"	200	49069	2024-09-06	21:50:00	2024-09-07	12:23:00	http://mugshots.bcgov.net/images/74/381174/24090622011200.jpeg	2024-11-07 22:00:05.597198
12843	SMITH	HANEIF	KAREEM	19 BENJAMIN DR	HILTON HEAD ISL, SC 29926	N-Black, Non-Hisp / Male	M	1992-08-22	32	5'08"	160	48907	2024-08-25	23:17:00	\N	\N	http://mugshots.bcgov.net/images/96/67796/16073105185200.jpeg	2024-11-07 22:00:05.600571
12844	SMITH	JAMES	WILLIS	66 SUMMERALL RD	ST HELENA IS, SC 29920	N-White, Non-Hisp / Male	M	1976-11-01	48	5'11"	215	49149	2024-09-12	23:26:00	2024-09-13	09:39:00	http://mugshots.bcgov.net/images/00/154200/24091223343800.jpeg	2024-11-07 22:00:05.602461
12845	SMITH	MICHAEL	ONEIL	HOMELESS	BEAUFORT, SC 29902 5470	N-White, Non-Hisp / Male	M	2044-04-21	80	5'08"	150	48831	2024-08-19	23:59:00	2024-08-20	09:46:00	http://mugshots.bcgov.net/images/73/21373/24081923582000.jpeg	2024-11-07 22:00:05.603677
12846	SMITH	MONICA	VASQUEZ	175 OAK DR	LAGRANGE, GA 30240 7	N-White, Non-Hisp / Female	F	1980-01-23	44	5'04"	160	49087	2024-09-08	05:06:00	2024-09-08	12:16:00	http://mugshots.bcgov.net/images/68/381268/24090805254400.jpeg	2024-11-07 22:00:05.60532
12847	SNIPES	VALERIE	ANN	2205 NATIONAL STREET	BEAUFORT, SC 29902	N-White, Non-Hisp / Female	F	1984-04-18	40	4'05"	105	48957	2024-08-30	12:14:00	\N	\N	http://mugshots.bcgov.net/images/31/12631/24083012550500.jpeg	2024-11-07 22:00:05.606512
12848	SNYDER	DAVID	PAUL	716 16TH ST	Twn Port Royal, SC 29935	N-White, Non-Hisp / Male	M	1979-10-15	45	5'10"	160	49580	2024-10-17	01:39:00	2024-10-17	10:46:00	http://mugshots.bcgov.net/images/44/237144/24101701582100.jpeg	2024-11-07 22:00:05.608206
12849	SOLORZANO-VASQUEZ	ENMA	MERARY	5666 PATRIOT LN APT 811	Bluffton, SC 29910	H-White/Latin, Hispanic / Female	F	1991-06-21	33	5'02"	140	49172	2024-09-14	03:55:00	2024-09-14	13:18:00	http://mugshots.bcgov.net/images/14/381914/24091404392400.jpeg	2024-11-07 22:00:05.610164
12850	SPADO III	JOSEPH	PAUL	212 GREENWOOD DRIVE UNIT #330	HILTON HEAD ISL, SC 29928	N-White, Non-Hisp / Male	M	1979-11-15	44	6'00"	170	49513	2024-10-11	07:54:00	2024-10-11	10:01:00	http://mugshots.bcgov.net/images/00/100300/24101108005400.jpeg	2024-11-07 22:00:05.612475
12851	SPAIN	THOMAS	MARTIN	13 HARBOURSIDE LN APT 7143	HILTON HEAD ISL, SC 29928 3577	N-White, Non-Hisp / Male	M	1954-04-15	70	5'04"	165	48996	2024-09-01	17:04:00	2024-09-02	10:37:00	http://mugshots.bcgov.net/images/27/359427/24090117175000.jpeg	2024-11-07 22:00:05.613662
12852	SPENCER	VICTORIA	MARIE	123 OLD JERICHO RD; PALMETTO ESTATES	Burton, SC 29906	N-White, Non-Hisp / Female	F	2003-02-26	21	5'04"	161	49238	2024-09-20	18:15:00	2024-11-04	05:05:00	http://mugshots.bcgov.net/images/46/346846/24092018195400.jpeg	2024-11-07 22:00:05.615286
12853	SPRINGER	EMILY	JEAN	2 WILLIAM HILTON PKWY # 301; MARINERS COVE; MARINERS; #301	HH Off Island, SC 29926	N-White, Non-Hisp / Female	F	1963-12-03	60	5'07"	180	48851	2024-08-22	08:13:00	2024-08-22	10:55:00	http://mugshots.bcgov.net/images/89/368689/24092008345700.jpeg	2024-11-07 22:00:05.616626
12854	SPRINGER	EMILY	JEAN	2 WILLIAM HILTON PKWY # 301; MARINERS COVE; MARINERS; #301	HH Off Island, SC 29926	N-White, Non-Hisp / Female	F	1963-12-03	60	5'07"	180	49230	2024-09-20	08:24:00	2024-09-24	12:54:00	http://mugshots.bcgov.net/images/89/368689/24092008345700.jpeg	2024-11-07 22:00:05.618163
12855	STAFFORD	DEVON	DEVANTE	36 TELFAIR DR	Tillman, SC 29943	N-Black, Non-Hisp / Male	M	1995-12-31	28	6'01"	180	49261	2024-09-22	00:22:00	2024-10-08	13:00:00	http://mugshots.bcgov.net/images/42/63442/24092200325100.jpeg	2024-11-07 22:00:05.620021
12856	STAFFORD	JAMES	RASHEEM	23 KELIS LN	SAINT HELENA IS, SC 29920 6525	N-Black, Non-Hisp / Male	M	1995-10-21	29	6'02"	220	48983	2024-09-01	00:36:00	2024-09-02	10:55:00	http://mugshots.bcgov.net/images/34/25434/24101422200400.jpeg	2024-11-07 22:00:05.621562
12857	STAFFORD	JAMES	RASHEEM	23 KELIS LN	SAINT HELENA IS, SC 29920 6525	N-Black, Non-Hisp / Male	M	1995-10-21	29	6'02"	220	49558	2024-10-14	22:01:00	2024-10-15	11:47:00	http://mugshots.bcgov.net/images/34/25434/24101422200400.jpeg	2024-11-07 22:00:05.62396
12858	STANFIELD	MORRIS	FRANK	142 Maple Ridge Road	Walterboro, SC 29488	N-White, Non-Hisp / Male	M	2003-06-02	21	5'05"	175	48960	2024-08-30	15:08:00	2024-10-24	16:30:00	http://mugshots.bcgov.net/images/27/290427/24083015255800.jpeg	2024-11-07 22:00:05.626582
12859	STEINBERGER	NATHANIEL	QUIN	1 MEADOWLARK STREET	BEAUFORT, SC 29907	N-White, Non-Hisp / Male	M	1999-06-14	25	6'04"	190	49040	2024-09-04	18:15:00	2024-09-13	17:14:00	http://mugshots.bcgov.net/images/86/260986/24090418160200.jpeg	2024-11-07 22:00:05.628629
12860	STEINMEYER	CHARLES	HENRY	5938 PLEASANT FARM DR; PLEASANT FARM; PLEASANT FARM	BEAUFORT, SC 29906 9408	N-White, Non-Hisp / Male	M	1984-05-31	40	6'01"	210	48808	2024-08-18	03:24:00	2024-08-18	10:51:00	http://mugshots.bcgov.net/images/68/15468/24081803301900.jpeg	2024-11-07 22:00:05.629907
12861	STELL	ROBIN	ARLETHA	1197 FORDS POINTE CIRCLE	SAVANNAH, GA 31419	N-Black, Non-Hisp / Female	F	1970-12-04	53	5'02"	165	49209	2024-09-18	05:10:00	2024-09-18	10:53:00	http://mugshots.bcgov.net/images/20/125020/24091805205500.jpeg	2024-11-07 22:00:05.631132
12862	STEVENSON	BYRON	LANARD	583 Levy RD	Hardeeville, SC 29927	N-Black, Non-Hisp / Male	M	1986-04-25	38	6'01"	200	49480	2024-10-08	10:48:00	\N	\N	http://mugshots.bcgov.net/images/59/34559/24100811042000.jpeg	2024-11-07 22:00:05.632803
12863	STONEBRAKER	WINDY	R	313 PINE GROVE RD	BEAUFORT, SC 29906 8565	N-White, Non-Hisp / Female	F	1976-05-14	48	5'04"	145	49148	2024-09-12	23:02:00	2024-09-13	10:28:00	http://mugshots.bcgov.net/images/06/333606/24091223074400.jpeg	2024-11-07 22:00:05.634188
12864	STROBERT	JAMES	H	5 VILLAGE CIR; CHELSEA	BLUFFTON, SC 29909 3826	N-Black, Non-Hisp / Male	M	1989-02-16	35	6'01"	185	49649	2024-10-24	16:30:00	\N	\N	http://mugshots.bcgov.net/images/89/87989/	2024-11-07 22:00:05.635444
12865	STUKES	GERALD	CHARLES	474 LIVE OAK WALK; EDGEFIELD	BLUFFTON, SC 29910	N-Black, Non-Hisp / Male	M	1968-04-04	56	5'07"	220	49644	2024-10-23	19:36:00	2024-10-24	10:38:00	http://mugshots.bcgov.net/images/80/230880/24102319505500.jpeg	2024-11-07 22:00:05.637806
12866	SWEET	JOHN	RAHIEM	105 SONYA FAYE LN; SONYA FAYE	BEAUFORT, SC 29906 8924	N-Black, Non-Hisp / Male	M	1983-05-29	41	6'02"	170	49266	2024-09-22	02:19:00	2024-09-23	16:10:00	http://mugshots.bcgov.net/images/30/38930/24092202213700.jpeg	2024-11-07 22:00:05.640627
12867	SWEZEY	KENT	RUSSEL	HOMELESS	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1971-07-26	53	5'07"	160	49332	2024-09-25	21:02:00	2024-09-26	10:23:00	http://mugshots.bcgov.net/images/85/109485/24092522364000.jpeg	2024-11-07 22:00:05.643761
12868	TAMBURIC	ADIS		16 D OLD SOUTH CT	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1990-09-19	34	6'03"	190	49756	2024-11-03	02:47:00	2024-11-03	11:50:00	http://mugshots.bcgov.net/images/00/386800/24110303102600.jpeg	2024-11-07 22:00:05.646078
12869	TARPIN	ANGELA	BROOKE	32 SHAMROCK CIR; SHAMROCK CIRCLE	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Female	F	1985-06-26	39	5'04"	160	48936	2024-08-28	02:46:00	2024-08-28	10:46:00	http://mugshots.bcgov.net/images/42/89342/24082803115800.jpeg	2024-11-07 22:00:05.647701
12870	TAYLOR	CHRISTOPHER	JAMES	15433 ANN ARDEN AVE.	WOODBRIDGE, VA 22193	N-White, Non-Hisp / Male	M	1983-09-12	41	6'00"	200	49140	2024-09-12	11:11:00	2024-09-18	20:59:00	http://mugshots.bcgov.net/images/47/260747/24091211155500.jpeg	2024-11-07 22:00:05.649089
12871	TAYLOR	JAMES	ANTOINNE	518 frontage rd	Cty of Hardeevl, SC 29927	N-Black, Non-Hisp / Male	M	1982-03-18	42	6'01"	215	49264	2024-09-22	00:55:00	2024-09-23	19:19:00	http://mugshots.bcgov.net/images/08/212408/24092201005000.jpeg	2024-11-07 22:00:05.650925
12872	TAYLOR	RAYMOUND	RAHEEN	14 CHAMPION DR	St Helena Islan, SC 29920	N-Black, Non-Hisp / Male	M	1984-08-18	40	6'02"	176	49429	2024-10-04	12:02:00	\N	\N	http://mugshots.bcgov.net/images/47/43347/24100412054000.jpeg	2024-11-07 22:00:05.652446
12873	TERRY-MITCHELL	KENNARD	TREVOR	17 LAWSON RD	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	2003-06-04	21	5'05"	120	49722	2024-10-30	13:20:00	\N	\N	http://mugshots.bcgov.net/images/22/331122/24103014383300.jpeg	2024-11-07 22:00:05.654702
12874	THOMAS	CHANCE	NATHANIEL	4044 SHELL POINT RD; SHELL POINT	Beaufort, SC 29906	N-White, Non-Hisp / Male	M	1999-04-19	25	5'11"	165	49675	2024-10-26	03:42:00	2024-10-26	10:32:00	http://mugshots.bcgov.net/images/24/386024/24102603562000.jpeg	2024-11-07 22:00:05.656704
12875	THOMAS	TIRON	LEE	5 CELY LN	Ladys Island, SC 29907	N-Black, Non-Hisp / Male	M	1983-09-28	41	5'06"	160	48762	2024-08-13	22:04:00	\N	\N	http://mugshots.bcgov.net/images/31/259231/24081323113900.jpeg	2024-11-07 22:00:05.65944
12876	THOMPSON	ASHLEY	SHANNON	850 ROCKING HORSE LANE	BLUFFTON, SC 29910	N-White, Non-Hisp / Female	F	1990-04-25	34	5'06"	165	49485	2024-10-08	21:11:00	2024-10-09	10:37:00	http://mugshots.bcgov.net/images/50/187350/24100821192400.jpeg	2024-11-07 22:00:05.66082
12877	THOMPSON	DONNA		50 YACHT COVE DR #310-315/320-331; WYNDEMERE	Hilton Head Isl, SC 29926	N-White, Non-Hisp / Female	F	1956-11-23	67	5'05"	150	48964	2024-08-30	22:43:00	2024-08-31	11:51:00	http://mugshots.bcgov.net/images/32/93032/24083103173300.jpeg	2024-11-07 22:00:05.663031
12878	THOMPSON	TAJAY	TAFARI	79 WILKINSON WAY # 12319; ENCLAVE AT BLUFFTON PARK	Twn of Bluffton, SC 29910	N-Black, Non-Hisp / Male	M	1996-02-13	28	6'00"	175	49422	2024-10-03	00:40:00	\N	\N	http://mugshots.bcgov.net/images/70/150170/24100303180400.jpeg	2024-11-07 22:00:05.664515
12879	THOMPSON	TAJAY	TAFARI	79 WILKINSON WAY # 12319; ENCLAVE AT BLUFFTON PARK	Twn of Bluffton, SC 29910	N-Black, Non-Hisp / Male	M	1996-02-13	28	6'00"	175	49424	2024-10-03	02:55:00	2024-10-03	12:33:00	http://mugshots.bcgov.net/images/70/150170/24100303180400.jpeg	2024-11-07 22:00:05.666597
12880	TIRADO	GAVIN	NICHOLAS	180 HEARTHWOOD	IRMO, SC 29063	N-White, Non-Hisp / Male	M	2005-06-06	19	6'01"	190	49003	2024-09-02	00:19:00	\N	\N	http://mugshots.bcgov.net/images/46/380646/24090203402300.jpeg	2024-11-07 22:00:05.668542
12881	TIRADO	GAVIN	NICHOLAS	180 HEARTHWOOD	IRMO, SC 29063	N-White, Non-Hisp / Male	M	2005-06-06	19	6'01"	190	49004	2024-09-02	03:10:00	2024-09-02	10:31:00	http://mugshots.bcgov.net/images/46/380646/24090203402300.jpeg	2024-11-07 22:00:05.669829
12882	TOMAS LOPEZ	JAIRO	EDUARDO	839 WILLIAM HILTON PARKWAY #3	HILTON HEAD ISL, SC 29926	H-White/Latin, Hispanic / Male	M	2000-05-27	24	5'05"	150	48801	2024-08-17	19:34:00	2024-08-19	10:54:00	http://mugshots.bcgov.net/images/61/367061/24081719361100.jpeg	2024-11-07 22:00:05.671325
12883	TORKKO	BRITTEN	ALEXANDER	14005 KADER ST	BEAUFORT, SC 29906	N-White, Non-Hisp / Male	M	1994-01-06	30	5'11"	130	48971	2024-08-31	04:12:00	2024-08-31	11:49:00	http://mugshots.bcgov.net/images/49/107749/24083104324000.jpeg	2024-11-07 22:00:05.674072
12884	TORRES	DIEGO	ALEJANDRO	257 GARDEN GATE CIR E	HARDEEVILLE, SC 29927 4172	H-White/Latin, Hispanic / Male	M	1970-02-14	54	5'08"	150	49736	2024-11-01	14:47:00	2024-11-02	10:43:00	http://mugshots.bcgov.net/images/26/267226/24110115001200.jpeg	2024-11-07 22:00:05.676095
12885	TORRES	FERNANDO	ANTONIO	224 RIVER AVE	PROVIDENCE, RI 02918	N-Black, Non-Hisp / Male	M	1988-10-27	36	5'06"	150	49331	2024-09-25	18:44:00	2024-10-08	13:17:00	http://mugshots.bcgov.net/images/77/383277/24092518505800.jpeg	2024-11-07 22:00:05.6778
12886	TORRES	RUBEN	DARIO	27 ABELL STREET	Twn of Bluffton, SC 299107616	H-White/Latin, Hispanic / Male	M	1997-10-03	27	5'10"	190	49622	2024-10-21	02:54:00	2024-10-21	12:56:00	http://mugshots.bcgov.net/images/30/84130/24102103085300.jpeg	2024-11-07 22:00:05.679033
12887	TRASK	AMY	BOREN	162 COOSAW CLUB DR	BEAUFORT, SC 29907 2143	N-White, Non-Hisp / Female	F	1968-09-19	56	5'04"	115	49681	2024-10-26	17:30:00	2024-10-27	11:28:00	http://mugshots.bcgov.net/images/16/7116/24102617475600.jpeg	2024-11-07 22:00:05.680706
12888	TUN	ZAW	MYO	HOMELESS	BEAUFORT, SC 29902	N-Asian/Pacific Islander, Non- / Male	M	1966-12-06	57	4'10"	140	48915	2024-08-26	14:47:00	2024-08-27	08:47:00	http://mugshots.bcgov.net/images/14/69014/24082615142600.jpeg	2024-11-07 22:00:05.682443
12889	ULLOA ALVARADO	LESTER	ELIAS	208 TWO HITCH RD	GOOSE CREEK, SC 29445	H-White/Latin, Hispanic / Male	M	2000-12-16	23	5'08"	160	49051	2024-09-05	16:54:00	2024-09-06	12:36:00	http://mugshots.bcgov.net/images/56/381056/24090517013100.jpeg	2024-11-07 22:00:05.683949
12890	VARGAS-CABALLERO	ERBERT	FRANCISCO	31 HILANDA DR; HILANDA MHP	Burton, SC 29906	H-White/Latin, Hispanic / Male	M	1988-07-01	36	5'06"	160	48958	2024-08-30	14:50:00	\N	\N	http://mugshots.bcgov.net/images/67/380467/24083015001200.jpeg	2024-11-07 22:00:05.686747
12891	VASQUEZ AYALA	BRAYAN	MAURICIO	49 KENWOOD DR	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	1986-11-15	37	5'07"	235	49059	2024-09-06	12:22:00	2024-09-07	09:58:00	http://mugshots.bcgov.net/images/86/342786/24090612350000.jpeg	2024-11-07 22:00:05.688255
12892	VELASQUEZ SILVA	CESAR	DAVID	7 6TH AVE; BLUFFTON PARK	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	1998-10-26	26	5'10"	190	49068	2024-09-06	21:17:00	2024-09-07	12:30:00	http://mugshots.bcgov.net/images/80/334180/24090621372000.jpeg	2024-11-07 22:00:05.690186
12893	VELAZQUEZ-MENDOZA	PEDRO		25 EAGLE RD	Beaufort, SC 29936	H-White/Latin, Hispanic / Male	M	1988-11-22	35	5'05"	150	48728	2024-08-10	22:23:00	2024-08-13	08:44:00	http://mugshots.bcgov.net/images/04/378304/24081022270600.jpeg	2024-11-07 22:00:05.692828
12894	VELEZ-MURGUIA	BRYAN	JESUS	155 DILLON RD #2125	HILTON HEAD ISL, SC 29926	H-White/Latin, Hispanic / Male	M	1998-09-22	26	5'08"	180	49270	2024-09-22	03:36:00	\N	\N	http://mugshots.bcgov.net/images/71/382771/24092207344300.jpeg	2024-11-07 22:00:05.696003
12895	VILLALON LEDEZMA	OMAR		370 SQUIRE POPE RD LOT F	HILTON HEAD ISL, SC 29926	H-White/Latin, Hispanic / Male	M	2004-04-07	20	5'05"	170	48883	2024-08-24	03:32:00	2024-08-28	19:45:00	http://mugshots.bcgov.net/images/80/375680/24082403492000.jpeg	2024-11-07 22:00:05.698553
12896	VITTO	ALEXANDER	MARINO	18 PEREGRINE DRIVE	HILTON HEAD, SC 29928	N-White, Non-Hisp / Male	M	1988-09-16	36	6'00"	200	49197	2024-09-16	17:20:00	2024-09-17	09:29:00	http://mugshots.bcgov.net/images/25/124225/24091617365400.jpeg	2024-11-07 22:00:05.702481
12897	VONVILLE	SHAD	MICHAEL	2023 STONE MARTEN DR; MINK POINT PLANTATIO	City of Bft, SC	N-White, Non-Hisp / Male	M	1976-11-17	47	5'10"	160	49425	2024-10-03	03:30:00	2024-10-29	17:54:00	http://mugshots.bcgov.net/images/50/338950/24100304203700.jpeg	2024-11-07 22:00:05.704073
12898	WAITEKUS	JOSEPH	HENRY	HOMELESS	BLUFFTON, SC 29910	N-White, Non-Hisp / Male	M	1993-05-01	31	5'11"	180	48783	2024-08-16	16:03:00	2024-08-19	15:32:00	http://mugshots.bcgov.net/images/04/104/24081616242100.jpeg	2024-11-07 22:00:05.706925
12899	WALKER	DANTE	CORNELIUS	3644 OYSTER BLUFF DR; OYSTER BLUFF	BEAUFORT, SC 29907 1506	N-Black, Non-Hisp / Male	M	1996-08-15	28	5'09"	158	49083	2024-09-08	02:29:00	2024-09-08	12:15:00	http://mugshots.bcgov.net/images/64/381264/24090803125500.jpeg	2024-11-07 22:00:05.710029
12900	WALKER	JAMES	ALAN	205 STUART TOWN RD	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1976-11-10	47	5'11"	205	48927	2024-08-27	13:03:00	2024-08-27	14:43:00	http://mugshots.bcgov.net/images/92/379992/24082917165100.jpeg	2024-11-07 22:00:05.711442
12901	WALKER	JAMES	ALAN	205 STUART TOWN RD	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1976-11-10	47	5'11"	205	48949	2024-08-29	17:12:00	2024-08-30	15:11:00	http://mugshots.bcgov.net/images/92/379992/24082917165100.jpeg	2024-11-07 22:00:05.714392
12902	WALKER	JERMAINE		8 SOUTHWOOD PARK DR APT 117	HILTON HEAD ISL, SC 29926 2467	N-Black, Non-Hisp / Male	M	1989-06-30	35	5'07"	145	49262	2024-09-22	01:46:00	2024-10-22	10:11:00	http://mugshots.bcgov.net/images/83/90783/24092203321700.jpeg	2024-11-07 22:00:05.716794
12903	WALKER	JOHN	PATRICK	319 S. College St.	Wallace, NC 28466	N-White, Non-Hisp / Male	M	1985-06-03	39	5'04"	130	49403	2024-10-01	13:27:00	2024-10-18	05:50:00	http://mugshots.bcgov.net/images/69/309469/24100113270100.jpeg	2024-11-07 22:00:05.718888
12904	WALKER	LAWRENCE	DARNELL	HOMELESS	HILTON HEAD ISL, SC 29928	N-Black, Non-Hisp / Male	M	1988-09-24	36	6'02"	300	49293	2024-09-24	10:18:00	2024-10-24	10:59:00	http://mugshots.bcgov.net/images/86/25586/24092410450900.jpeg	2024-11-07 22:00:05.720332
12905	WALKER	MELIK	WALTER	4 BEACON DR	St Helena Islan, SC 29920	N-Black, Non-Hisp / Male	M	1994-06-16	30	5'08"	212	49552	2024-10-14	10:06:00	2024-10-14	15:10:00	http://mugshots.bcgov.net/images/90/55290/24101411302100.jpeg	2024-11-07 22:00:05.721587
12906	WALLS	BRIAN	DAVID	South Carolina Department of Corrections	Shell Point,	N-White, Non-Hisp / Male	M	1981-03-30	43	5'11"	260	48853	2024-08-22	08:50:00	2024-08-29	16:30:00	http://mugshots.bcgov.net/images/76/36576/24082209163300.jpeg	2024-11-07 22:00:05.723721
12907	WALLS	DANIEL	EVAN	7076 L.H. NELSON	Beaufort, SC 29906	N-White, Non-Hisp / Male	M	2004-09-30	20	4'09"	120	49110	2024-09-10	12:29:00	2024-09-10	15:41:00	http://mugshots.bcgov.net/images/54/200354/24091012430300.jpeg	2024-11-07 22:00:05.725442
12908	WALSTRUM	JENNIFER	ELAINE	1311 HIGH ST	LEAVENWORTH, KS 66048	N-White, Non-Hisp / Female	F	1980-10-19	44	5'05"	160	48814	2024-08-18	19:40:00	2024-08-19	09:38:00	http://mugshots.bcgov.net/images/41/379041/24081900322600.jpeg	2024-11-07 22:00:05.727224
12909	WARD	MEREDITH	GRACE	75 RIVERCHASE BLVD APT 615	BURTON, SC 29906	Unknown / Female	F	2000-03-13	24	5'01"	100	48848	2024-08-22	03:18:00	2024-08-22	10:58:00	http://mugshots.bcgov.net/images/31/379431/24082207523800.jpeg	2024-11-07 22:00:05.728805
12910	WARD	RALEIGH	VINCENT	7 TORREY LN; PINE RIDGE	Twn of Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1980-10-09	44	6'00"	190	49532	2024-10-12	00:00:00	\N	\N	http://mugshots.bcgov.net/images/70/10770/24101220453100.jpeg	2024-11-07 22:00:05.73026
12911	WARD	RALEIGH	VINCENT	7 TORREY LN; PINE RIDGE	Twn of Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1980-10-09	44	6'00"	190	49534	2024-10-12	20:23:00	2024-10-13	10:55:00	http://mugshots.bcgov.net/images/70/10770/24101220453100.jpeg	2024-11-07 22:00:05.731779
12912	WARREN	JEREMIAH	KIEYONTE	37 NO MAN LAND ROAD	BEAUFORT, SC 29920	N-Black, Non-Hisp / Male	M	2006-07-09	18	5'06"	150	49283	2024-09-23	13:40:00	\N	\N	http://mugshots.bcgov.net/images/99/36999/24092316481000.jpeg	2024-11-07 22:00:05.733332
12913	WARREN	JULIANNA	MULLINS	818 PAUL DR; MOSSY OAKS PARK	City of Bft, SC	N-White, Non-Hisp / Female	F	1973-08-29	51	5'03"	130	48725	2024-08-10	14:03:00	2024-08-22	17:57:00	http://mugshots.bcgov.net/images/88/82088/24100418184800.jpeg	2024-11-07 22:00:05.735526
12914	WARREN	JULIANNA	MULLINS	818 PAUL DR; MOSSY OAKS PARK	City of Bft, SC	N-White, Non-Hisp / Female	F	1973-08-29	51	5'03"	130	49448	2024-10-04	18:16:00	2024-10-05	10:34:00	http://mugshots.bcgov.net/images/88/82088/24100418184800.jpeg	2024-11-07 22:00:05.737017
12915	WASHINGTON	ETHAN TYRE	LYNELL	4881 BEES CREEK RD	RIDGELAND, SC 29936	N-Black, Non-Hisp / Male	M	2003-11-21	20	5'05"	120	49387	2024-09-30	15:33:00	2024-10-08	17:08:00	http://mugshots.bcgov.net/images/51/291151/24093015352500.jpeg	2024-11-07 22:00:05.738705
12916	WASHINGTON	JAMARION	NY'KEEM	133 WISE ST	RIDGELAND, SC 29936	N-Black, Non-Hisp / Male	M	2004-10-28	20	5'04"	158	49301	2024-09-24	20:53:00	2024-09-25	11:01:00	http://mugshots.bcgov.net/images/11/326911/24092421072300.jpeg	2024-11-07 22:00:05.74052
12917	WATKINS	ELIJAH	DESHAUN	160 BROAD RIVER BLVD	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	2003-11-10	20	6'00"	220	49104	2024-09-09	23:10:00	\N	\N	http://mugshots.bcgov.net/images/61/87561/24090923172300.jpeg	2024-11-07 22:00:05.742881
12918	WATKINS	HENRY	TOMARI	181 CUFFY RD	SAINT HELENA IS, SC 29920	N-Black, Non-Hisp / Male	M	1995-03-15	29	5'09"	120	48884	2024-08-24	09:44:00	2024-08-25	10:46:00	http://mugshots.bcgov.net/images/56/7456/24082409485000.jpeg	2024-11-07 22:00:05.74553
12919	WATKINS	MARQUISE	DYQUAN	160 BROAD RIVER BLVD	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	2005-06-13	19	5'11"	220	49285	2024-09-23	15:35:00	2024-09-24	10:27:00	http://mugshots.bcgov.net/images/92/130992/24092919525200.jpeg	2024-11-07 22:00:05.747034
12920	WATKINS	MARQUISE	DYQUAN	160 BROAD RIVER BLVD	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	2005-06-13	19	5'11"	220	49379	2024-09-29	19:35:00	\N	\N	http://mugshots.bcgov.net/images/92/130992/24092919525200.jpeg	2024-11-07 22:00:05.748522
12921	WATSON	OMAR	ROSHAWN	8 ARTHUR BLUE DRIVE	SHELDON, SC 29941	N-Black, Non-Hisp / Male	M	1979-05-31	45	6'01"	160	49691	2024-10-27	12:26:00	\N	\N	http://mugshots.bcgov.net/images/88/15288/24102712571900.jpeg	2024-11-07 22:00:05.750297
12922	WATSON	QUINTON	LAJOHN	62 DELANEY CIR	Seabrook, SC 29940	N-Black, Non-Hisp / Male	M	1991-03-14	33	6'01"	180	49631	2024-10-22	16:52:00	\N	\N	http://mugshots.bcgov.net/images/29/4429/24102217155700.jpeg	2024-11-07 22:00:05.752268
12923	WEATHERFORD	ADAM	MITCHELL	132 LAKE LINDEN DR	BLUFFTON, SC 29910	N-White, Non-Hisp / Male	M	1983-12-07	40	6'04"	240	49304	2024-09-25	01:43:00	2024-09-25	11:14:00	http://mugshots.bcgov.net/images/43/226543/24092501480000.jpeg	2024-11-07 22:00:05.754046
12924	WEBB	DAVID	STANLEY	155 DILLON RD APT 2027	HILTON HEAD, SC 29926 3737	N-Black, Non-Hisp / Male	M	1982-10-22	42	6'01"	215	48934	2024-08-27	23:58:00	2024-08-28	10:31:00	http://mugshots.bcgov.net/images/39/36039/24082800175300.jpeg	2024-11-07 22:00:05.755328
12925	WELLS	CEDRIC	JAMES MALIK	1036 PINEVALE DRIVE	COLUMBIA, SC 29203	N-Black, Non-Hisp / Male	M	1996-10-23	28	6'00"	275	49550	2024-10-14	03:24:00	2024-10-14	10:31:00	http://mugshots.bcgov.net/images/65/384965/24101404265200.jpeg	2024-11-07 22:00:05.757135
12926	WELLS	COREY	ALLEN	1105 WILMINGTON ISLAND RD	Savannah, GA 31410	N-White, Non-Hisp / Male	M	1996-06-11	28	5'10"	160	49001	2024-09-01	23:21:00	2024-09-02	10:40:00	http://mugshots.bcgov.net/images/34/380634/24090200023100.jpeg	2024-11-07 22:00:05.7607
12927	WHIBBEY	MARK	DENNIS	HOMELESS	BEAUFORT, SC 29940	N-Black, Non-Hisp / Male	M	1998-02-18	26	5'06"	130	48861	2024-08-22	16:58:00	\N	\N	http://mugshots.bcgov.net/images/33/20333/24082217033700.jpeg	2024-11-07 22:00:05.76196
12928	WHITFIELD	ROBERT	BROOKS	243 CLUB GATE DR; ROSE HILL PLANTATION	Bluffton, SC 29910	N-White, Non-Hisp / Male	M	1962-11-24	61	5'08"	250	48812	2024-08-18	14:42:00	2024-08-19	09:31:00	http://mugshots.bcgov.net/images/24/187324/24081814344300.jpeg	2024-11-07 22:00:05.763432
12929	WILLARD	JAMES	FRANKLIN	13 COBURN DR E; SUN CITY HILTON HEAD	Okatie, SC 29909 4573	N-White, Non-Hisp / Male	M	2033-04-23	91	5'11"	195	48824	2024-08-19	13:13:00	2024-08-19	15:17:00	http://mugshots.bcgov.net/images/50/17850/24081913212700.jpeg	2024-11-07 22:00:05.765102
12930	WILLIAMS	ALACIA	CAROLYN	43 WILLIAM JENKINS RD	SAINT HELENA IS, SC 29920 3419	N-Black, Non-Hisp / Female	F	1999-11-20	24	5'01"	143	49255	2024-09-21	13:02:00	2024-09-22	13:30:00	http://mugshots.bcgov.net/images/44/176944/24092114381000.jpeg	2024-11-07 22:00:05.766569
12931	WILLIAMS	DAMON	LASALLE	49 GOETHE HILL RD	Beaufort, SC 29906	N-Black, Non-Hisp / Male	M	1970-12-20	53	5'07"	180	49199	2024-09-17	00:50:00	\N	\N	http://mugshots.bcgov.net/images/33/10833/24091701052000.jpeg	2024-11-07 22:00:05.768076
12932	WILLIAMS	DESHAUN	LAMONT	100 ASHTON POINTE BLVD; ABBERLY POINTE APTS	Twn Port Royal, SC	N-Black, Non-Hisp / Male	M	1979-09-01	45	5'05"	150	48990	2024-09-01	04:01:00	2024-09-01	14:28:00	http://mugshots.bcgov.net/images/21/14121/24090104304400.jpeg	2024-11-07 22:00:05.77083
12933	WILLIAMS	DWAYNE		86 BULL CORNER RD	YEMASSEE, SC 29945	N-Black, Non-Hisp / Male	M	1964-07-08	60	5'07"	200	49740	2024-11-01	22:18:00	\N	\N	http://mugshots.bcgov.net/images/18/21518/24110122385200.jpeg	2024-11-07 22:00:05.773771
12934	WILLIAMS	GEORGE	ANTHONY	325 AMBROSE RUN APT 405	BEAFORT, SC 29906	N-Black, Non-Hisp / Male	M	1981-04-12	43	5'11"	187	49582	2024-10-16	05:28:00	\N	\N	http://mugshots.bcgov.net/images/26/2326/23081618075700.jpeg	2024-11-07 22:00:05.776903
12935	WILLIAMS	GEORGE	ANTHONY	325 AMBROSE RUN APT 405	BEAFORT, SC 29906	N-Black, Non-Hisp / Male	M	1981-04-12	43	5'11"	187	49573	2024-10-16	07:43:00	\N	\N	http://mugshots.bcgov.net/images/26/2326/23081618075700.jpeg	2024-11-07 22:00:05.77865
12936	WILLIAMS	HARMONI	NICOLE	6 LANDON WAY	BEAUFORT, SC 29906	N-Black, Non-Hisp / Female	F	2006-06-12	18	5'09"	146	49718	2024-10-30	01:04:00	2024-10-30	10:29:00	http://mugshots.bcgov.net/images/30/70630/24103001180700.jpeg	2024-11-07 22:00:05.779946
12937	WILLIAMS	JOANN	LEE	809 Holly St W Apt 431	Hampton, SC 29924	N-Black, Non-Hisp / Female	F	1975-09-03	49	5'07"	265	48858	2024-08-22	15:20:00	2024-08-23	15:51:00	http://mugshots.bcgov.net/images/22/348122/24082215285600.jpeg	2024-11-07 22:00:05.78168
12938	WILLIAMS	KADEN	JERMIAH	4881 Bees Creek Road	Ridgeland, SC 29936	N-Black, Non-Hisp / Male	M	2006-07-21	18	5'09"	150	48750	2024-08-12	13:35:00	2024-08-12	15:19:00	http://mugshots.bcgov.net/images/31/258531/24081213314800.jpeg	2024-11-07 22:00:05.783653
12939	WILLIAMS	KAMRIN	MALIK	1828 JENKINS AVE	HARDEEVILLE, SC 29927	N-Black, Non-Hisp / Male	M	1998-12-24	25	5'07"	200	48987	2024-09-01	05:31:00	2024-09-01	13:44:00	http://mugshots.bcgov.net/images/18/194318/24090105293400.jpeg	2024-11-07 22:00:05.787862
12940	WILLIAMS	MICHELLE	ELLESA	222 MAY RIVER RD	Pritchardville, SC 29910	N-Black, Non-Hisp / Female	F	1995-10-08	29	5'05"	110	49122	2024-09-11	03:51:00	2024-09-11	11:09:00	http://mugshots.bcgov.net/images/22/11922/24091103462800.jpeg	2024-11-07 22:00:05.790015
12941	WILLIAMS	RASHOD	LORENZO	22 CRAIG LN; SAND HILL ESTATES	Grays Hill, SC 29906	N-Black, Non-Hisp / Male	M	2006-09-09	18	6'03"	227	49240	2024-09-15	22:04:00	\N	\N	http://mugshots.bcgov.net/images/53/276153/24092021280300.jpeg	2024-11-07 22:00:05.791793
12942	WILLIAMS	RASHOD	LORENZO	22 CRAIG LN; SAND HILL ESTATES	Grays Hill, SC 29906	N-Black, Non-Hisp / Male	M	2006-09-09	18	6'03"	227	49241	2024-09-20	20:56:00	\N	\N	http://mugshots.bcgov.net/images/53/276153/24092021280300.jpeg	2024-11-07 22:00:05.794406
12943	WILLIAMS	STACY	ANN	45 GUERRARD AVE	Twn of Bluffton, SC 29910	N-White, Non-Hisp / Female	F	1978-07-20	46	5'04"	130	49502	2024-10-10	00:32:00	2024-10-10	09:28:00	http://mugshots.bcgov.net/images/03/119603/24101001103000.jpeg	2024-11-07 22:00:05.796815
12944	WILLIAMS	TIERRA	MICHELLE	114 JONESVILLE RD	Hilton Head Isl, SC 29926	N-Black, Non-Hisp / Female	F	1994-06-04	30	5'00"	100	49482	2024-10-08	17:54:00	2024-10-20	11:09:00	http://mugshots.bcgov.net/images/98/25398/24100818260900.jpeg	2024-11-07 22:00:05.798509
12945	WILLIAMS	WAYNE	ERIC	homeless	BEAUFORT, SC 29902	N-Black, Non-Hisp / Male	M	1972-07-18	52	5'07"	178	48798	2024-08-17	11:08:00	2024-08-18	11:46:00	http://mugshots.bcgov.net/images/12/38512/24081711165700.jpeg	2024-11-07 22:00:05.799758
12946	WILLIS	JAMES	JAQUESS ALEXANDER	490 ORDELL CT	WALTERBORO, SC 29488	N-Black, Non-Hisp / Male	M	1997-11-15	26	5'09"	180	48719	2024-08-09	22:43:00	2024-08-12	13:57:00	http://mugshots.bcgov.net/images/93/301793/24080922493600.jpeg	2024-11-07 22:00:05.801385
12947	WILLIS	WILLIAM	HENRY	3105 DOWNES GROVE RD	COLUMBIA, SC 29209 4126	N-White, Non-Hisp / Male	M	1982-03-10	42	5'07"	175	48894	2024-08-25	03:58:00	2024-08-25	11:12:00	http://mugshots.bcgov.net/images/68/216668/24082504191700.jpeg	2024-11-07 22:00:05.803391
12948	WILSON	CINDY	ELIZABETH	2500 DUKE ST; Waters at Ribaut Apa	City of Bft, SC 29902	N-Black, Non-Hisp / Female	F	1980-06-23	44	5'02"	117	48889	2024-08-24	21:01:00	2024-08-25	10:18:00	http://mugshots.bcgov.net/images/76/165076/24082508521200.jpeg	2024-11-07 22:00:05.804883
12949	WILSON	JEFFREY	BRYAN	4 INDIGO RUN DR APT 3811	HILTON HEAD ISL, SC 29926	N-White, Non-Hisp / Male	M	1973-09-26	51	6'02"	200	49300	2024-09-24	22:23:00	2024-09-28	14:17:00	http://mugshots.bcgov.net/images/18/112918/24092503483400.jpeg	2024-11-07 22:00:05.806388
12950	WILSON	RA DAVION	SHARIKIS	homeless	Hilton Head Isl, SC 29926	N-Black, Non-Hisp / Male	M	1991-11-11	32	6'01"	185	49253	2024-09-21	11:22:00	\N	\N	http://mugshots.bcgov.net/images/93/65793/24092111275600.jpeg	2024-11-07 22:00:05.809478
12951	WILTSHIRE	HARRY	JAMES	75 OLD MILL XING; HERITAGE @ NEW RIVER	Twn of Bluffton, SC 29910	N-Black, Non-Hisp / Male	M	2007-06-06	17	6'05"	150	49305	2024-09-25	23:53:00	\N	\N	http://mugshots.bcgov.net/images/84/368984/24110414380000.JPG GCK8icvz+88JErTMIXikIxRA/iA=SCDMV 06/02/2023                 	2024-11-07 22:00:05.811366
12952	WINDE	ASHLEIGH	BROOKE	1033 Round Top Church Rd	Blythewood, SC 29016	N-White, Non-Hisp / Female	F	1997-06-20	27	5'01"	120	49062	2024-09-06	15:00:00	2024-09-18	21:03:00	http://mugshots.bcgov.net/images/58/253658/24090615023800.jpeg	2024-11-07 22:00:05.8131
12953	WOODARD	JACOB	WAYNE	1037 PLANTATION DR	HARDEEVILLE, SC 29927	N-White, Non-Hisp / Male	M	1982-03-13	42	6'00"	140	49350	2024-09-27	15:52:00	2024-09-28	12:55:00	http://mugshots.bcgov.net/images/56/83456/24092716054300.jpeg	2024-11-07 22:00:05.814497
12954	WOODFILL	JACOB	HUNTER	18 HAROLD DR	BEAUFORT, SC 29906 8818	N-White, Non-Hisp / Male	M	1998-09-02	26	5'09"	138	49342	2024-09-26	14:26:00	2024-09-27	12:03:00	http://mugshots.bcgov.net/images/52/10352/24092614341800.jpeg	2024-11-07 22:00:05.816763
12955	WOODLEY	ANDREW	RYAN JAMES	18 BRILIANT LANE	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1996-09-07	28	6'01"	185	48748	2024-08-12	09:48:00	2024-09-26	04:46:00	http://mugshots.bcgov.net/images/30/36830/24100601453300.jpeg	2024-11-07 22:00:05.819351
12956	WOODLEY	ANDREW	RYAN JAMES	18 BRILIANT LANE	BEAUFORT, SC 29902	N-White, Non-Hisp / Male	M	1996-09-07	28	6'01"	185	49458	2024-10-06	01:35:00	2024-10-06	11:23:00	http://mugshots.bcgov.net/images/30/36830/24100601453300.jpeg	2024-11-07 22:00:05.820955
12957	WRIGHT	ANGELIQUE		11 SOUTHWOOD PARK DR APT 65	HILTON HEAD ISL, SC 29926	N-Black, Non-Hisp / Female	F	1982-12-09	41	5'09"	196	49679	2024-10-26	08:48:00	2024-10-26	12:11:00	http://mugshots.bcgov.net/images/93/359693/24102609100600.jpeg	2024-11-07 22:00:05.823988
12958	WRIGHT	CHRISTOPHER	LAMONT	590 HENRY LAWTON RD	RIDGELAND, SC 29936 6414	N-Black, Non-Hisp / Male	M	1984-09-07	40	6'00"	180	49608	2024-10-19	18:07:00	\N	\N	http://mugshots.bcgov.net/images/86/227786/24101920080900.jpeg	2024-11-07 22:00:05.826004
12959	WRIGHT	CHRISTOPHER	LAMONT	590 HENRY LAWTON RD	RIDGELAND, SC 29936 6414	N-Black, Non-Hisp / Male	M	1984-09-07	40	6'00"	180	49610	2024-10-19	20:04:00	2024-10-20	11:52:00	http://mugshots.bcgov.net/images/86/227786/24101920080900.jpeg	2024-11-07 22:00:05.827761
12960	WRIGHT	CLIFTON	JERMAINE	10 SAINT CLAIR STREET	YEMASSEE, SC 29945	N-Black, Non-Hisp / Male	M	1985-01-28	39	6'01"	165	49753	2024-11-02	21:15:00	2024-11-03	11:10:00	http://mugshots.bcgov.net/images/82/326582/24110221250000.jpeg	2024-11-07 22:00:05.828316
12961	WRIGHT	DERICK	LAMONT	100 PECAN GROVE LANE	RIDGELAND, SC 29936	N-Black, Non-Hisp / Male	M	1979-11-15	44	5'08"	280	49388	2024-09-30	15:57:00	2024-10-08	13:35:00	http://mugshots.bcgov.net/images/87/113587/24093015593000.jpeg	2024-11-07 22:00:05.831051
12962	WRIGHT	FREDRICK	ESTEVAN	13 OLD SOUTH CT APT A	BLUFFTON, SC 29910 8602	N-Black, Non-Hisp / Male	M	1984-05-21	40	6'01"	200	49514	2024-10-11	07:28:00	2024-10-11	09:58:00	http://mugshots.bcgov.net/images/61/372361/24101107371300.jpeg	2024-11-07 22:00:05.832986
12963	WRIGHT	JAMARE	SHAKELL	796 STELLARS JAY GRANDVILLE	RIDGELAND, SC 29936	N-Black, Non-Hisp / Male	M	1995-03-11	29	5'09"	140	49410	2024-10-02	13:13:00	2024-10-02	16:47:00	http://mugshots.bcgov.net/images/42/323742/24100213263000.jpeg	2024-11-07 22:00:05.834662
12964	WRIGHT	MARVIN		182 Orange Grove Road	Ridgeland, SC 29936	N-Black, Non-Hisp / Male	M	1970-11-15	53	6'03"	198	49385	2024-09-30	15:05:00	2024-10-08	13:33:00	http://mugshots.bcgov.net/images/29/181829/24093015264100.jpeg	2024-11-07 22:00:05.836622
12965	WURM	MARK	WILLIAM	21 CEDARWOOD ST; Shell Point Farm	Twn Port Royal, SC 29906	N-White, Non-Hisp / Male	M	1988-11-07	36	5'08"	220	48840	2024-08-21	07:52:00	\N	\N	http://mugshots.bcgov.net/images/64/379064/24082109343800.jpeg	2024-11-07 22:00:05.838807
12966	YACKO	JESSICA	ANN	206 Maple St.	Irwin, PA 15642	N-White, Non-Hisp / Female	F	1994-05-20	30	5'05"	180	49133	2024-09-11	17:27:00	2024-09-12	13:36:00	http://mugshots.bcgov.net/images/25/381625/24091117402400.jpeg	2024-11-07 22:00:05.842491
12967	YOUNG	ALAYSIA	KHALIA	96 ALFRED LN	HILTON HEAD, SC 29926 2025	N-Black, Non-Hisp / Female	F	2000-11-08	23	5'04"	132	48833	2024-08-20	01:40:00	2024-08-20	12:48:00	http://mugshots.bcgov.net/images/18/260018/24090423112700.jpeg	2024-11-07 22:00:05.844932
12968	YOUNG	ALAYSIA	KHALIA	96 ALFRED LN	HILTON HEAD, SC 29926 2025	N-Black, Non-Hisp / Female	F	2000-11-08	23	5'04"	132	49042	2024-09-04	22:57:00	2024-09-05	14:59:00	http://mugshots.bcgov.net/images/18/260018/24090423112700.jpeg	2024-11-07 22:00:05.846419
12969	YOUNG	DERIO	DEMON	28 GLAZE DRIVE	BEAUFORT, SC 29906	N-Black, Non-Hisp / Male	M	1997-06-04	27	5'08"	198	48822	2024-08-19	10:03:00	2024-09-20	05:04:00	http://mugshots.bcgov.net/images/37/34337/24081910085800.jpeg	2024-11-07 22:00:05.847963
12970	YOUNG	DESIRE'E	CHANTEL	618 WILLIAM HILTON PKWY # B; B	Hilton Head Isl, SC 29928	N-Black, Non-Hisp / Female	F	1992-08-04	32	5'03"	180	49788	2024-11-05	15:51:00	2024-11-06	10:07:00	http://mugshots.bcgov.net/images/50/26850/24110517474500.jpeg	2024-11-07 22:00:05.849648
12971	YOUNG	KAMAL	HAREEM	8 SOUTHWOOD PARK DR #133	HILTON HEAD ISL, SC 29926	N-Black, Non-Hisp / Male	M	2002-01-21	22	6'01"	160	49787	2024-11-05	12:50:00	2024-11-06	12:57:00	http://mugshots.bcgov.net/images/92/60792/24110608360100.jpeg	2024-11-07 22:00:05.851078
12972	YOUNG	LARI	B	11 BELLE ISLE FARMS	BEAUFORT, SC 29907 2387	N-White, Non-Hisp / Female	F	1957-07-21	67	5'01"	125	49656	2024-10-25	01:10:00	2024-10-25	10:43:00	http://mugshots.bcgov.net/images/72/232672/24102501264900.jpeg	2024-11-07 22:00:05.85343
12973	YOUNG	THEODORE	JAMEL	HOMELESS	Hilton Head Isl, SC 29926	N-Black, Non-Hisp / Male	M	1989-03-24	35	6'02"	290	48780	2024-08-16	02:19:00	2024-08-16	11:07:00	http://mugshots.bcgov.net/images/65/370565/24081602375800.jpeg	2024-11-07 22:00:05.855635
12974	YOUNG	THEODORE	JAMEL	HOMELESS	Hilton Head Isl, SC 29926	N-Black, Non-Hisp / Male	M	1989-03-24	35	6'02"	290	48839	2024-08-20	22:03:00	2024-09-05	14:50:00	http://mugshots.bcgov.net/images/65/370565/24081602375800.jpeg	2024-11-07 22:00:05.8575
12975	YOUNG	WILLIE	LAMONT	212 SAXONVILLE RD	St Helena Islan, SC 29920	N-Black, Non-Hisp / Male	M	1995-03-05	29	5'08"	148	48981	2024-09-01	00:01:00	2024-09-01	10:55:00	http://mugshots.bcgov.net/images/76/311376/24090100135100.jpeg	2024-11-07 22:00:05.861793
12976	YOUNGDAHL	TODD	PAUL	27 HONEYSUCKLE LN	BEAUFORT, SC 29907 2108	N-White, Non-Hisp / Male	M	1967-08-11	57	5'08"	180	48779	2024-08-16	00:47:00	2024-08-16	10:34:00	http://mugshots.bcgov.net/images/30/44930/24081601042300.jpeg	2024-11-07 22:00:05.863282
12977	ZAMORA	KARINA	ZAMORA	8 MURRY AVE	HILTON HEAD ISL, SC 29926 1505	H-White/Latin, Hispanic / Female	F	1991-02-23	33	4'11"	210	49263	2024-09-22	00:39:00	2024-09-22	13:36:00	http://mugshots.bcgov.net/images/75/299575/24092200465000.jpeg	2024-11-07 22:00:05.864748
12978	ZELAYA	HECTOR	ADOLFO	36 WOODLAND HILLS DR	BLUFFTON, SC 29910	H-White/Latin, Hispanic / Male	M	1999-10-28	25	5'08"	220	49674	2024-10-26	04:16:00	2024-10-26	13:34:00	http://mugshots.bcgov.net/images/62/76462/24102604350900.jpeg	2024-11-07 22:00:05.866474
\.


--
-- Data for Name: offense; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offense (id, arrest_id, offense_code, offense_description, offense_location, bond_amount, court, last_updated) FROM stdin;
19676	11981	56-05-2930(A)	20240190231863	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:03.887252
19677	11981	56-01-0020	20240190231862	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:03.889993
19678	11981	ICE		ICE Hold	0.00		2024-11-07 22:00:03.890911
19679	11982	56-05-2930(A)	20240180122049	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:03.89404
19680	11983	44-53-0370(D)(5)		POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00		2024-11-07 22:00:03.896198
19681	11983	56-03-0110		PERMITTING OR OPERATING VEHICLE WHICH IS NOT REGISTERED AND LICENSED	0.00		2024-11-07 22:00:03.896853
19682	11984	9-1005	20240180124522	Trespassing	465.00	Beaufort City Municipal Court	2024-11-07 22:00:03.898546
19683	11985	00-00-0000L	20242170015555	VIOLATION OF CITY ORDINANCE (USE STATE CODE IF POSSIBLE)	0.00	Port Royal Municipal Court	2024-11-07 22:00:03.900548
19684	11985	61-04-0110	20242170015554`	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Port Royal Municipal Court	2024-11-07 22:00:03.901016
19685	11986	16-13-0110(A)	20240190227542	SHOPLIFTING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:03.902834
19686	11987	Magistrate Bench Warrant	20240190199163	Magistrate Bench Warrant	0.00	Bluffton Magistrate Court	2024-11-07 22:00:03.904403
19687	11988	16-17-0530	20240190183613	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:03.90641
19688	11989	56-05-2930(A)	20240190214041	DRIVING UNDER THE INFLUENCE (DUI)	0.00	General Sessions Court	2024-11-07 22:00:03.908337
19689	11990	ISH		In-State Hold	0.00		2024-11-07 22:00:03.910356
19690	11991	44-53-0370 (D) (5)	20242170016021	Marij/Poss 28g<10gr<Hash 1st	0.00	Port Royal Municipal Court	2024-11-07 22:00:03.912292
19691	11991	44-53-0370(D)(2)	2024A0720400165	POSS OF OTHER CONTROLLED SUB IN SCHED I TO V	0.00	Port Royal Municipal Court	2024-11-07 22:00:03.912855
19692	11992	Motion to Relieved Bond		Bond Revocation	0.00	General Sessions Court	2024-11-07 22:00:03.91453
19693	11993	16-11-0520(A)	2024A0720600291	MALICIOUS INJURY TO TREE, HOUSE; TRESPASS UPON REAL PROPERTY	0.00	General Sessions Court	2024-11-07 22:00:03.916191
19694	11993	16-09-0320(B)	16689/2024A0720600290	ASSAULT, BEAT, OR WOUND POLICE OFFICER SERVING PROCESS OR WHILE RESISTING ARREST	0.00	General Sessions Court	2024-11-07 22:00:03.916749
19695	11993	16-09-0320(A)	16688/2024A0720600289	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00	Beaufort City Municipal Court	2024-11-07 22:00:03.91747
19696	11993	16-11-0610	20240180110936	TRESPASSING	0.00	Beaufort City Municipal Court	2024-11-07 22:00:03.918178
19697	11994	7-7001	20240180122594	Appearing Drunk on Streets	0.00	Beaufort City Municipal Court	2024-11-07 22:00:03.920028
19698	11995	9-1005	20240180123547	Trespassing	0.00	Beaufort City Municipal Court	2024-11-07 22:00:03.922044
19699	11996	9-1005	20240180119230	Trespassing	465.00	Beaufort City Municipal Court	2024-11-07 22:00:03.923988
19700	11997	16-25-0020(C)	20242170015654	DOMESTIC VIOLENCE 2ND DEGREE	0.00	Port Royal Municipal Court	2024-11-07 22:00:03.927074
19701	11997	56-05-2930(A)	20242170015814	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:03.928304
19702	11998	56-01-0460(A)(2)(A)	2024A0720400162	DRIVING UNDER SUSPENSION; LICENSE SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Port Royal Municipal Court	2024-11-07 22:00:03.930797
19703	11999	16-11-0620	20242170015587	ENTERING PREMISES AFTER WARNING OR REFUSING TO LEAVE ON REQUEST	0.00	Port Royal Municipal Court	2024-11-07 22:00:03.932286
19704	12000	16-13-420(A)	2024A0710400191	Failure to return rented objects >10,000	0.00	General Sessions Court	2024-11-07 22:00:03.934129
19705	12001	16-03-0600(E)(1)	20242170015267	ASSAULT & BATTERY 3RD DEGREE	0.00	Port Royal Municipal Court	2024-11-07 22:00:03.936116
19706	12002	16-13-0110(A)	20240180121148	SHOPLIFTING	0.00	Beaufort City Municipal Court	2024-11-07 22:00:03.937836
19707	12003	16-17-0530	20240190228265	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort County Magistrate	2024-11-07 22:00:03.940026
19708	12004	38-152	20240190224087	Regulation of Open Burning (County Ordinance)	0.00	Beaufort County Magistrate	2024-11-07 22:00:03.942462
19709	12005	04-21-0050	20240190224087	VIOLATION OF COUNTY RULE REGARDING FIRE PROTECTION & AMBULANCE SERVICES	0.00	Beaufort County Magistrate	2024-11-07 22:00:03.94459
19710	12006	9-1005	20240180119229	Trespassing	465.00	Beaufort City Municipal Court	2024-11-07 22:00:03.946962
19711	12006	7-7001	20240180119228	Appearing Drunk on Streets	257.50	Beaufort City Municipal Court	2024-11-07 22:00:03.947602
19712	12007	56-01-0020	20240180123131	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort City Municipal Court	2024-11-07 22:00:03.950445
19713	12008	56-05-2930(A)	20240190183064	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:03.95327
19714	12009	Drug Court Commitment	2023GS0700677	Drug Court Commitment	0.00	General Sessions Court	2024-11-07 22:00:03.955023
19715	12010	56-05-1250	2024A0720600359	STRIKING FIXTURES ON OR ADJACENT TO HIGHWAY - FAILURE TO REPORT	0.00	Beaufort City Municipal Court	2024-11-07 22:00:03.95671
19716	12011	56-05-2930(A)	20242351302577	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:03.959198
19717	12011	56-01-0020	20242351302578	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:03.959913
19718	12012	56-05-2930(A)	20242351275711	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:03.961747
19719	12013	2-1005	20240180117393	Fleeing to Evade Arrest or Detention	0.00	Beaufort City Municipal Court	2024-11-07 22:00:03.964142
19720	12014	56-01-1020	15535/2024A0720600344	HABITUAL OFFENDER VIOLATION	0.00	General Sessions Court	2024-11-07 22:00:03.966516
19721	12014	56-01-0460(A)(1)(C)	20240180118532	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Beaufort City Municipal Court	2024-11-07 22:00:03.96707
19722	12015	56-01-0460(A)(2)(A)	20240190211306	DRIVING UNDER SUSPENSION; LICENSE SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:03.969151
19723	12015	56-05-2140	20240190211305	UNLAWFUL U TURN	0.00	Bluffton Magistrate Court	2024-11-07 22:00:03.969703
19724	12016	56-05-2930(A)	20240190226274	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:03.971315
19725	12017	56-05-2930(A)	20242351281393	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:03.973575
19726	12017	61-04-0110	20242351281394	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Beaufort County Magistrate	2024-11-07 22:00:03.974119
19727	12017	56-05-2530	20242351281395	STOPPING,STANDING, PARKING IN SPECIFIED AREAS PROHIBITED	0.00	Beaufort County Magistrate	2024-11-07 22:00:03.974988
19728	12018	56-05-2930(A)	20242351303852	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:03.977617
19729	12018	61-04-0110	20242351298678	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Beaufort County Magistrate	2024-11-07 22:00:03.978362
19730	12018	56-01-0020	20242351298672	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:03.979117
19731	12019	ISH		In-State Hold	0.00		2024-11-07 22:00:03.981737
19732	12020	Probation and Parole Viol	W-07-24-0024	Probation and Parole Violation	5000.00	General Sessions Court	2024-11-07 22:00:03.983706
19733	12021	16-17-0530	20240180123530	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort City Municipal Court	2024-11-07 22:00:03.98556
19734	12021	7-7001	20240180123531	Appearing Drunk on Streets	0.00	Beaufort City Municipal Court	2024-11-07 22:00:03.986254
19735	12022	56-01-0460(A)(1)(C)	20240270095481	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:03.98806
19736	12023	56-01-0460(A)(1)(C)	20240270096283	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:03.989723
19737	12023	44-53-0375/Ad	2024A0720200153	Meth:Poss<1gram1stoffense	0.00	General Sessions Court	2024-11-07 22:00:03.99015
19738	12024	16-17-0725 (B)	20240190222721	GIVING FALSE INFO TO LEO, FIRE, OR RESCUE DEPT. - TRAFFIC	0.00	Bluffton Magistrate Court	2024-11-07 22:00:03.992476
19739	12024	56-01-0460(A)(1)(A)	20240910222723	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:03.993686
19740	12025	56-01-0460(A)(1)(C)	20242351257931	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:03.995921
19741	12026	56-01-0460(A)(1)(C)	20240190220116	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:03.997691
19742	12027	56-05-2930(A)	20242351284707	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:03.999608
19743	12028	ISH		In-State Hold	0.00		2024-11-07 22:00:04.001231
19744	12029	56-05-2930(A)	20242351243642	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.003161
19745	12030	56-05-0750(B)(2)	20240190225875	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 2ND OR SUB. OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:04.004826
19746	12030	56-01-0460(A)(1)(C)	20240190225876	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.005283
19747	12030	56-10-0520	20240190225878	UNINSURED MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.005716
19748	12030	ISH	20223070059223	In-State Hold	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.006214
19749	12030	ISH		In-State Hold	0.00		2024-11-07 22:00:04.006657
19750	12031	16-03-0010	2024A0710200519	MURDER	0.00	General Sessions Court	2024-11-07 22:00:04.009376
19751	12031	ICE	395843481	ICE Hold	0.00		2024-11-07 22:00:04.009988
19752	12032	ISH		In-State Hold	0.00		2024-11-07 22:00:04.011862
19753	12032	56-01-0460(A)(1)(A)	20242351257069	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.01251
19754	12032	56-05-1520(G)(4)	20242351257068	SPEEDING 25MPH OVER THE SPEED LIMIT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.013087
19755	12033	16-25-0020(C)	20240270088264	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.015463
19756	12034	56-01-0460(A)(1)(A)	20240190214335	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.017106
19757	12034	44-53-0370(A)	77176/2024A0710200502	MANUF.; POSS. OF SCH. IV DRUGS; EXCEPT FLUNITRAZEPAM; WITH INTENT TO DISTRIBUTE  - 1ST OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:04.017711
19758	12034	16-23-0500(A)	77175/2024A0710200501	POSSESSION OF FIREARM OR AMMUNITION BY PERSON CONVICTED OF VIOLENT FELONY	0.00	General Sessions Court	2024-11-07 22:00:04.018249
19759	12035	Motion to Relieved Bond	2024GS0700480	Bond Revocation	0.00	General Sessions Court	2024-11-07 22:00:04.019843
19760	12036	23-03-0540(M)(1)	2024A0710200621	VIOLATION/WILFUL VIOLATION OF TERM OR CONDITION OF ELECTRONIC MONITORING	0.00	General Sessions Court	2024-11-07 22:00:04.021332
19761	12036	23-03-0540(M)(1)	2024A0710200622	VIOLATION/WILFUL VIOLATION OF TERM OR CONDITION OF ELECTRONIC MONITORING	0.00	General Sessions Court	2024-11-07 22:00:04.021755
19762	12037	16-03-0010	76757	MURDER	0.00	General Sessions Court	2024-11-07 22:00:04.024024
19763	12037	16-23-0490	76758	POSS. WEAPON DURING VIOLENT CRIME; IF NOT ALSO SENTENCED TO LIFE WITHOUT PAROLE OR DEATH	0.00	General Sessions Court	2024-11-07 22:00:04.024515
19764	12038	16-17-0530	20240190210763	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.026607
19765	12039	56-01-0460(A)(1)(B)	20240180123542	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 2ND OFFENSE	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.028148
19766	12040	56-05-2930(A)	20240190183615	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.029943
19767	12040	56-01-0020	20240190183615	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.030521
19768	12041	44-53-0370/B1a1	20240180122051	Cocaine:PWITD1st	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.032424
19769	12041	44-53-0370/B1a1	17662/2024A07206000295	Cocaine:PWITD1st	0.00	General Sessions Court	2024-11-07 22:00:04.033115
19770	12042	16-11-0620	20240190209474	ENTERING PREMISES AFTER WARNING OR REFUSING TO LEAVE ON REQUEST	0.00		2024-11-07 22:00:04.035422
19771	12042	17-7-111	20240190209590	Loitering (HH Town Ord)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.036018
19772	12042	56-01-0510	20240190209587	UNLAWFUL USE OF LICENSE OR FRAUDULENT APPLICATION FOR LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.036829
19773	12042	16-23-0465(A)	2024A0710200486	ADDITIONAL PENALTY TO 16-11-330 & 16-23-460 FOR GUN ON PREMISES WHERE ALCOHOL SOLD	0.00	General Sessions Court	2024-11-07 22:00:04.037445
19774	12043	44-53-0370(D)(5)	20240190098046	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00		2024-11-07 22:00:04.039389
19775	12044	16-15-0342	2024A0710400241	CRIMINAL SOLICITATION OF A MINOR	0.00	General Sessions Court	2024-11-07 22:00:04.041956
19776	12045	16-25-0020(C)	2024A0710400190	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.043949
19777	12046	ISH		In-State Hold	0.00		2024-11-07 22:00:04.04626
19778	12047	44-53-370		Marij: Simple Possession	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.048502
19779	12048	44-53-0370/D3a	77472	Cocaine:Possession1st	0.00	General Sessions Court	2024-11-07 22:00:04.050471
19780	12048	56-10-0520	20240190225879	UNINSURED MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.051144
19781	12049	56-10-0520	20240190210339	UNINSURED MOTOR VEHICLE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.053161
19782	12049	56-01-0020	20240190210338	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.053739
19783	12049	56-03-1370	20240190210333	DEFACE VEHICLE LICENSE PLATE WITH INTENT TO DEFRAUD	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.054383
19784	12050	16-17-0530	20240190210490	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.056227
19785	12051	16-25-0020(A)	2024A0710200507	DOMESTIC VIOLENCE	0.00	General Sessions Court	2024-11-07 22:00:04.058282
19786	12052	16-13-0110(A)	20240270099372	SHOPLIFTING	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.060382
19787	12053	16-14-0080	2024A0720600224/17953	CRIMINALLY RECEIVE GOODS; SERVICES FRAUDULENTLY OBTAINED	2500.00	Beaufort City Municipal Court	2024-11-07 22:00:04.062225
19788	12053	16-14-0080	2024A0720600223/17952	CRIMINALLY RECEIVE GOODS; SERVICES FRAUDULENTLY OBTAINED	2500.00	Beaufort City Municipal Court	2024-11-07 22:00:04.062689
19789	12053	16-14-0060	2024A0720600222/17951	FINANCIAL TRANSACTION FRAUD	2500.00	General Sessions Court	2024-11-07 22:00:04.063387
19790	12053	16-14-0060	2024A0720600221/16750	FINANCIAL TRANSACTION FRAUD	2500.00	General Sessions Court	2024-11-07 22:00:04.06395
19791	12054	56-05-2930(A)	5102P0705729	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.065883
19792	12055	44-53-0370(D)(5)	20240190098063	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00		2024-11-07 22:00:04.067804
19793	12056	Family Court Bench Warrnt	2018DR0700204	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:04.069367
19794	12057	56-05-2930(A)	20240190223122	DRIVING UNDER THE INFLUENCE (DUI)	0.00		2024-11-07 22:00:04.071077
19795	12058	56-05-0750(B)(1)	20242351273754	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.073905
19796	12058	56-05-2947	2024351273785	CHILD ENDANGERMENT; COMMIT CERTAIN VEHICULAR OFFENSES W/ MINOR IN VEHICLE (ENHANCE-HALF MAX PENALTY)	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.074504
19797	12058	56-01-0460(A)(1)(A)	20242351273781	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.075578
19798	12058	56-01-0020	2024351273782	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.076151
19799	12059	ISH		In-State Hold	0.00	General Sessions Court	2024-11-07 22:00:04.078035
19800	12060	16-23-0490	2024A0710400207	POSS. WEAPON DURING VIOLENT CRIME; IF NOT ALSO SENTENCED TO LIFE WITHOUT PAROLE OR DEATH	0.00	General Sessions Court	2024-11-07 22:00:04.079654
19801	12060	16-11-0330(A)	2024A0710400206	ARMED ROBBERY; ROBBERY WHILE ARMED OR ALLEGEDLY ARMED WITH A DEADLY WEAPON	0.00	General Sessions Court	2024-11-07 22:00:04.080239
19802	12061	CommonLaw	75463/2024A0710200545	ObstructionofJustice/arrest	0.00	General Sessions Court	2024-11-07 22:00:04.081896
19803	12061	16-21-0080c	75464/2024A0710200544	POSS., CONCEAL, SELL., OR DISPOSE OF STOLEN VEHICLE; VALUE MORE THAN $2;000 BUT LESS THAN $10;000	0.00	General Sessions Court	2024-11-07 22:00:04.082449
19804	12061	16-21-0080c	75465/2024A0710200543	POSS., CONCEAL, SELL., OR DISPOSE OF STOLEN VEHICLE; VALUE MORE THAN $2;000 BUT LESS THAN $10;000	0.00	General Sessions Court	2024-11-07 22:00:04.08324
19805	12062	56-05-2930(A)	20240190226271	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.085221
19806	12062	44-53-370	20240190226272	Marij: Simple Possession	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.085729
19807	12063	ISH		In-State Hold	0.00		2024-11-07 22:00:04.087745
19808	12064	16-25-0020(C)	15927/2024A0720600356	DOMESTIC VIOLENCE 2ND DEGREE	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.089867
19809	12064	63-05-0070	2024A0720600358	LEGAL CUSTODIAN: UNLAWFUL NEGLECT OF CHILD/HELPLESS PERSON,  WILLFULLY ABANDON THE CHILD	0.00	General Sessions Court	2024-11-07 22:00:04.090373
19810	12065	Probation and Parole Viol	W-07-24-0038	Probation and Parole Violation	0.00	General Sessions Court	2024-11-07 22:00:04.092379
19811	12066	16-03-0010	2024A0720600269	MURDER	0.00	General Sessions Court	2024-11-07 22:00:04.094368
19812	12066	16-23-0500(A)	2024A0720600271	POSSESSION OF FIREARM OR AMMUNITION BY PERSON CONVICTED OF VIOLENT FELONY	0.00	General Sessions Court	2024-11-07 22:00:04.094878
19813	12066	16-23-0490	2024A0720600270	POSS. WEAPON DURING VIOLENT CRIME; IF NOT ALSO SENTENCED TO LIFE WITHOUT PAROLE OR DEATH	0.00	General Sessions Court	2024-11-07 22:00:04.095351
19814	12067	56-05-2930(A)	20240190222478	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.097115
19815	12068	16-13-0110(A) Enhancement	2024A0720600304	SHOPLIFTING/VALUE 2000 OR LESS ENHANCEMENT PER 16-01-0057	0.00	General Sessions Court	2024-11-07 22:00:04.098924
19816	12069	Probation and Parole Viol	W-07-24-0057	Probation and Parole Violation	50000.00	General Sessions Court	2024-11-07 22:00:04.101
19817	12070	ISH		In-State Hold	0.00		2024-11-07 22:00:04.103079
19818	12071	16-03-0600(E)(1)	20240190207317	ASSAULT & BATTERY 3RD DEGREE	0.00		2024-11-07 22:00:04.104619
19819	12072	44-53-0375 (B) (1)	75070	DISTRIBUTION ETC. METHAMPHETAMINE 1ST EXCLUDES MANUFACTURING METH SEE CDR CODE 3776	0.00	General Sessions Court	2024-11-07 22:00:04.106738
19820	12073	16-17-0725 (B)	2024019020274	GIVING FALSE INFO TO LEO, FIRE, OR RESCUE DEPT. - TRAFFIC	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.108823
19821	12074	56-01-0460(A)(1)(A)	20240190218790	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.110752
19822	12074	61-04-0110	20240190218788	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.111308
19823	12075	56-01-0460(A)(1)(A)	20240190197355	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00		2024-11-07 22:00:04.112992
19824	12075	56-10-0520	20240190196733	UNINSURED MOTOR VEHICLE	0.00		2024-11-07 22:00:04.11357
19825	12075	44-53-370	20240190197111	Marij: Simple Possession	0.00		2024-11-07 22:00:04.114069
19826	12076	56-01-0460(A)(1)(A)		DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.115923
19827	12077	56-10-0520	20240190227392	UNINSURED MOTOR VEHICLE	0.00		2024-11-07 22:00:04.117953
19828	12077	56-01-0460(A)(1)(C)	20240190227391	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.11855
19829	12077	56-03-1360	20240190227390	IMPROPER VEHICLE LICENSE (REGISTERED TO ANOTHER VEHICLE)	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.119083
19830	12077	56-01-1100	20240190227389	HABITUAL TRAFFIC OFFENDERS; DUS AS PER HABITUAL TRAFFIC OFFENDER STATUS	0.00	General Sessions Court	2024-11-07 22:00:04.119814
19831	12078	44-53-0370/D2a	77972/2024a0710200480	POSS. OF OTHER CONTROLLED SUB. IN SCHED. I  TO V	0.00	General Sessions Court	2024-11-07 22:00:04.121784
19832	12078	44-53-0375/Ad	77973/2024a0710200481	Meth:Poss<1gram1stoffense	0.00	General Sessions Court	2024-11-07 22:00:04.122391
19833	12078	16-11-0640	2024A0710300250	UNLAWFUL ENTRY INTO ENCLOSED PLACES	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.123504
19834	12078	16-13-0030(A)	2024A0710300251	PETIT OR SIMPLE LARCENY -$2,000 OR LESS	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.124113
19835	12079	16-25-0020(C)	77274 / 2024A07102005952	DOMESTIC VIOLENCE 2ND DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.126789
19836	12080	56-05-2930(A)	20240180119219	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.128732
19837	12081	16-17-0530	20240190221337	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.130735
19838	12082	56-05-2930(A)	20240190180991	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.132513
19839	12082	56-01-0460(A)(1)(A)	20240190180976	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.133005
19840	12083	16-17-0530	20242170015409	PUBLIC DISORDERLY CONDUCT	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.134455
19841	12084	56-05-2930(A)	20240190220296	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.136492
19842	12085	16-17-0530	20240190220292	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.138387
19843	12085	56-05-1220	20240190220291	HIT AND RUN; ATT. VEHICLE; DUTIES OF DRIVER INVOLVED IN ACCIDENT; PROPERTY DAMAGE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.139099
19844	12085	16-09-0320(B)	71672/2024A0710200534	ASSAULT, BEAT, OR WOUND POLICE OFFICER SERVING PROCESS OR WHILE RESISTING ARREST	0.00	General Sessions Court	2024-11-07 22:00:04.139685
19845	12086	44-53-370		Marij: Simple Possession	0.00		2024-11-07 22:00:04.14188
19846	12086	16-11-0610		TRESPASSING	0.00		2024-11-07 22:00:04.142731
19847	12087	16-11-0610	20240190223120	TRESPASSING	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.146385
19848	12088	16-17-0530	20240190223133	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.148689
19849	12088	Family Court Bench Warrnt	1994DR0700906	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:04.149278
19850	12089	16-25-0020(D)	2024A0720600086	DOMESTIC VIOLENCE 3RD DEGREE	5237.50	General Sessions Court	2024-11-07 22:00:04.151083
19851	12089	2-1005	2024A0720600085	Fleeing to Evade Arrest or Detention	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.151843
19852	12090	44-53-0370(D)(5)	20240190223952	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.154192
19853	12091	56-05-1810(C)	20242351262759	DRIVING ON WRONG SIDE OF ROAD	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.15597
19854	12091	56-05-2930(A)	20242351262758	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.156518
19855	12092	16-23-0030/C	18052/2024A0720600294	Firearm:W/OSerialNumber	5000.00	General Sessions Court	2024-11-07 22:00:04.158485
19856	12092	16-23-0500(A)	18051/2024A0720600293	POSSESSION OF FIREARM OR AMMUNITION BY PERSON CONVICTED OF VIOLENT FELONY	15000.00	General Sessions Court	2024-11-07 22:00:04.159339
19857	12093	44-53-0370(D)(5)	20240190224085	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.16125
19858	12094	16-11-0510(A)	20240190210219	MALICIOUS INJURY TO ANIMALS; PERSONAL PROPERTY	0.00		2024-11-07 22:00:04.163357
19859	12095	7-7001	20240180123107	Appearing Drunk on Streets	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.16517
19860	12096	16-25-0020(D)	2024A0720200167	DOMESTIC VIOLENCE 3RD DEGREE	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.166985
19861	12097	56-01-0460(A)(1)(C)		DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00		2024-11-07 22:00:04.169319
19862	12097	56-01-0460(A)(1)(C)	20240270094366	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.16997
19863	12098	16-03-1910(O)	2024A0710300312	Violation of Permanent Restraining Order	0.00	General Sessions Court	2024-11-07 22:00:04.172359
19864	12098	Probation and Parole Viol	W-07-24-0048	Probation and Parole Violation	0.00	General Sessions Court	2024-11-07 22:00:04.173179
19865	12099	44-53-0375 (B) (1)	2024A0710200538	DISTRIBUTION ETC. METHAMPHETAMINE 1ST EXCLUDES MANUFACTURING METH SEE CDR CODE 3776	0.00	General Sessions Court	2024-11-07 22:00:04.176076
19866	12099	44-53-0370(D)(4)	2024A0710200537	DRUGS/FENTANYL, POSSESSION OF MORE THAN 2 GRAINS	0.00	General Sessions Court	2024-11-07 22:00:04.176937
19867	12100	44-53-0375(A)	74990/2024A0710200589	POSSESSION OF LESS THAN 1G OF METH OR COCAINE BASE	0.00	General Sessions Court	2024-11-07 22:00:04.179142
19868	12101	16-17-0530	20240190185376	PUBLIC DISORDERLY CONDUCT	0.00		2024-11-07 22:00:04.181131
19869	12102	16-25-0020(D)	20240190185375	DOMESTIC VIOLENCE 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.183346
19870	12103	61-04-0110	20240190223062	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.185424
19871	12103	56-05-2930(A)	20240190223063	DRIVING UNDER THE INFLUENCE (DUI)	0.00	General Sessions Court	2024-11-07 22:00:04.186084
19872	12104	ISH		In-State Hold	0.00		2024-11-07 22:00:04.18805
19873	12105	44-53-0370/B1a1	73348 / 2024A0710200591	Cocaine:PWITD1st	0.00	General Sessions Court	2024-11-07 22:00:04.189966
19874	12105	44-53-370	20240190224084	Marij: Simple Possession	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.190598
19875	12106	56-01-0020	20240190227356	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.192793
19876	12106	56-05-6410	20240190227355	CHILD PASSENGER RESTRAINT SYSTEM ARTICLE VIOLATION	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.193295
19877	12107	56-05-0950	20240270097333	FAILURE TO OBEY TRAFFIC-CONTROL DEVICES	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.195135
19878	12107	56-01-0460(A)(2)(A)	20240270097282	DRIVING UNDER SUSPENSION; LICENSE SUSPENDED FOR DUI - 1ST OFFENSE	0.00		2024-11-07 22:00:04.195726
19879	12108	16-11-0610	20240190202136	TRESPASSING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.197672
19880	12109	56-05-2930(A)	20240270095499	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.199461
19881	12109	ICE		ICE Hold	0.00		2024-11-07 22:00:04.199935
19882	12110	Family Court Bench Warrnt	2011DR0701855	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:04.201916
19883	12111	44-53-0375/B1e	77238	Meth:Distribution1st	10000.00	General Sessions Court	2024-11-07 22:00:04.20368
19884	12111	ICE		ICE Hold	0.00		2024-11-07 22:00:04.204241
19885	12112	56-05-2930(A)	20242351298794	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.205836
19886	12113	56-05-2930(A)	20240190181782	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.207465
19887	12113	56-01-0020	20240190181774	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.208186
19888	12114	56-01-2070	20242421011785	DRIVING COMMERCIAL MOTOR VEHICLE WITHOUT PROPER LICENSE OR PERMIT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.210064
19889	12114	56-05-2120	2024241011786	UNLAWFUL TURNING; TURNING FROM WRONG LANE OR IMPROPER SIGNAL	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.210582
19890	12114	56-03-0840	20242421011787	OPERATING VEHICLE WHILE LICENSE/REGISTRATION EXPIRED	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.211103
19891	12114	ICE		ICE Hold	0.00		2024-11-07 22:00:04.211594
19892	12115	16-09-0320(A)	20242170015607	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.213651
19893	12115	16-11-0620	20242170015608	ENTERING PREMISES AFTER WARNING OR REFUSING TO LEAVE ON REQUEST	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.214192
19894	12116	56-05-2930(A)	20240190200030	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.215786
19895	12116	56-01-0020	20240190199888	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.216342
19896	12117	16-25-0020(C)	2024A0710200207/76778	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.218742
19897	12118	56-05-2930(A)	20242170015908	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.220849
19898	12119	Magistrate Bench Warrant	2022A0710300255	Magistrate Bench Warrant	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.223008
19899	12120	16-21-0090	20240190224747	DAMAGING OR TAMPERING WITH A VEHICLE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.225369
19900	12121	16-17-0530	20240180119736	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.228203
19901	12122	16-03-0600(E)(1)	20242170015569	ASSAULT & BATTERY 3RD DEGREE	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.230561
19902	12123	56-05-2930(A)	20242351311287	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.23309
19903	12124	56-05-2930(A)	20240190227320	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.235295
19904	12125	16-11-0610	20240190209164	TRESPASSING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.237453
19905	12125	44-53-0370(D)(3)	71864	POSSESSION OF COCAINE, POSSESSION OF 15 DOSAGE UNITS OF MDMA OR ECSTASY	5000.00	General Sessions Court	2024-11-07 22:00:04.238143
19906	12126	ISH		In-State Hold	0.00		2024-11-07 22:00:04.239956
19907	12127	16-13-0030(A)	2022A0720200166	PETIT OR SIMPLE LARCENY -$2,000 OR LESS	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.242223
19908	12128	44-53-0375	77126/2024A0710200627	SIMPLE POSSESSION OF CRACK	0.00	General Sessions Court	2024-11-07 22:00:04.243928
19909	12129	16-25-0065	2024A0710300326	CDV High/Aggravated Nature	0.00	General Sessions Court	2024-11-07 22:00:04.245758
19910	12129	16-23-0490	2024A0710300330	POSS. WEAPON DURING VIOLENT CRIME; IF NOT ALSO SENTENCED TO LIFE WITHOUT PAROLE OR DEATH	0.00	General Sessions Court	2024-11-07 22:00:04.246377
19911	12130	Probation and Parole Viol	W07240054	Probation and Parole Violation	75000.00	General Sessions Court	2024-11-07 22:00:04.248021
19912	12131	16-11-0610	20240180120455	TRESPASSING	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.249833
19913	12131	16-17-0530	2024A0720600313	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.250402
19914	12131	16-09-0320(A)	2024A0720600312	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00	General Sessions Court	2024-11-07 22:00:04.251036
19915	12132	56-05-0750(B)(1)	20240190220020	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 1ST OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:04.252874
19916	12132	56-05-1520(G)(3)	20240190220020	SPEEDING 15MPH-24MPH OVER THE SPEED LIMIT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.253326
19917	12132	44-53-0370(D)(5)	20240190220020	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.253809
19918	12133	16-01-0055	2024A0720600273	ACCESSORY AFTER THE FACT TO AN EXEMPT FELONY OR FELONY A-F OR MURDER	0.00	General Sessions Court	2024-11-07 22:00:04.25602
19919	12134	61-04-0110	2024A0190224090	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.257612
19920	12135	General Sessns Bench Warr	2016A071030019	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:04.259638
19921	12135	General Sessns Bench Warr	2016A071030020	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:04.260153
19922	12136	16-03-0600(C)(1)	20240190225117	ASSAULT & BATTERY 1ST DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.262204
19923	12136	16-11-0510(A)	2024A0710200555	MALICIOUS INJURY TO ANIMALS; PERSONAL PROPERTY	0.00		2024-11-07 22:00:04.262735
19924	12137	56-01-0460(A)(1)(A)	20240190221310	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.264364
19925	12137	44-53-0370(D)(3)	77276	POSSESSION OF COCAINE, POSSESSION OF 15 DOSAGE UNITS OF MDMA OR ECSTASY	0.00	General Sessions Court	2024-11-07 22:00:04.265082
19926	12138	44-53-0370/b1e	74851	Marij:PWITD/S&D 1stoffense	0.00	General Sessions Court	2024-11-07 22:00:04.266983
19927	12139	16-13-0240	2024A0710400195	OBTAIN SIGNATURE OF PROP. UNDER FALSE PRETENSES	0.00		2024-11-07 22:00:04.268494
19928	12139	16-11-0313	2024A0710400195	BURGLARY - THIRD DEGREE- 1ST OR 2ND OFFENSE	0.00		2024-11-07 22:00:04.269016
19929	12140	16-13-0240	2024A0710400196	OBTAIN SIGNATURE OF PROP. UNDER FALSE PRETENSES	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.270897
19930	12140	16-13-0240	2024A0710400197	OBTAIN SIGNATURE OF PROP. UNDER FALSE PRETENSES	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.271534
19931	12140	16-11-0313	2024A0710400195	BURGLARY - THIRD DEGREE- 1ST OR 2ND OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:04.272167
19932	12141	16-11-0610	20240190202062	TRESPASSING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.274135
19933	12142	Family Court Bench Warrnt	2023DR0700707	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:04.276617
19934	12143	Family Court Bench Warrnt	2023DR0700699	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:04.278442
19935	12144	Magistrate Bench Warrant	20200190119156	Magistrate Bench Warrant	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.280501
19936	12145	16-25-0020(D)	20240180121140	DOMESTIC VIOLENCE 3RD DEGREE	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.282613
19937	12146	General Sessions Commtmnt	2020A0710200069	General Sessions Commitment	0.00	General Sessions Court	2024-11-07 22:00:04.284776
19938	12147	16-25-0020(D)	20240190208798	DOMESTIC VIOLENCE 3RD DEGREE	0.00		2024-11-07 22:00:04.287125
19939	12147	16-11-0510(A)	20240190208799	MALICIOUS INJURY TO ANIMALS; PERSONAL PROPERTY	0.00		2024-11-07 22:00:04.28781
19940	12148	16-13-0030(B)	2024A0710300341	GRAND LARCENY; VALUE MORE THAN $2,000 BUT LESS THAN $10,000 & OR VALUE MORE THAN $10,000	0.00	General Sessions Court	2024-11-07 22:00:04.289929
19941	12148	16-13-0110(A)	2024A0710200616	SHOPLIFTING	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.290637
19942	12149	56-05-1220	20240190227554	HIT AND RUN; ATT. VEHICLE; DUTIES OF DRIVER INVOLVED IN ACCIDENT; PROPERTY DAMAGE	0.00	General Sessions Court	2024-11-07 22:00:04.29339
19943	12149	56-01-0020	20240190227553	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.294051
19944	12150	16-11-0620	20240190218923	ENTERING PREMISES AFTER WARNING OR REFUSING TO LEAVE ON REQUEST	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.296775
19945	12151	16-11-0610	20240190098073	TRESPASSING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.298591
19946	12151	44-53-0370(C)	77322	POSS OF NARC IN SCHEDULE I(B),(C), LSD & SCHEDULE II	0.00	General Sessions Court	2024-11-07 22:00:04.299275
19947	12152	16-11-0312	2024A0710200620	BURGLARY (NON-VIOLENT) - SECOND DEGREE	15000.00	General Sessions Court	2024-11-07 22:00:04.301531
19948	12153	44-53-0370/D3a	78077/2024A0710200600	Cocaine:Possession1st	0.00	General Sessions Court	2024-11-07 22:00:04.303546
19949	12153	56-01-0460(A)(1)(A)	20240190219308	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.304134
19950	12154	61-06-4020	20240190223066	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.306037
19951	12154	56-05-2930(A)	20240190223065	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.306723
19952	12155	16-25-0020(D)	20240190207321	DOMESTIC VIOLENCE 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.309112
19953	12156	61-06-4020	20242351241780	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.310916
19954	12156	56-05-2930(A)	20242351241779	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.31145
19955	12156	44-53-0370	20242351241781	Simple Possession	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.311902
19956	12156	56-01-0020	20242351241782	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.312333
19957	12156	56-05-4440	20242351241778	OPERATING VEHICLE WITH TELEVISION SCREEN FORWARD OF THE BACK OF THE DRIVER'S SEAT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.313226
19958	12156	16-09-0320(A)	2024A0710300162	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00		2024-11-07 22:00:04.313797
19959	12157	44-53-0370(D)(4)	2024A0720600265/17519	DRUGS/FENTANYL, POSSESSION OF MORE THAN 2 GRAINS	0.00	General Sessions Court	2024-11-07 22:00:04.315878
19960	12158	16-15-0130	02080	INDECENT EXPOSURE	0.00	General Sessions Court	2024-11-07 22:00:04.318329
19961	12159	16-17-0430(A)	2024A0710300275	UNLAWFUL COMMUNICATION (AFTER 07/20/01)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.320827
19962	12159	ISH		In-State Hold	0.00		2024-11-07 22:00:04.321547
19963	12159	44-53-0370(D)(2)	2024A0710200487	POSS OF OTHER CONTROLLED SUB IN SCHED I TO V	0.00	General Sessions Court	2024-11-07 22:00:04.322153
19964	12160	16-13-0180(A4)	2024A0710300296	RSG/RECEIVING STOLEN GOODS; VALUE $2,000 OR LESS	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.323962
19965	12161	56-01-0020		DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00		2024-11-07 22:00:04.326175
19966	12162	44-53-0370(D)(5)	20240190218933	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.328393
19967	12162	56-01-0020		DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.328949
19968	12163	ISH		In-State Hold	0.00		2024-11-07 22:00:04.330676
19969	12164	56-05-2930(A)	20240190218940	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.332746
19970	12165	General Sessns Bench Warr	2024A0710400022	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:04.334316
19971	12165	16-25-0020(C)	20240190224478	DOMESTIC VIOLENCE 2ND DEGREE	10000.00	General Sessions Court	2024-11-07 22:00:04.334738
19972	12166	56-05-2930(A)	20242170015758	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.33635
19973	12167	56-01-0460(A)(1)(B)		DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 2ND OFFENSE	0.00		2024-11-07 22:00:04.339272
19974	12168	63-05-0070	2024A0720200132	LEGAL CUSTODIAN: UNLAWFUL NEGLECT OF CHILD/HELPLESS PERSON,  WILLFULLY ABANDON THE CHILD	0.00	General Sessions Court	2024-11-07 22:00:04.340936
19975	12168	63-05-0070	2024A0720200131	LEGAL CUSTODIAN: UNLAWFUL NEGLECT OF CHILD/HELPLESS PERSON,  WILLFULLY ABANDON THE CHILD	0.00	General Sessions Court	2024-11-07 22:00:04.341736
19976	12168	63-05-0070	2024A0720200130	LEGAL CUSTODIAN: UNLAWFUL NEGLECT OF CHILD/HELPLESS PERSON,  WILLFULLY ABANDON THE CHILD	0.00	General Sessions Court	2024-11-07 22:00:04.342532
19977	12169	General Sessions Commtmnt		General Sessions Commitment	0.00	General Sessions Court	2024-11-07 22:00:04.345039
19978	12170	16-03-0600(E)(1)	20240190214739	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.34737
19979	12170	16-25-0020(D)	20240190217556	DOMESTIC VIOLENCE 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.348039
19980	12171	ICE		ICE Hold	0.00		2024-11-07 22:00:04.349998
19981	12171	16-03-0654	75940/2024a0710400208	CRIMINAL SEXUAL CONDUCT - THIRD DEGREE	125000.00	General Sessions Court	2024-11-07 22:00:04.350565
19982	12172	56-05-2930(A)	20242351262760	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.352683
19983	12173	56-01-0460(A)(1)(A)		DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00		2024-11-07 22:00:04.354492
19984	12174	General Sessions Commtmnt		General Sessions Commitment	0.00	General Sessions Court	2024-11-07 22:00:04.356311
19985	12175	ISH		In-State Hold	0.00		2024-11-07 22:00:04.358209
19986	12176	56-05-2930(A)	20242351290980	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.360248
19987	12177	General Sessions Commtmnt	2019GS0700393	General Sessions Commitment	0.00	General Sessions Court	2024-11-07 22:00:04.362086
19988	12178	56-05-2930(A)	20242170015381	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.363748
19989	12179	56-01-0460(A)(1)(B)	20240190227325	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 2ND OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.366032
19990	12180	16-07-0110	4102P00675569	WEARING MASKS AND THE LIKE	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.367802
19991	12181	16-17-0530	20242170015390	PUBLIC DISORDERLY CONDUCT	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.369246
19992	12181	44-53-0370	20242170015389	Simple Possession	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.369745
19993	12182	56-05-2930(A)	20240270097364	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.371463
19994	12183	16-03-0600(E)(1)	20240270099369	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.373133
19995	12184	56-05-0750(B)(1)	20240190098065	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 1ST OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:04.375242
19996	12184	16-09-0320(A)	77321/2024A0710200615	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00	General Sessions Court	2024-11-07 22:00:04.37608
19997	12184	56-01-0020	20240190098066	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.376705
19998	12184	56-03-0110	20240190098067	PERMITTING OR OPERATING VEHICLE WHICH IS NOT REGISTERED AND LICENSED	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.377257
19999	12184	44-53-0370 (D) (5)	20240190098068	Marij/Poss 28g<10gr<Hash 1st	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.377794
20000	12185	17-11-110	2024A0710200102	Fleeing to evade arrest or detention	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.37943
20001	12186	56-01-0460(A)(1)(A)	20240270093104	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.381172
20002	12187	Family Court Bench Warrnt	2017DR0700615P-004	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:04.382857
20003	12188	56-05-2930(A)		DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.384535
20004	12188	56-01-0460(A)(1)(A)		DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.385052
20005	12188	56-10-0520		UNINSURED MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.385549
20006	12188	56-03-0840		OPERATING VEHICLE WHILE LICENSE/REGISTRATION EXPIRED	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.386021
20007	12189	56-05-2930(A)	20240190175586	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.387815
20008	12190	44-53-0370(D)(5)		POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.389625
20009	12191	61-06-4020	20242170014934	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.391156
20010	12191	56-01-0460(A)(1)(C)	2024170014935	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.392156
20011	12191	56-05-1520(G)(4)	2024170014936	SPEEDING 25MPH OVER THE SPEED LIMIT	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.392911
20012	12191	56-10-0225	20242170014937	FAILURE TO MAINTAIN PROOF OF INSURANCE IN MOTOR VEHICLE	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.393616
20013	12191	00-00-0000b	20242170014938	FleeingtoEvade	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.394146
20014	12192	56-05-2930(A)	20240190180862	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.395636
20015	12193	16-11-0610	2024A0720600145	TRESPASSING	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.397221
20016	12194	61-04-0110	20240180119221	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.399166
20017	12194	56-05-2930(A)	20240180119220	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.399665
20018	12195	56-01-0460(A)(1)(A)	20240190202027	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00		2024-11-07 22:00:04.401334
20019	12195	56-10-0520	20240190202028	UNINSURED MOTOR VEHICLE	0.00		2024-11-07 22:00:04.40187
20020	12195	56-09-0340	20240190202060	FAILURE TO SURRENDER DRIVER'S LICENSE/REGISTRATION/VEHICLE LICENSE	0.00		2024-11-07 22:00:04.402404
20021	12196	16-13-0180(A4)	2024170015585	RSG/RECEIVING STOLEN GOODS; VALUE $2,000 OR LESS	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.40411
20022	12197	56-05-2930(A)	8102P0795559	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.405692
20023	12198	56-05-2930(A)		DRIVING UNDER THE INFLUENCE (DUI)	0.00		2024-11-07 22:00:04.407576
20024	12199	56-05-2930(A)	20240270089386	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.409879
20025	12200	16-13-0110(A)	20240190199377	SHOPLIFTING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.411904
20026	12200	17-09-0010	73312	FUG. FROM JUSTICE WARRANT; NON-CRIM. HOLD FUG. MAX. 20 DAYS. GOV. OFC.	0.00	General Sessions Court	2024-11-07 22:00:04.41234
20027	12201	56-05-2930(A)	20242351244354	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.413971
20028	12201	56-05-1240	20242351244355	LEAVING THE SCENE OF ACCIDENT INVOLVING UNATTENDED VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.414522
20029	12202	56-05-2930(A)	20240180116184	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.41617
20030	12203	16-17-0530	20240190197695	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.417726
20031	12204	16-17-0530	20240190214820	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.419539
20032	12205	ISH		In-State Hold	0.00		2024-11-07 22:00:04.421533
20033	12206	16-11-0620		ENTERING PREMISES AFTER WARNING OR REFUSING TO LEAVE ON REQUEST	0.00		2024-11-07 22:00:04.42313
20034	12207	16-03-0600(E)(1)		ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.425491
20035	12208	16-13-0230(A)	2024A0710300320	BREACH OF TRUST WITH FRAUDULENT INTENT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.427277
20036	12209	ISH		In-State Hold	0.00		2024-11-07 22:00:04.42892
20037	12210	16-17-0530	20240190224957	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.430435
20038	12210	ICE		ICE Hold	0.00		2024-11-07 22:00:04.43117
20039	12211	16-25-0020(C)	20240190221316	DOMESTIC VIOLENCE 2ND DEGREE	5000.00	General Sessions Court	2024-11-07 22:00:04.432824
20040	12211	ICE		ICE Hold	0.00		2024-11-07 22:00:04.433414
20041	12212	Probation and Parole Viol	W-07-24-0040	Probation and Parole Violation	0.00	General Sessions Court	2024-11-07 22:00:04.435194
20042	12213	General Sessions Commtmnt		General Sessions Commitment	0.00	General Sessions Court	2024-11-07 22:00:04.436983
20043	12214	56-01-0020	20240190218780	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00		2024-11-07 22:00:04.439047
20044	12214	56-05-2930(A)	20240190218779	DRIVING UNDER THE INFLUENCE (DUI)	0.00		2024-11-07 22:00:04.439641
20045	12215	16-13-0110(A)	20240270088263	SHOPLIFTING	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.442111
20046	12216	56-05-2930(A)	20240190221314	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.444371
20047	12216	ICE		ICE Hold	0.00		2024-11-07 22:00:04.4449
20048	12217	56-05-2930(A)	20240190220019	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.446724
20049	12218	44-53-0375/Aa	77235/2024a0710200497	CrackCocaine:Poss1st	0.00	General Sessions Court	2024-11-07 22:00:04.448547
20050	12219	50-21-0117(A)	0004276	WATER DEVICE; OPERATION WHILE PRIVILEGES SUSPENDED	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.450119
20051	12219	50-21-170	0004425	VIOLATIONS OF CHAPTER OR REGULATIONS REF TO WATERCRAFT SAFTEY, MARINE EQUIPMENT PERM & OPER OF WATERCRAFT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.45062
20052	12219	50-21-0150	0004426	Watercraft/ Violations of Chapter or Regulations	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.451262
20053	12220	16-25-0020(D)	20240190217570	DOMESTIC VIOLENCE 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.45331
20054	12221	16-13-0030(A)	4102P0067570	PETIT OR SIMPLE LARCENY -$2,000 OR LESS	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.455009
20055	12222	56-01-1100	20242170014687	HABITUAL TRAFFIC OFFENDERS; DUS AS PER HABITUAL TRAFFIC OFFENDER STATUS	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.456948
20056	12222	56-05-1520(G)(1)	20242170014686	SPEEDING: 10 MPH OR LESS OVER THE SPEED LIMIT	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.457422
20057	12223	44-53-0375/Aa	77120/2024A0710200612	CrackCocaine:Poss1st	0.00	General Sessions Court	2024-11-07 22:00:04.45962
20058	12224	16-17-0530	10663 EY	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.461477
20059	12224	16-11-0620	10664 EY	ENTERING PREMISES AFTER WARNING OR REFUSING TO LEAVE ON REQUEST	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.462504
20060	12225	16-17-0410	62343 / 2024A0710200584	CRIMINAL CONSPIRACY; COMMON LAW CONSPIRACY DEFINED	0.00	General Sessions Court	2024-11-07 22:00:04.464076
20061	12226	16-13-0110(A)	2024A0720400142	SHOPLIFTING	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.465836
20062	12227	23-03-0470/A2	2024A0710400209	SEX OFFENDER REGISTRY VIOLATION; FAIL TO REGISTER - 2ND OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:04.467765
20063	12228	Magistrate Commitment		Magistrate Commitment	0.00		2024-11-07 22:00:04.469554
20064	12229	Magistrate Commitment		Magistrate Commitment	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.471427
20065	12230	16-17-0430(A)	2024A0720600268	UNLAWFUL COMMUNICATION (AFTER 07/20/01)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.473294
20066	12231	16-03-1700(A)	76429/2024A0710200583	1ST DEGREE HARASSMENT	0.00	General Sessions Court	2024-11-07 22:00:04.47507
20067	12232	7-7001	20240180117809	Appearing Drunk on Streets	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.477231
20068	12233	16-13-0230(A)	2024A0710300363	BREACH OF TRUST WITH FRAUDULENT INTENT	0.00	General Sessions Court	2024-11-07 22:00:04.47882
20069	12234	56-05-1220	20240190183620	HIT AND RUN; ATT. VEHICLE; DUTIES OF DRIVER INVOLVED IN ACCIDENT; PROPERTY DAMAGE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.480799
20070	12234	56-01-0020	20240190183621	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.481441
20071	12235	16-17-0530	20240190194131	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.483243
20072	12235	ICE		ICE Hold	0.00		2024-11-07 22:00:04.483743
20073	12236	Probation and Parole Viol	W-07-24-0047	Probation and Parole Violation	0.00	General Sessions Court	2024-11-07 22:00:04.485413
20074	12237	16-25-0020(D)	20240190197701	DOMESTIC VIOLENCE 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.487015
20075	12238	ISH		In-State Hold	0.00		2024-11-07 22:00:04.488753
20076	12239	16-25-0020(D)	20240190227387	DOMESTIC VIOLENCE 3RD DEGREE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.490158
20077	12240	56-05-2930(A)	2024217005373	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.492813
20078	12240	56-05-0750(B)(1)	2024217005374	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 1ST OFFENSE	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.493355
20079	12240	61-04-0110	2024217005375	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.493815
20080	12241	44-53-0375(B)(1)	2024A0720200148	MANUFACTURE, DISTRIBUTION ETC. OF COCAINE BASE 1ST	0.00	General Sessions Court	2024-11-07 22:00:04.495734
20081	12241	44-53-0370(B)(2)	04428 / 2024A0720200149	MANUF.; POSS. OF OTHER SUB. IN SCH. I; II; III OR FLUNITRAZEPAM OR ANALOGUE; W.I.T.D.	0.00	General Sessions Court	2024-11-07 22:00:04.496194
20082	12242	44-53-0370 (D) (5)	20240190222917	Marij/Poss 28g<10gr<Hash 1st	0.00		2024-11-07 22:00:04.498037
20083	12243	ISH		In-State Hold	0.00		2024-11-07 22:00:04.499871
20084	12244	16-03-0600(D)(1)	2024A0720600178	ASSAULT & BATTERY 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.501683
20085	12245	ISH		In-State Hold	0.00		2024-11-07 22:00:04.503211
20086	12246	16-23-0410	2024A0710400203	POINTING AND PRESENTING FIREARMS AT A PERSON	0.00	General Sessions Court	2024-11-07 22:00:04.505312
20087	12246	16-03-0600(E)(1)	2024A0710400202	ASSAULT & BATTERY 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.505842
20088	12247	17-7-111	20240190221304	Loitering (HH Town Ord)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.507521
20089	12248	16-17-0725 (B)	20240180118566	GIVING FALSE INFO TO LEO, FIRE, OR RESCUE DEPT. - TRAFFIC	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.509899
20090	12248	16-09-0320(A)	20240180118565	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.510557
20091	12249	ISH		In-State Hold	0.00		2024-11-07 22:00:04.512417
20092	12250	56-01-0460(A)(1)(A)	20240270092228	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.515016
20093	12251	56-05-0750(B)(1)	20240270093174	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 1ST OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.516749
20094	12252	51-03-0145	DNR0004946	UNLAWFUL ACT IN STATE PARK	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.518475
20095	12252	50-05-1710B	DNR0003730	UNDERSIZED SHEEPSHEAD	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.519074
20096	12252	50-21-170	DNR0003722	VIOLATIONS OF CHAPTER OR REGULATIONS REF TO WATERCRAFT SAFTEY, MARINE EQUIPMENT PERM & OPER OF WATERCRAFT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.519761
20097	12252	50-21-170	DNR0003730	VIOLATIONS OF CHAPTER OR REGULATIONS REF TO WATERCRAFT SAFTEY, MARINE EQUIPMENT PERM & OPER OF WATERCRAFT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.520423
20098	12252	50-21-170	DNR0004948	VIOLATIONS OF CHAPTER OR REGULATIONS REF TO WATERCRAFT SAFTEY, MARINE EQUIPMENT PERM & OPER OF WATERCRAFT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.520994
20099	12252	50-21-170	DNR0004950	VIOLATIONS OF CHAPTER OR REGULATIONS REF TO WATERCRAFT SAFTEY, MARINE EQUIPMENT PERM & OPER OF WATERCRAFT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.521439
20100	12252	50-05-1710B	DNR0004475	UNDERSIZED SHEEPSHEAD	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.522035
20101	12252	50-05-1710B	DNR0004476	UNDERSIZED SHEEPSHEAD	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.522728
20102	12252	50-05-1710B	DNR0004477	UNDERSIZED SHEEPSHEAD	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.523244
20103	12252	50-05-1710B	DNR0004478	UNDERSIZED SHEEPSHEAD	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.523733
20104	12252	50-21-170	901615	VIOLATIONS OF CHAPTER OR REGULATIONS REF TO WATERCRAFT SAFTEY, MARINE EQUIPMENT PERM & OPER OF WATERCRAFT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.524193
20105	12252	50-21-0150	901614	Watercraft/ Violations of Chapter or Regulations	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.525013
20106	12253	44-53-0370(A)	2024A0710400201	MANUF.; POSS. OF SCH. IV DRUGS; EXCEPT FLUNITRAZEPAM; WITH INTENT TO DISTRIBUTE  - 1ST OFFENSE	5000.00	General Sessions Court	2024-11-07 22:00:04.527092
20107	12254	16-25-0020(D)	20240190224834	DOMESTIC VIOLENCE 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.528552
20108	12255	44-53-0370/D3a	77242	Cocaine:Possession1st	0.00	General Sessions Court	2024-11-07 22:00:04.530234
20109	12256	16-17-0530	20240190224749	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.53261
20110	12256	16-17-0725 (B)	20240190224750	GIVING FALSE INFO TO LEO, FIRE, OR RESCUE DEPT. - TRAFFIC	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.533167
20111	12257	56-01-0460(A)(1)(A)	20242170014733	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.534862
20112	12257	56-05-1210(A)(2)	2024A0720400145	HIT AND RUN; DUTIES OF DRIVER INVOLVED IN ACCIDENT WITH GREAT BODILY INJURY	0.00	General Sessions Court	2024-11-07 22:00:04.535427
20113	12258	Family Court Bench Warrnt	2014DR0701009	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:04.537028
20114	12259	16-11-0311	2024A0720600212/17465	BURGLARY - FIRST DEGREE	50000.00	General Sessions Court	2024-11-07 22:00:04.538538
20115	12259	16-25-0020(C)	2024A0720600213/17466	DOMESTIC VIOLENCE 2ND DEGREE	10000.00	General Sessions Court	2024-11-07 22:00:04.539022
20116	12259	00-00-0000b	2024A072060228/17469	FleeingtoEvade	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.539513
20117	12260	16-17-0530	20240190222270	PUBLIC DISORDERLY CONDUCT	0.00		2024-11-07 22:00:04.542187
20118	12261	16-03-1040(B)	64395/2024A0710200619	THREATENING LIFE; PERSON OR FAMILY OF PUBLIC EMPLOYEE	0.00	General Sessions Court	2024-11-07 22:00:04.544283
20119	12261	16-17-0530	20240190198598	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.54483
20120	12262	16-15-0395(A)	2024A0710400258	SEXUAL EXPLOITATION OF A MINOR: 1ST DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.546988
20121	12262	16-15-0405(A)	2024A0710400259	SEXUAL EXPLOITATION OF A MINOR: 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.547662
20122	12262	16-15-0410(A)	2024A0710400260	SEXUAL EXPLOITATION OF A MINOR: 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.548283
20123	12262	16-15-0355	2024A0710400261	DISSEMINATING OBSCENE MATERIAL TO A MINOR 12 Y OR YOUNGER	0.00	General Sessions Court	2024-11-07 22:00:04.548931
20124	12263	ISH		In-State Hold	0.00		2024-11-07 22:00:04.551472
20125	12264	16-17-0530	20240190198481	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.55341
20126	12264	16-09-0320(A)	64392/2024A0710200605	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00	General Sessions Court	2024-11-07 22:00:04.554197
20127	12265	16-17-0530	20240180123529	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.55611
20128	12266	ISH		In-State Hold	0.00		2024-11-07 22:00:04.560966
20129	12267	56-05-2930(A)	20240190218813	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.562882
20130	12268	56-05-2920	20240190215676	RECKLESS DRIVING	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.56488
20131	12268	56-05-0750(B)(1)	20240190215676	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.56549
20132	12269	Family Court Bench Warrnt	2018DR0700609	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:04.567719
20133	12270	56-01-0460(A)(1)(A)	20242351223024	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.569636
20134	12271	16-03-0600(E)(1)	2023A0710400302/74989	ASSAULT & BATTERY 3RD DEGREE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.572039
20135	12271	44-53-0370(D)(3)	74988	POSSESSION OF COCAINE, POSSESSION OF 15 DOSAGE UNITS OF MDMA OR ECSTASY	0.00	General Sessions Court	2024-11-07 22:00:04.572595
20136	12271	44-53-0370 (D) (5)	202401902083	Marij/Poss 28g<10gr<Hash 1st	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.573219
20137	12272	56-05-2930(A)	20240190223136	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.575309
20138	12273	56-05-2930(A)	8102P0795506	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.577549
20139	12274	56-05-2930(A)	8102P0795508	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.579477
20140	12275	ISH		In-State Hold	0.00		2024-11-07 22:00:04.582864
20141	12276	General Sessns Bench Warr	2024A0710200215	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:04.584987
20142	12276	General Sessns Bench Warr	2023A0720600253	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:04.585567
20143	12276	General Sessns Bench Warr	2024A0720600113	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:04.586162
20144	12278	16-25-0020(D)	20240190217569	DOMESTIC VIOLENCE 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.590224
20145	12278	44-53-0370/D3b	70676	Cocaine:Possession2nd	0.00		2024-11-07 22:00:04.590827
20146	12279	Family Court Bench Warrnt	2021DR0700695	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:04.593151
20147	12280	16-23-0410	16679/2024A0720600258	POINTING AND PRESENTING FIREARMS AT A PERSON	0.00	General Sessions Court	2024-11-07 22:00:04.595294
20148	12280	16-13-0030(A)	16677/2024A0720600257	PETIT OR SIMPLE LARCENY -$2,000 OR LESS	0.00	General Sessions Court	2024-11-07 22:00:04.595937
20149	12280	16-03-0600(E)(1)	16678/2024A0720600256	ASSAULT & BATTERY 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.596509
20150	12281	56-01-0020	20240270091312	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.598362
20151	12282	44-53-370		Marij: Simple Possession	0.00		2024-11-07 22:00:04.600691
20152	12283	16-13-0110(A)	2024A0720400002	SHOPLIFTING	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.602624
20153	12284	16-11-0510(A)	20240190214804	MALICIOUS INJURY TO ANIMALS; PERSONAL PROPERTY	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.604696
20154	12284	16-03-1040(A)	2024A0710200529/63945	THREATENING LIFE; PERSON OR FAMILY OF PUBLIC OFFICIAL, TEACHER, PRINCIPAL	0.00	General Sessions Court	2024-11-07 22:00:04.605561
20155	12285	16-03-0600(E)(1)	20240190220299	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.607633
20156	12286	44-53-0370/B1a1	77317/2024A0710200561	Cocaine:PWITD1st	10000.00	General Sessions Court	2024-11-07 22:00:04.610049
20157	12287	56-01-0460(A)(2)(A)	20240190183619	DRIVING UNDER SUSPENSION; LICENSE SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.611758
20158	12287	ICE		ICE Hold	0.00		2024-11-07 22:00:04.612452
20159	12288	56-05-2930(A)	20240190195298	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.614208
20160	12289	44-53-0370	20240190214357	Simple Possession	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.615906
20161	12290	ISH		In-State Hold	0.00		2024-11-07 22:00:04.617847
20162	12291	16-17-0530	20240190214393	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.620145
20163	12291	44-53-0370(D)(5)	20240190214394	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.620722
20164	12292	56-05-2930(A)	20240270083167	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.622808
20165	12293	16-17-0530	20240270097270	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.624551
20166	12293	ICE		ICE Hold	0.00		2024-11-07 22:00:04.625508
20167	12294	16-11-0610	2024A0720400131	TRESPASSING	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.627483
20168	12295	16-03-0600(E)(1)	20240190223060	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.629091
20169	12295	16-17-0530	20240190223061	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.629663
20170	12296	56-05-0740	20240190195281	FAILURE TO COMPLY WITH LAWFUL DIRECTION OF POLICE, FIREMAN, OR CROSSING GUARD	0.00		2024-11-07 22:00:04.63184
20171	12296	56-05-2920	20240190195280	RECKLESS DRIVING	0.00		2024-11-07 22:00:04.632515
20172	12297	ISH		In-State Hold	0.00		2024-11-07 22:00:04.634349
20173	12298	16-23-0030	77111/2024A0710200530	SALE OR DELIVERY OF FIREARM TO AND POSSESSION BY; CERTAIN PERSONS UNLAWFUL; STOLEN FIREARM	0.00	General Sessions Court	2024-11-07 22:00:04.635902
20174	12298	56-10-0520	20240190223074	UNINSURED MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.636468
20175	12298	56-03-0110	20240190223073	PERMITTING OR OPERATING VEHICLE WHICH IS NOT REGISTERED AND LICENSED	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.636981
20176	12299	44-53-0370(B)(2)	77237/2024A0710200546	MANUF.; POSS. OF OTHER SUB. IN SCH. I; II; III OR FLUNITRAZEPAM OR ANALOGUE; W.I.T.D.	0.00	General Sessions Court	2024-11-07 22:00:04.638765
20177	12300	44-53-0370(D)(2)	77119/2024A0710200611	POSS OF OTHER CONTROLLED SUB IN SCHED I TO V	0.00	General Sessions Court	2024-11-07 22:00:04.640475
20178	12300	16-13-0110(A) Enhancement	77118/2024A0710200610	SHOPLIFTING/VALUE 2000 OR LESS ENHANCEMENT PER 16-01-0057	0.00	General Sessions Court	2024-11-07 22:00:04.640915
20179	12301	ISH		In-State Hold	0.00		2024-11-07 22:00:04.643081
20180	12302	00-00-0000f		RunawayJuvenile/arrest	0.00	14th Circuit Family Court	2024-11-07 22:00:04.644825
20181	12303	16-14-0060	15899/2024A0720600308	FINANCIAL TRANSACTION FRAUD	0.00	General Sessions Court	2024-11-07 22:00:04.646325
20182	12304	56-01-0460(A)(1)(A)	20240270091333	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.648279
20183	12305	16-13-180(B)	DNR0001829	RECEIVING GOODS, REPRESENTED AS STOLEN; VALUE $2;000 OR LESS (ENHANCEMENT PER 16-1-57)	0.00	General Sessions Court	2024-11-07 22:00:04.650219
20184	12305	44-53-0370(A)	2024A0710200553	MANUF.; POSS. OF SCH. IV DRUGS; EXCEPT FLUNITRAZEPAM; WITH INTENT TO DISTRIBUTE  - 1ST OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:04.650755
20185	12306	16-13-0110(A) Enhancement	2024019019817	SHOPLIFTING/VALUE 2000 OR LESS ENHANCEMENT PER 16-01-0057	0.00	General Sessions Court	2024-11-07 22:00:04.65295
20186	12306	ISH	2024A4011200314	In-State Hold	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.653544
20187	12307	44-53-0375(A)	77320	POSSESSION OF LESS THAN 1G OF METH OR COCAINE BASE	0.00	General Sessions Court	2024-11-07 22:00:04.655785
20188	12308	44-53-0375/Ad	2024a0720200172/02620	Meth:Poss<1gram1stoffense	0.00	General Sessions Court	2024-11-07 22:00:04.657848
20189	12309	16-17-0530	20240180124519	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.659842
20190	12309	2-1002	2024A0720600349	Resisting Arrest BFPD ORD	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.660416
20191	12309	16-09-0320(B)	2024A0720600348	ASSAULT, BEAT, OR WOUND POLICE OFFICER SERVING PROCESS OR WHILE RESISTING ARREST	0.00	General Sessions Court	2024-11-07 22:00:04.66107
20192	12310	16-03-0210(D)	75431	ASSAULT & BATTERY BY MOB; 3RD DEGREE (BODILY INJURY RESULTS)	0.00	General Sessions Court	2024-11-07 22:00:04.662847
20193	12310	16-25-0020(C)	2024A0710200468	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.663303
20194	12311	56-05-2930(A)	20240270096885	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.66493
20195	12311	56-01-0460(A)(1)(A)	20240270096649	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.665518
20196	12311	44-53-0370/B1a1	06169/2024A0720200158	Cocaine:PWITD1st	0.00	General Sessions Court	2024-11-07 22:00:04.666116
20197	12311	44-53-0370	20240270096879	Simple Possession	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.666684
20198	12311	16-17-0430(A)	2024A072020015	UNLAWFUL COMMUNICATION (AFTER 07/20/01)	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.667217
20199	12312	16-17-0530	20240270095766	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.668986
20200	12313	16-03-1770	2024A0720200171	VIOLATION OF RESTRAINING ORDER ISSUED IN MAGISTRATE COURT (PERSONAL)	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.670593
20201	12314	56-05-2930(A)	8102P0795653	DRIVING UNDER THE INFLUENCE (DUI)	0.00	General Sessions Court	2024-11-07 22:00:04.672347
20202	12314	56-05-1240	8102P0795654	LEAVING THE SCENE OF ACCIDENT INVOLVING UNATTENDED VEHICLE	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.672798
20203	12315	Probation and Parole Viol	W-07-24-0036	Probation and Parole Violation	0.00	General Sessions Court	2024-11-07 22:00:04.674431
20204	12316	ISH		In-State Hold	0.00		2024-11-07 22:00:04.676689
20205	12317	16-03-0600(E)(1)	20240190209163	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.678498
20206	12318	56-05-2930(A)	20242170015717	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.67992
20207	12319	17-11-110	20240180126613	Fleeing to evade arrest or detention	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.681911
20208	12320	56-01-0460(A)(1)(A)		DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00		2024-11-07 22:00:04.683555
20209	12321	56-05-2930(A)	20243070079657	DRIVING UNDER THE INFLUENCE (DUI)	0.00		2024-11-07 22:00:04.685176
20210	12321	56-05-1520(G)(4)	20243070075642	SPEEDING 25MPH OVER THE SPEED LIMIT	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.685646
20211	12322	Public Drunk	20242170014923	Public Drunk	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.687155
20212	12323	56-05-2930(A)	20242351014679	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.688887
20213	12324	43-35-0085(C)	73928 / 2024A0710200528	NEGLECT OF VULNERABLE ADULT	0.00	General Sessions Court	2024-11-07 22:00:04.690577
20214	12325	Family Court Bench Warrnt	2022DR0700008P-001	Family Court Bench Warrant	1250.00	14th Circuit Family Court	2024-11-07 22:00:04.692467
20215	12326	16-25-0020(D)	20240180123104	DOMESTIC VIOLENCE 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.694123
20216	12327	16-09-0320(A)	44700	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00	General Sessions Court	2024-11-07 22:00:04.695721
20217	12327	16-17-0530	20240190195503	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.69616
20218	12328	16-17-0530	20240190222807	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.697619
20219	12329	56-01-0460(A)(1)(A)	20242351280041	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.699375
20220	12330	16-03-0600(E)(1)	20240190183612	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.700905
20221	12331	ISH		In-State Hold	0.00		2024-11-07 22:00:04.702517
20222	12332	16-03-0600(E)(1)	20240190181964	ASSAULT & BATTERY 3RD DEGREE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.704306
20223	12333	56-01-0460(A)(1)(A)	20240180126083	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.705826
20224	12334	16-25-0020(D)	20240270097334	DOMESTIC VIOLENCE 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.707388
20225	12335	56-05-2930(A)	20240190214361	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.709573
20226	12336	Family Court Bench Warrnt	2022DR0700688	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:04.711275
20227	12337	16-13-0230(A)	2024A0710300317	BREACH OF TRUST WITH FRAUDULENT INTENT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.713162
20228	12338	44-53-370(D)(4)	77190/2024A0710200579	POSSESSION OF FENTANYL OR FENTANYL RELATED SUBSTANCES 2 GRAINS OR MORE	0.00	General Sessions Court	2024-11-07 22:00:04.715871
20229	12339	56-05-2920	20240190098058	RECKLESS DRIVING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.717518
20230	12340	44-53-0375(A)	2024A0710300238	POSSESSION OF LESS THAN 1G OF METH OR COCAINE BASE	0.00	General Sessions Court	2024-11-07 22:00:04.719788
20231	12341	44-53-0370/B1a1	77239/2024A0710200630	Cocaine:PWITD1st	0.00	General Sessions Court	2024-11-07 22:00:04.721375
20232	12341	44-53-0370(C)	77240/2024A0710200629	POSS OF NARC IN SCHEDULE I(B),(C), LSD & SCHEDULE II	0.00	General Sessions Court	2024-11-07 22:00:04.722084
20233	12342	16-11-0620		ENTERING PREMISES AFTER WARNING OR REFUSING TO LEAVE ON REQUEST	0.00		2024-11-07 22:00:04.723651
20234	12343	Public Drunk	6102P0051740	Public Drunk	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.725857
20235	12344	Family Court Bench Warrnt	2017DR0700099-004	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:04.727564
20236	12345	56-05-1220	2024A0720400012	HIT AND RUN; ATT. VEHICLE; DUTIES OF DRIVER INVOLVED IN ACCIDENT; PROPERTY DAMAGE	0.00	General Sessions Court	2024-11-07 22:00:04.729187
20237	12345	56-01-0460(A)(1)(B)	2024A0720400013	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 2ND OFFENSE	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.729657
20238	12346	56-01-0460(A)(2)(C)	20242351290649	DRIVING UNDER SUSPENSION; LICENSE SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.731488
20239	12346	56-01-0020	20242351290651	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.732068
20240	12347	56-01-0020	20243070080288	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.733697
20241	12347	56-05-1520(G)(2)	20243070080287	SPEEDING:11MPH-15MPH OVER THE SPEED LIMIT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.734196
20242	12348	56-01-0020	20240190215562	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.735714
20243	12349	16-03-0600(E)(1)	20240270097968	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.737455
20244	12349	16-09-0320(A)	2024A0720200156	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00	General Sessions Court	2024-11-07 22:00:04.737955
20245	12349	16-09-0320(A)	2024A0720200155	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00	General Sessions Court	2024-11-07 22:00:04.738365
20246	12350	56-05-2930(A)	20242170015770	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.740047
20247	12351	61-04-0110	20242351313663	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.742086
20248	12351	56-05-2930(A)	20242351313663	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.742793
20249	12352	16-25-65	75805	DVHAN	0.00	General Sessions Court	2024-11-07 22:00:04.744438
20250	12352	16-03-0600(E)(1)	20240190226763	ASSAULT & BATTERY 3RD DEGREE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.745206
20251	12352	ICE		ICE Hold	0.00		2024-11-07 22:00:04.745718
20252	12353	17-7-111	20240190229595	Loitering (HH Town Ord)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.747271
20253	12353	16-17-0530	20240190229596	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.747817
20254	12354	56-01-0460(A)(2)(A)	20242351303009	DRIVING UNDER SUSPENSION; LICENSE SUSPENDED FOR DUI - 1ST OFFENSE	647.50	Beaufort County Magistrate	2024-11-07 22:00:04.74959
20255	12354	61-04-0110	20242351303010	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	257.50	Beaufort County Magistrate	2024-11-07 22:00:04.750113
20256	12354	56-05-2930(A)	20242351303011	DRIVING UNDER THE INFLUENCE (DUI)	5000.00	Beaufort County Magistrate	2024-11-07 22:00:04.750618
20257	12354	56-01-0020	20242351303008	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	1067.00	Beaufort County Magistrate	2024-11-07 22:00:04.751131
20258	12354	ICE	396551799	ICE Hold	0.00		2024-11-07 22:00:04.751631
20259	12355	56-05-2930(A)	20240180123113	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.753437
20260	12356	16-14-0060(A)(1-5)	2024A0720400171	FINANCIAL TRANSACTION CARD FRAUD IN 6 MONTH PERIOD	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.755144
20261	12357	16-11-0610	20240180123120	TRESPASSING	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.756783
20262	12358	7-7001	20240180118506	Appearing Drunk on Streets	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.758914
20263	12359	16-03-0654	2024A0710300288	CRIMINAL SEXUAL CONDUCT - THIRD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.76069
20264	12360	16-11-0311	64125/2024A0710200563	BURGLARY - FIRST DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.762331
20265	12360	16-23-720	64126/2024A0710200564	Poss/Man Explosive Device	0.00	General Sessions Court	2024-11-07 22:00:04.762922
20266	12361	16-13-0180(A2)	73349	RSG/RECEIVING STOLEN GOODS; VALUE MORE THAN $2,000 BUT LESS THAN $10,000	0.00	General Sessions Court	2024-11-07 22:00:04.76461
20267	12362	Magistrate Bench Warrant	892728	Magistrate Bench Warrant	0.00		2024-11-07 22:00:04.766188
20268	12362	Magistrate Bench Warrant	898985	Magistrate Bench Warrant	0.00		2024-11-07 22:00:04.766675
20269	12362	7-7001	20240180122688	Appearing Drunk on Streets	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.767124
20270	12363	16-17-0530	20240190223132	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.76873
20271	12364	Magistrate Commitment	2024A0710300145	Magistrate Commitment	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.770362
20272	12365	61-04-0110	20240190219205	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.771928
20273	12365	16-13-0110(A) Enhancement	74962	SHOPLIFTING/VALUE 2000 OR LESS ENHANCEMENT PER 16-01-0057	2500.00	General Sessions Court	2024-11-07 22:00:04.772403
20274	12365	16-17-0410	74963	CRIMINAL CONSPIRACY; COMMON LAW CONSPIRACY DEFINED	5000.00	General Sessions Court	2024-11-07 22:00:04.772931
20275	12365	ISH	2024A2710200146	In-State Hold	0.00		2024-11-07 22:00:04.77351
20276	12366	44-53-0370/D3a	77473/2024A0710200576	Cocaine:Possession1st	0.00	General Sessions Court	2024-11-07 22:00:04.775843
20277	12366	44-53-0375/Aa	77474/2024A0710200577	CrackCocaine:Poss1st	0.00	General Sessions Court	2024-11-07 22:00:04.7765
20278	12366	44-53-0370(D)(2)	77475/2024A0710200578	POSS OF OTHER CONTROLLED SUB IN SCHED I TO V	0.00	General Sessions Court	2024-11-07 22:00:04.777169
20279	12366	56-01-0460(A)(1)(A)	20240190226035	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.777742
20280	12366	44-53-0370(D)(5)	20240190226018	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.778286
20281	12367	44-53-0370/d4c	20242170015586	Marij:Poss28g(1oz)<10g-2nd-sub	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.78062
20282	12368	44-53-0370/b1e	78102/2024A0710200522	Marij:PWITD/S&D 1stoffense	0.00	General Sessions Court	2024-11-07 22:00:04.783016
20283	12368	44-53-0375/B1b	78103/2024A0710200524	CrackCocaine:PWITD	0.00	General Sessions Court	2024-11-07 22:00:04.783882
20284	12368	44-53-0370(a1)	78104/2024A0710200525	Cont. Sub: PWITD I-V	0.00	General Sessions Court	2024-11-07 22:00:04.784566
20285	12368	44-53-0370(D)(2)	78105/2024A0710200526	POSS OF OTHER CONTROLLED SUB IN SCHED I TO V	0.00	General Sessions Court	2024-11-07 22:00:04.785581
20286	12368	44-53-0370(D)(2)	78106/2024A0710200524	POSS OF OTHER CONTROLLED SUB IN SCHED I TO V	0.00	General Sessions Court	2024-11-07 22:00:04.786377
20287	12369	16-03-0600(E)(1)	77289 / K-092832	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.788081
20288	12370	General Sessions Commtmnt	00000	General Sessions Commitment	0.00	General Sessions Court	2024-11-07 22:00:04.789784
20289	12371	Magistrate Commitment	20230190201060	Magistrate Commitment	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.791666
20290	12372	9-1008	20240180121139	Loud & Unseemly Noise	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.793576
20291	12373	56-01-0460(A)(1)(A)	20240270099376	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.795618
20292	12374	61-06-4020	20242351274587	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.797527
20293	12374	56-05-2930(A)	20242351274588	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.798038
20294	12374	61-04-0110	20242351274586	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.798509
20295	12375	16-23-0050(A)(2)		UNLAWFUL CARRYING OF PISTOL	0.00	14th Circuit Family Court	2024-11-07 22:00:04.799873
20296	12375	56-01-0510		UNLAWFUL USE OF LICENSE OR FRAUDULENT APPLICATION FOR LICENSE	0.00	14th Circuit Family Court	2024-11-07 22:00:04.800416
20297	12376	16-11-0620	20242170015364	ENTERING PREMISES AFTER WARNING OR REFUSING TO LEAVE ON REQUEST	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.802097
20298	12377	9-1005	20240180120454	Trespassing	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.80351
20299	12378	16-09-0320(B)	17481/2024A0720600309	ASSAULT, BEAT, OR WOUND POLICE OFFICER SERVING PROCESS OR WHILE RESISTING ARREST	0.00	General Sessions Court	2024-11-07 22:00:04.805474
20300	12378	44-53-0370 (D) (5)	202401 80122694	Marij/Poss 28g<10gr<Hash 1st	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.805995
20301	12378	7-7001	20240180122693	Appearing Drunk on Streets	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.806475
20302	12378	16-09-0320(B)	17482/2024A0720600310	ASSAULT, BEAT, OR WOUND POLICE OFFICER SERVING PROCESS OR WHILE RESISTING ARREST	0.00	General Sessions Court	2024-11-07 22:00:04.806981
20303	12379	9-1005	20240180119223	Trespassing	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.809196
20304	12379	7-7002	20240180119224	Public Drinking	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.80993
20305	12380	16-11-0610	9102P0721001	TRESPASSING	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.811598
20306	12381	16-17-0530	20240190220118	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.813055
20307	12382	44-53-370	20242351295475	Marij: Simple Possession	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.814688
20308	12382	56-01-0460(A)(1)(C)	20242351295473	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.815197
20309	12382	56-01-1100	20242351295474	HABITUAL TRAFFIC OFFENDERS; DUS AS PER HABITUAL TRAFFIC OFFENDER STATUS	0.00	General Sessions Court	2024-11-07 22:00:04.815717
20310	12383	56-05-2930(A)	20242351266555	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.817351
20311	12384	16-23-0440(A)	2024a0720200166	DISCHARGING FIREARMS INTO A DWELLING	0.00	General Sessions Court	2024-11-07 22:00:04.819179
20312	12385	16-03-0600(E)(1)	2024A0710200556/75903	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.820616
20313	12386	16-13-0180(A4)	20240180122596	RSG/RECEIVING STOLEN GOODS; VALUE $2,000 OR LESS	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.822144
20314	12386	56-01-0460(A)(1)(B)	20240180122595	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 2ND OFFENSE	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.822747
20315	12387	16-13-0230(A)	2024A0720600287	BREACH OF TRUST WITH FRAUDULENT INTENT	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.824278
20316	12388	16-13-0230(A)	2024A0720600306	BREACH OF TRUST WITH FRAUDULENT INTENT	0.00	General Sessions Court	2024-11-07 22:00:04.826436
20317	12388	16-13-0230(A)	2024A0720600307	BREACH OF TRUST WITH FRAUDULENT INTENT	0.00	General Sessions Court	2024-11-07 22:00:04.827013
20318	12389	61-04-0110	20240190222629	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.828508
20319	12389	61-06-4020	20240190222631	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.829059
20320	12389	56-05-0750(B)(2)	20240190222630	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 2ND OR SUB. OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:04.829557
20321	12389	56-01-0460(A)(2)(C)	20240190222632	DRIVING UNDER SUSPENSION; LICENSE SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:04.829955
20322	12389	56-05-2930(A)	20240190218943	DRIVING UNDER THE INFLUENCE (DUI)	0.00	General Sessions Court	2024-11-07 22:00:04.830478
20323	12390	44-53-0370/b1e	77189	Marij:PWITD/S&D 1stoffense	0.00	General Sessions Court	2024-11-07 22:00:04.832149
20324	12391	56-05-2930(A)	20240190220035	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.83369
20325	12391	44-53-0370/D3a	75530	Cocaine:Possession1st	0.00	General Sessions Court	2024-11-07 22:00:04.8341
20326	12392	56-01-0460(A)(1)(C)	20240190228493	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.835609
20327	12392	56-10-0520	20240190228491	UNINSURED MOTOR VEHICLE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.836208
20328	12392	56-10-0240(D)(1)	20240190228492	FAILURE TO RETURN LICENSE PLATE AND REGISTRATION UPON LOSS OF INSURANCE 1ST	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.836656
20329	12393	ISH		In-State Hold	0.00		2024-11-07 22:00:04.838469
20330	12394	16-23-0500(A)	2024A0720400149	POSSESSION OF FIREARM OR AMMUNITION BY PERSON CONVICTED OF VIOLENT FELONY	0.00	General Sessions Court	2024-11-07 22:00:04.840113
20331	12394	2-1003	20242170015752	Resisting,Interfering w/Officer	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.84073
20332	12395	56-01-0020	20242170015622	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.844212
20333	12395	56-10-0225	20242170015623	FAILURE TO MAINTAIN PROOF OF INSURANCE IN MOTOR VEHICLE	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.844724
20334	12395	56-03-1360	20242170015624	IMPROPER VEHICLE LICENSE (REGISTERED TO ANOTHER VEHICLE)	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.845134
20335	12396	16-23-0500(A)	77197/2024A0710200632	POSSESSION OF FIREARM OR AMMUNITION BY PERSON CONVICTED OF VIOLENT FELONY	0.00	General Sessions Court	2024-11-07 22:00:04.846709
20336	12396	44-53-0370/b1e	77196/2024A0710200633	Marij:PWITD/S&D 1stoffense	0.00	General Sessions Court	2024-11-07 22:00:04.847311
20337	12396	61-04-0110	20240190223792	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.847839
20338	12396	56-01-0460(A)(1)(A)	20240190223791	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.848336
20339	12397	ISH		In-State Hold	0.00		2024-11-07 22:00:04.849713
20340	12398	16-01-0055	2024A0720600275	ACCESSORY AFTER THE FACT TO AN EXEMPT FELONY OR FELONY A-F OR MURDER	0.00	General Sessions Court	2024-11-07 22:00:04.851385
20341	12399	44-53-0370	20240190223326	Simple Possession	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.852831
20342	12400	16-11-0510(A)	20242170015523	MALICIOUS INJURY TO ANIMALS; PERSONAL PROPERTY	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.85412
20343	12401	44-53-0370/D3a	2024A0710200547	Cocaine:Possession1st	0.00	General Sessions Court	2024-11-07 22:00:04.855788
20344	12401	56-05-2930(A)	20240190223079	DRIVING UNDER THE INFLUENCE (DUI)	0.00	General Sessions Court	2024-11-07 22:00:04.856373
20345	12402	56-01-0460(A)(2)(A)	20240190187404	DRIVING UNDER SUSPENSION; LICENSE SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.857915
20346	12403	56-05-2930(A)	20240190227321	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.859809
20347	12404	16-15-0405(A)	2024A0710400211	SEXUAL EXPLOITATION OF A MINOR: 2ND DEGREE	25000.00	General Sessions Court	2024-11-07 22:00:04.861484
20348	12404	16-15-0405(A)	2024A0710400212	SEXUAL EXPLOITATION OF A MINOR: 2ND DEGREE	25000.00	General Sessions Court	2024-11-07 22:00:04.862033
20349	12405	16-17-0530	20240190210222	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.863378
20350	12406	44-53-0370(D)(5)		POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00		2024-11-07 22:00:04.864826
20351	12407	16-23-0440(B)	73931/2024A0710400252	DISCHARGING FIREARM INTO VEHICLE; AIRCRAFT; ETC. WHILE OCCUPIED	10000.00	General Sessions Court	2024-11-07 22:00:04.866345
20352	12407	16-23-0490	73930/2024A0710400254	POSS. WEAPON DURING VIOLENT CRIME; IF NOT ALSO SENTENCED TO LIFE WITHOUT PAROLE OR DEATH	5000.00	General Sessions Court	2024-11-07 22:00:04.866841
20353	12407	16-03-0029	73929/2024A0710400255	ATTEMPTED MURDER	75000.00	General Sessions Court	2024-11-07 22:00:04.867276
20354	12407	16-23-0410	73932/2024A0710400253	POINTING AND PRESENTING FIREARMS AT A PERSON	10000.00	General Sessions Court	2024-11-07 22:00:04.867703
20355	12407	44-53-0370	4102P0330343	Simple Possession	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.868198
20356	12407	56-01-0460(A)(1)(A)	4102P0330342	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.868722
20357	12407	ICE	396522481	ICE Hold	0.00		2024-11-07 22:00:04.869156
20358	12408	45-01-0050(A)	20240180118568	DEFRAUDING HOTEL; INN; BOARDING HOUSE OR RESTAURANT	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.870839
20359	12409	56-05-2930(A)	20240190202453	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.872592
20360	12410	44-53-0375(A)	2024A0710300319	POSSESSION OF LESS THAN 1G OF METH OR COCAINE BASE	0.00	General Sessions Court	2024-11-07 22:00:04.874279
20361	12411	16-25-0020(C)	68596/2024A0710300280	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.876498
20362	12411	16-11-0510(A)	68595/2024A0710300279	MALICIOUS INJURY TO ANIMALS; PERSONAL PROPERTY	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.876998
20363	12412	56-05-2930(A)	20240190227376	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.878393
20364	12413	56-01-1100	20240190222378	HABITUAL TRAFFIC OFFENDERS; DUS AS PER HABITUAL TRAFFIC OFFENDER STATUS	0.00	General Sessions Court	2024-11-07 22:00:04.879978
20365	12414	16-17-0530	20240190194517	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.881569
20366	12415	2-1002	20240180126084	Resisting Arrest BFPD ORD	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.883099
20367	12416	16-11-0510(A)	17960/2024A0720600314	MALICIOUS INJURY TO ANIMALS; PERSONAL PROPERTY	0.00	General Sessions Court	2024-11-07 22:00:04.884833
20368	12416	16-11-0312	17959/2024A0720600315	BURGLARY (NON-VIOLENT) - SECOND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.885342
20369	12416	16-11-0610	17961/2024A0720600316	TRESPASSING	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.885801
20370	12417	16-13-0110(A)	2024A0710300335	SHOPLIFTING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.887542
20371	12418	Magistrate Court Commitmt	20240190208934	Magistrate Court Commitmt	0.00		2024-11-07 22:00:04.889306
20372	12419	56-05-0750(B)(1)	20240190224868	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 1ST OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:04.890991
20373	12420	56-01-0460(A)(1)(A)	20242351281537	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.89333
20374	12421	16-13-0110(A) Enhancement	2024A0720400164	SHOPLIFTING/VALUE 2000 OR LESS ENHANCEMENT PER 16-01-0057	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.894747
20375	12422	44-53-0370(D)(5)	20240190228484	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.896254
20376	12422	44-53-0375(A)	77236/2024A0710200515	POSSESSION OF LESS THAN 1G OF METH OR COCAINE BASE	0.00	General Sessions Court	2024-11-07 22:00:04.89681
20377	12423	Magistrate Bench Warrant	20230190195437	Magistrate Bench Warrant	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.898617
20378	12423	16-03-0600(D)(1)	2024A0710200404	ASSAULT & BATTERY 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.89911
20379	12424	56-05-2930(A)	20240190222272	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.900637
20380	12425	44-53-370	20240190226738	Marij: Simple Possession	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.902473
20381	12426	9-1005	20240180122586	Trespassing	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.904142
20382	12427	56-05-3160	20240180123109	PEDESTRIANS ON HIGHWAYS	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.905733
20383	12428	56-05-3160	20240190224740	PEDESTRIANS ON HIGHWAYS	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.907487
20384	12429	2-1002	20240180106038	Resisting Arrest BFPD ORD	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.90967
20385	12429	9-1005	20240180104922	Trespassing	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.910571
20386	12430	16-11-0640	4102P0067571	UNLAWFUL ENTRY INTO ENCLOSED PLACES	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.911939
20387	12431	16-11-0313	75878 / 2024A0710200585	BURGLARY - THIRD DEGREE- 1ST OR 2ND OFFENSE	10000.00	General Sessions Court	2024-11-07 22:00:04.913752
20388	12431	16-13-0030(A)	20240190223528	PETIT OR SIMPLE LARCENY -$2,000 OR LESS	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.914331
20389	12432	General Sessns Bench Warr	2019A0710200285	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:04.915812
20390	12432	Family Court Bench Warrnt	2000DR0701052	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:04.916365
20391	12433	16-13-0420(A)	2024A0710400174	FAILURE TO RETURN RENTED OBJECTS; FRAUD APPROPRIATION	0.00	General Sessions Court	2024-11-07 22:00:04.918022
20392	12434	44-53-0370	20240190098047	Simple Possession	0.00		2024-11-07 22:00:04.919706
20393	12435	16-23-0050(A)(2)		UNLAWFUL CARRYING OF PISTOL	0.00	14th Circuit Family Court	2024-11-07 22:00:04.921384
20394	12436	44-53-0375(A)	2024A0720200165	POSSESSION OF LESS THAN 1G OF METH OR COCAINE BASE	0.00	General Sessions Court	2024-11-07 22:00:04.923046
20395	12436	ICE		ICE Hold	0.00		2024-11-07 22:00:04.923577
20396	12437	16-03-0600(E)(1)	20240190214505	ASSAULT & BATTERY 3RD DEGREE	0.00		2024-11-07 22:00:04.925486
20397	12438	ISH		In-State Hold	0.00		2024-11-07 22:00:04.927224
20398	12439	16-17-0725 (B)	20240190225109	GIVING FALSE INFO TO LEO, FIRE, OR RESCUE DEPT. - TRAFFIC	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.928825
20399	12440	16-11-0311	76116/2024A0710200504	BURGLARY - FIRST DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.930336
20400	12441	56-05-2930(A)	20240190224566	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.931871
20401	12441	56-05-2947	20240190224668	CHILD ENDANGERMENT; COMMIT CERTAIN VEHICULAR OFFENSES W/ MINOR IN VEHICLE (ENHANCE-HALF MAX PENALTY)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.932426
20402	12442	16-11-0510(A)	2024A0710300322	MALICIOUS INJURY TO ANIMALS; PERSONAL PROPERTY	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.934109
20403	12443	16-13-0030(A)	2024A0720400091	PETIT OR SIMPLE LARCENY -$2,000 OR LESS	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.935626
20404	12443	16-21-0090	2024A0720400092	DAMAGING OR TAMPERING WITH A VEHICLE	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.936096
20405	12443	16-21-0090	2024A0720400093	DAMAGING OR TAMPERING WITH A VEHICLE	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.936827
20406	12443	16-13-0030(A)	2024A0720400095	PETIT OR SIMPLE LARCENY -$2,000 OR LESS	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.937474
20407	12443	16-21-0090	2024A0720400096	DAMAGING OR TAMPERING WITH A VEHICLE	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.938015
20408	12443	16-21-0090	2024A0720400094	DAMAGING OR TAMPERING WITH A VEHICLE	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.938465
20409	12444	17-7-111	20240190213844	Loitering (HH Town Ord)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.940118
20410	12444	Magistrate Bench Warrant	20220190179994	Magistrate Bench Warrant	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.94064
20411	12445	16-13-0110(A)	2024A0720400154	SHOPLIFTING	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.942725
20412	12446	7-7001	20240180122583	Appearing Drunk on Streets	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.944545
20413	12446	56-05-3170(B)	20240180122582	PEDESTRIAN ON CONTROLLED ACCESS HIGHWAY	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.944969
20414	12447	61-06-4020		TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.946452
20415	12448	44-53-0370(a1)	01130	Cont. Sub: PWITD I-V	0.00	General Sessions Court	2024-11-07 22:00:04.948249
20416	12449	63-19-2440	20240190156897	ABC(B/W):PURCHASE, COMSUMPTION OR POSSESSION OF BEER OR WINE BY MINOR	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.949785
20417	12450	61-04-0110	20240190214004	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.952189
20418	12451	56-05-0750(B)(1)	2023A0710200496	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 1ST OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:04.954171
20419	12452	56-05-2930(A)	8102P0795507	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.955698
20420	12453	16-25-0020(C)	20240270091506	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.957248
20421	12454	16-17-0530	20240180122687	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.959583
20422	12455	16-17-0530	20240180126497	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.961177
20423	12456	56-05-2933(A)	20242351322287	DRIVING WITH AN UNLAWFUL ALCOHOL CONCENTRATION (DUAC)	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.962714
20424	12456	44-53-0370 (D) (5)	20242351322288	Marij/Poss 28g<10gr<Hash 1st	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.963299
20425	12456	61-04-0110	20242351322289	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.963795
20426	12457	16-25-0020(C)	20240190223127	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.96544
20427	12458	56-05-1930		FOLLOWING VEHICLE TOO CLOSELY	0.00		2024-11-07 22:00:04.966879
20428	12459	16-25-0020(C)	20240190198439	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:04.968528
20429	12460	16-03-0600(E)(1)	20240190227375	ASSAULT & BATTERY 3RD DEGREE	0.00	Beaufort County Magistrate	2024-11-07 22:00:04.969959
20430	12461	56-05-2930(A)	20242170016069	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.971687
20431	12461	56-05-1210(A)(1)	20242170016070	HIT AND RUN; DUTIES OF DRIVER INVOLVED IN ACCIDENT WITH MINOR PERSONAL INJURY	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.97225
20432	12461	56-05-1210(A)(1)	20242170016068	HIT AND RUN; DUTIES OF DRIVER INVOLVED IN ACCIDENT WITH MINOR PERSONAL INJURY	0.00	Port Royal Municipal Court	2024-11-07 22:00:04.972762
20433	12462	7-7004	20240180119973	Possession of Open Containers	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.974231
20434	12462	56-05-2930(A)	20240180119972	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.975058
20435	12463	16-13-0110(A)	2024A0710300358	SHOPLIFTING	2125.00	Bluffton Magistrate Court	2024-11-07 22:00:04.976907
20436	12463	16-13-0110(A)	2024A0710300339	SHOPLIFTING	2125.00	Bluffton Magistrate Court	2024-11-07 22:00:04.977419
20437	12464	44-53-1110	20240180117381	GLUE SNIFFING , AROMATIC HYDROCARBONS UNLAWFUL	0.00	Beaufort City Municipal Court	2024-11-07 22:00:04.97905
20438	12465	16-17-0722(B)	2024A0710300331	FILING A FALSE POLICE REPORT OF A FELONY VIOLATION	0.00	General Sessions Court	2024-11-07 22:00:04.980523
20439	12466	56-05-2930(A)		DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.982633
20440	12467	56-05-2930(A)	20240190210491	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.984068
20441	12468	56-05-0750(B)(1)	20240270083159	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 1ST OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.985878
20442	12468	56-01-0020	20240270083160	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:04.986431
20443	12469	61-04-0110	20240190098051	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.988053
20444	12470	56-01-0460(A)(2)(C)	20240190222633	DRIVING UNDER SUSPENSION; LICENSE SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:04.989803
20445	12470	56-01-1100	20240190222634	HABITUAL TRAFFIC OFFENDERS; DUS AS PER HABITUAL TRAFFIC OFFENDER STATUS	0.00	General Sessions Court	2024-11-07 22:00:04.990411
20446	12471	ISH		In-State Hold	0.00		2024-11-07 22:00:04.992595
20447	12472	16-23-0410	69300/2024a0710200572	POINTING AND PRESENTING FIREARMS AT A PERSON	0.00	General Sessions Court	2024-11-07 22:00:04.994241
20448	12473	56-05-2930(A)	20240190218777	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.996037
20449	12473	56-01-0020	20240190218776	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.996624
20450	12474	56-05-2930(A)	20242351248297	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.998237
20451	12474	56-01-0020	20242351248298	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.998845
20452	12474	61-04-0110	20242351248299	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:04.999407
20453	12475	56-05-2930(A)	20242351274979	DRIVING UNDER THE INFLUENCE (DUI)	0.00		2024-11-07 22:00:05.000843
20454	12475	56-01-0020	20242351274980	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00		2024-11-07 22:00:05.001396
20455	12476	56-05-2930(A)		DRIVING UNDER THE INFLUENCE (DUI)	0.00		2024-11-07 22:00:05.003106
20456	12476	56-01-0020		DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00		2024-11-07 22:00:05.00353
20457	12477	56-01-0020	20240190227360	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.004799
20458	12477	56-01-0460(A)(1)(A)	20240190227359	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.005198
20459	12478	44-53-0370(A)	70675/2024A0710200503	MANUF.; POSS. OF SCH. IV DRUGS; EXCEPT FLUNITRAZEPAM; WITH INTENT TO DISTRIBUTE  - 1ST OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:05.006917
20460	12479	56-05-2930(A)	20240190221313	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.009395
20461	12479	56-01-0020	20230190221311	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.009908
20462	12479	61-04-0110	20240190221312	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.010326
20463	12480	16-25-0020(D)	20242170015386	DOMESTIC VIOLENCE 3RD DEGREE	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.01186
20464	12481	16-17-0530	20240190223091	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.013867
20465	12482	16-17-0530	20240198576	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.015359
20466	12483	56-01-0020	20242351276582	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.017129
20467	12483	56-05-4410	20242351276583	UNLAWFUL OPERATION OF UNSAFE OR IMPROPERLY EQUIPPED VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.017692
20468	12483	56-05-3890(B)	20242351276584	UNLAWFUL TO TEXT WHILE OPERATING A MOTOR VEHICLE - NON-CRIMINAL	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.018256
20469	12483	16-23-0030	2024A0710400217	SALE OR DELIVERY OF FIREARM TO AND POSSESSION BY; CERTAIN PERSONS UNLAWFUL; STOLEN FIREARM	0.00	General Sessions Court	2024-11-07 22:00:05.018771
20470	12483	16-23-0030	2024A0710400218	SALE OR DELIVERY OF FIREARM TO AND POSSESSION BY; CERTAIN PERSONS UNLAWFUL; STOLEN FIREARM	0.00	General Sessions Court	2024-11-07 22:00:05.019221
20471	12483	16-23-0530(A)	2024A0710400219	POSSESSION; PURCHASE; SALE; OR TRANSPORT BY AN UNLAWFUL ALIEN	0.00	General Sessions Court	2024-11-07 22:00:05.019719
20472	12483	16-23-0530(A)	2024A0710400220	POSSESSION; PURCHASE; SALE; OR TRANSPORT BY AN UNLAWFUL ALIEN	0.00	General Sessions Court	2024-11-07 22:00:05.02025
20473	12483	ICE		ICE Hold	0.00		2024-11-07 22:00:05.020858
20474	12485	56-05-0750(B)(1)	20240190218821	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.024048
20475	12485	56-05-2930(A)	20240190218820	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.024489
20476	12486	44-53-0370/D3a	773187/2024A0710200560	Cocaine:Possession1st	5000.00	General Sessions Court	2024-11-07 22:00:05.027186
20477	12486	ICE		ICE Hold	0.00		2024-11-07 22:00:05.027776
20478	12487	61-06-4020	2042170015741	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.029361
20479	12487	56-01-0020	20242170015740	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.02984
20480	12487	16-23-0500(A)	2024A0720400146	POSSESSION OF FIREARM OR AMMUNITION BY PERSON CONVICTED OF VIOLENT FELONY	0.00	General Sessions Court	2024-11-07 22:00:05.030494
20481	12488	16-13-0110(A)	20240190218936	SHOPLIFTING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.032079
20482	12488	16-03-0600(E)(1)	20240190218937	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.032583
20483	12489	56-05-2930(A)	20240190227373	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.034024
20484	12489	56-01-0020	20240190227372	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.034564
20485	12489	ICE		ICE Hold	0.00		2024-11-07 22:00:05.035139
20486	12490	16-17-0530	20240190215950	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.036507
20487	12491	ISH		In-State Hold	0.00		2024-11-07 22:00:05.038204
20488	12492	56-01-0020	20242351268586	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.039793
20489	12492	56-10-0520	20242351268587	UNINSURED MOTOR VEHICLE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.040208
20490	12493	56-05-2930(A)	20240270099381	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.042079
20491	12494	ISH		In-State Hold	0.00		2024-11-07 22:00:05.044189
20492	12495	16-25-0020(C)	20240270095490	DOMESTIC VIOLENCE 2ND DEGREE	0.00		2024-11-07 22:00:05.045799
20493	12496	Family Court Bench Warrnt	2022DR0701260	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:05.047986
20494	12497	16-25-0020(D)	20240190194714	DOMESTIC VIOLENCE 3RD DEGREE	0.00		2024-11-07 22:00:05.049433
20495	12498	ICE		ICE Hold	0.00		2024-11-07 22:00:05.050784
20496	12499	56-05-2930(A)	20242351287942	DRIVING UNDER THE INFLUENCE (DUI)	0.00	General Sessions Court	2024-11-07 22:00:05.05234
20497	12499	61-04-0110	20242351280611	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.052909
20498	12499	56-01-0460(A)(2)(A)	20242351280610	DRIVING UNDER SUSPENSION; LICENSE SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.053384
20499	12500	ISH		In-State Hold	0.00		2024-11-07 22:00:05.054855
20500	12501	63-05-0080	2024A0710300212	CRUELTY TO CHILDREN (TORTURE, DEPRIVATION)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.056596
20501	12501	ICE		ICE Hold	0.00		2024-11-07 22:00:05.057094
20502	12502	56-01-0020	20240190225114	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.05924
20503	12503	16-21-0090	20240190198509	DAMAGING OR TAMPERING WITH A VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.061192
20504	12504	54-3	20240190228499	FLEEING TO EVADE/ARREST	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.062612
20505	12504	44-53-0370/D3a	2024A0710200363	Cocaine:Possession1st	0.00	General Sessions Court	2024-11-07 22:00:05.06314
20506	12504	ICE		ICE Hold	0.00		2024-11-07 22:00:05.063598
20507	12505	ISH		In-State Hold	0.00		2024-11-07 22:00:05.065018
20508	12506	16-11-0610	20240190200025	TRESPASSING	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.066512
20509	12507	16-11-0610	20240190220017	TRESPASSING	0.00		2024-11-07 22:00:05.068183
20510	12508	16-11-0610	20240190228603	TRESPASSING	0.00		2024-11-07 22:00:05.0698
20511	12509	16-11-0312	2024A0710300299 / 76076	BURGLARY (NON-VIOLENT) - SECOND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.07124
20512	12510	16-11-0312	2024A0710200561	BURGLARY (NON-VIOLENT) - SECOND DEGREE	10000.00	General Sessions Court	2024-11-07 22:00:05.072595
20513	12511	56-05-2930(A)	20242351312474	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.074734
20514	12511	56-05-1520(A)	20242351312473	DRIVING VEHICLE TOO FAST FOR CONDITIONS	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.075449
20515	12512	44-53-370		Marij: Simple Possession	0.00		2024-11-07 22:00:05.077898
20516	12513	61-06-4020	20242351281378	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.079649
20517	12513	56-05-2930(A)	20242351281379	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.080146
20518	12514	00-00-0000L	20240180119975	VIOLATION OF CITY ORDINANCE (USE STATE CODE IF POSSIBLE)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.081746
20519	12514	56-05-2930(A)	20240180119976	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.082154
20520	12515	16-15-0090	20240190199376	PROSTITUTION	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.084005
20521	12516	7-7001	20240180118493	Appearing Drunk on Streets	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.085552
20522	12517	16-03-0010	2024A0710400230/75744	MURDER	0.00	General Sessions Court	2024-11-07 22:00:05.086834
20523	12517	16-23-0490	2024A0710400231/75745	POSS. WEAPON DURING VIOLENT CRIME; IF NOT ALSO SENTENCED TO LIFE WITHOUT PAROLE OR DEATH	25000.00	General Sessions Court	2024-11-07 22:00:05.08772
20524	12517	00-00-0000	2024A0710400232/75746	Breach/ Breach of Peace, Aggravated in Nature	25000.00	General Sessions Court	2024-11-07 22:00:05.08815
20525	12518	Family Court Bench Warrnt	200DR071413	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:05.089574
20526	12518	Family Court Bench Warrnt	1995DR0700377	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:05.090078
20527	12519	16-03-0600(E)(1)	20240190222733	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.092287
20528	12520	2-1002	20240180126081	Resisting Arrest BFPD ORD	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.093822
20529	12520	9-1005	20240180126082	Trespassing	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.094407
20530	12521	16-11-0510(A)	2024A0710300282	MALICIOUS INJURY TO ANIMALS; PERSONAL PROPERTY	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.096026
20531	12521	16-11-0510(A)	2024A0710300283	MALICIOUS INJURY TO ANIMALS; PERSONAL PROPERTY	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.096452
20532	12521	16-11-0510(A)	2024A0710300284	MALICIOUS INJURY TO ANIMALS; PERSONAL PROPERTY	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.096883
20533	12522	16-11-0610	20240190223782	TRESPASSING	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.098261
20534	12523	Family Court Bench Warrnt	2022DR0700349	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:05.10004
20535	12524	56-05-2920	20240190226744	RECKLESS DRIVING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.101733
20536	12525	44-53-370	20240190221308	Marij: Simple Possession	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.10348
20537	12526	16-03-0600(E)(1)	20240190175780	ASSAULT & BATTERY 3RD DEGREE	0.00		2024-11-07 22:00:05.105158
20538	12527	16-25-0020(C)	20240270099382	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.10679
20539	12527	ICE		ICE Hold	0.00		2024-11-07 22:00:05.107304
20540	12528	56-01-0020	20243070078448	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00		2024-11-07 22:00:05.109205
20541	12528	56-05-1520(G)(3)	20243070078447	SPEEDING 15MPH-24MPH OVER THE SPEED LIMIT	0.00		2024-11-07 22:00:05.109826
20542	12529	56-01-0460(A)(1)(B)	20240190098069	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 2ND OFFENSE	0.00		2024-11-07 22:00:05.112068
20543	12530	56-01-0020	20242351293167	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.113473
20544	12530	56-05-1930	20242351293168	FOLLOWING VEHICLE TOO CLOSELY	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.11398
20545	12531	16-13-0110(A)	20240190214072	SHOPLIFTING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.115706
20546	12531	44-53-370	20240190214042	Marij: Simple Possession	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.116105
20547	12532	Probation and Parole Viol	W-07-24-0049	Probation and Parole Violation	0.00	General Sessions Court	2024-11-07 22:00:05.117548
20548	12533	Probation and Parole Viol	W-07-24-0056	Probation and Parole Violation	0.00	General Sessions Court	2024-11-07 22:00:05.118891
20549	12534	16-03-0210(D)	2024A0710300300	ASSAULT & BATTERY BY MOB; 3RD DEGREE (BODILY INJURY RESULTS)	0.00	General Sessions Court	2024-11-07 22:00:05.120545
20550	12535	16-23-0500(A)	17353/2024a0720600357	POSSESSION OF FIREARM OR AMMUNITION BY PERSON CONVICTED OF VIOLENT FELONY	0.00	General Sessions Court	2024-11-07 22:00:05.122075
20551	12536	56-03-0110	202424210100885	PERMITTING OR OPERATING VEHICLE WHICH IS NOT REGISTERED AND LICENSED	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.123597
20552	12536	56-01-2070	20242421010884	DRIVING COMMERCIAL MOTOR VEHICLE WITHOUT PROPER LICENSE OR PERMIT	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.124152
20553	12536	ICE		ICE Hold	0.00		2024-11-07 22:00:05.124906
20554	12537	56-01-0020	20240190177119	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.126948
20555	12538	56-01-0460(A)(1)(A)		DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00		2024-11-07 22:00:05.128706
20556	12539	56-01-0460(A)(2)(A)	20240270092206	DRIVING UNDER SUSPENSION; LICENSE SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.130102
20557	12540	56-05-2930(A)	20240180123544	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.131817
20558	12541	56-01-0460(A)(1)(B)	20240190203084	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 2ND OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.133425
20559	12541	56-10-0520	20240190208910	UNINSURED MOTOR VEHICLE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.133835
20560	12541	56-01-1100	20240190208911	HABITUAL TRAFFIC OFFENDERS; DUS AS PER HABITUAL TRAFFIC OFFENDER STATUS	0.00	General Sessions Court	2024-11-07 22:00:05.134287
20561	12541	56-09-0340	20240190203085	FAILURE TO SURRENDER DRIVER'S LICENSE/REGISTRATION/VEHICLE LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.134779
20562	12542	16-03-0600(E)(1)	2024A0720600303	ASSAULT & BATTERY 3RD DEGREE	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.136809
20563	12543	16-11-0640	2024A0710300249	UNLAWFUL ENTRY INTO ENCLOSED PLACES	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.138353
20564	12544	16-13-0110(A)	20240270092611	SHOPLIFTING	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.139661
20565	12545	16-25-0020(C)	2024A0710200509	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.141758
20566	12546	44-53-0370(D)(5)	20240190224869	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00		2024-11-07 22:00:05.1436
20567	12547	16-25-0020(C)	20240190198848	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.145816
20568	12548	16-17-0530	20240190215673	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.147401
20569	12549	56-10-0520	2024170014931	UNINSURED MOTOR VEHICLE	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.149142
20570	12549	56-01-0460(A)(1)(A)	20241700149333	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.149661
20571	12549	44-53-0375	2024A07204001693	SIMPLE POSSESSION OF CRACK	0.00		2024-11-07 22:00:05.1501
20572	12550	56-01-0020	20242351305944	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.151633
20573	12550	56-05-2930(A)	20242351305945	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.152208
20574	12550	61-06-4020	20242351305946	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.152713
20575	12551	16-11-0620	20242170015401	ENTERING PREMISES AFTER WARNING OR REFUSING TO LEAVE ON REQUEST	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.154177
20576	12552	16-13-0110(A)	20240190195504	SHOPLIFTING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.155616
20577	12552	44-53-0370(D)(3)	64123/2024A0710200510	POSSESSION OF COCAINE, POSSESSION OF 15 DOSAGE UNITS OF MDMA OR ECSTASY	0.00	General Sessions Court	2024-11-07 22:00:05.156004
20578	12552	16-13-0030(A)	2024A0710300221	PETIT OR SIMPLE LARCENY -$2,000 OR LESS	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.156524
20579	12553	56-01-0020		DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00		2024-11-07 22:00:05.158483
20580	12554	16-23-0465(B)(1)	16536/2024A0720600311	UNLAWFUL CONSUMPTION OF ALCOHOL WHILE CARRYING CONCEALED WEAPON	0.00	General Sessions Court	2024-11-07 22:00:05.160446
20581	12555	16-25-0020(D)	20240190225118	DOMESTIC VIOLENCE 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.162088
20582	12556	Family Court Bench Warrnt	2019DR0701364	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:05.164102
20583	12557	17-09-0010	69299	FUG. FROM JUSTICE WARRANT; NON-CRIM. HOLD FUG. MAX. 20 DAYS. GOV. OFC.	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.165377
20584	12558	Drug Court Commitment	2020GS0702032	Drug Court Commitment	0.00	General Sessions Court	2024-11-07 22:00:05.16716
20585	12559	56-01-0020	20240190214843	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.168629
20586	12559	61-04-0110	20240190214844	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.169092
20587	12559	56-05-2930(A)	20240190214917	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.169605
20588	12559	17-09-0010	64391/2024A0710200558	FUG. FROM JUSTICE WARRANT; NON-CRIM. HOLD FUG. MAX. 20 DAYS. GOV. OFC.	0.00	General Sessions Court	2024-11-07 22:00:05.170014
20589	12560	56-01-0020	901704	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.171437
20590	12560	56-05-2930(A)	901703	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.172043
20591	12561	56-01-0460(A)(1)(A)	20240270092366	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.173649
20592	12562	16-25-0020(C)	20240190222612	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.175551
20593	12562	ICE		ICE Hold	0.00		2024-11-07 22:00:05.176096
20594	12563	56-05-2930(A)	20242351041571	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.177678
20595	12564	16-03-0600(E)(1)	2024A0710400213	ASSAULT & BATTERY 3RD DEGREE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.179096
20596	12565	56-05-2930(A)	20240190226273	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.180445
20597	12565	56-01-0460(A)(1)(C)	20240190226273	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.180821
20598	12566	Family Court Bench Warrnt	2010DR0701663	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:05.182942
20599	12566	Family Court Bench Warrnt	2016DR0701556	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:05.183477
20600	12566	Family Court Bench Warrnt	2018DR0700967	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:05.183912
20601	12567	General Sessns Bench Warr	J350781	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:05.185424
20602	12568	16-03-0210(D)	2023A0720400103	ASSAULT & BATTERY BY MOB; 3RD DEGREE (BODILY INJURY RESULTS)	0.00	General Sessions Court	2024-11-07 22:00:05.18742
20603	12568	16-03-0210(D)	2023A0720400102	ASSAULT & BATTERY BY MOB; 3RD DEGREE (BODILY INJURY RESULTS)	0.00	General Sessions Court	2024-11-07 22:00:05.187858
20604	12568	16-03-0210(D)	2023A0720400101	ASSAULT & BATTERY BY MOB; 3RD DEGREE (BODILY INJURY RESULTS)	0.00	General Sessions Court	2024-11-07 22:00:05.188338
20605	12569	56-05-1210(A)(2)	75126/2024A0710300233	HIT AND RUN; DUTIES OF DRIVER INVOLVED IN ACCIDENT WITH GREAT BODILY INJURY	0.00	General Sessions Court	2024-11-07 22:00:05.190101
20606	12570	56-05-2930(A)	20240190224671	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.192158
20607	12571	56-01-0460(A)(1)(A)	20240270097250	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.194054
20608	12571	56-10-0240(D)(1)	20240270097256	FAILURE TO RETURN LICENSE PLATE AND REGISTRATION UPON LOSS OF INSURANCE 1ST	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.194786
20609	12571	56-03-0110	20240270097275	PERMITTING OR OPERATING VEHICLE WHICH IS NOT REGISTERED AND LICENSED	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.195395
20610	12572	ISH		In-State Hold	0.00		2024-11-07 22:00:05.196989
20611	12573	16-25-0020(A)	2024A0720600296	DOMESTIC VIOLENCE	0.00	General Sessions Court	2024-11-07 22:00:05.198529
20612	12574	Drug Court Bench Warrant	2020GS0702032	Drug Court Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:05.200548
20613	12574	Drug Court Bench Warrant	2023GS0701001	Drug Court Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:05.201081
20614	12574	Family Court Bench Warrnt	2024DR0700005	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:05.201557
20615	12575	61-04-0110	20240190223072	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.202952
20616	12575	17-09-0010	76427/2024A0710200531	FUG. FROM JUSTICE WARRANT; NON-CRIM. HOLD FUG. MAX. 20 DAYS. GOV. OFC.	0.00	General Sessions Court	2024-11-07 22:00:05.203553
20617	12576	16-11-0610	20240190186968	TRESPASSING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.20521
20618	12576	44-53-0370(C)	73313 /2024A0710300366	POSS OF NARC IN SCHEDULE I(B),(C), LSD & SCHEDULE II	0.00	General Sessions Court	2024-11-07 22:00:05.205714
20619	12576	44-53-0370/D2a	73314 / 2024A0710300367	POSS. OF OTHER CONTROLLED SUB. IN SCHED. I  TO V	0.00	General Sessions Court	2024-11-07 22:00:05.206333
20620	12577	ISH		In-State Hold	0.00		2024-11-07 22:00:05.208369
20621	12578	56-25-0040(B)	20242351296447	FAILURE TO APPEAR AS REQUIRED BY UNIFORM TRAFFIC CITATION	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.210326
20622	12578	56-01-0460(A)(2)(A)	20242351296446	DRIVING UNDER SUSPENSION; LICENSE SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.210831
20623	12579	Family Court Bench Warrnt	2023DR0701014	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:05.2121
20624	12580	General Sessions Commtmnt	2020GS0702103	General Sessions Commitment	0.00	General Sessions Court	2024-11-07 22:00:05.213706
20625	12581	56-05-2930(A)	20242351323320	DRIVING UNDER THE INFLUENCE (DUI)	0.00	General Sessions Court	2024-11-07 22:00:05.215434
20626	12582	16-13-0110(A)	20240180122052	SHOPLIFTING	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.216984
20627	12583	16-11-0610	20240190200026	TRESPASSING	0.00		2024-11-07 22:00:05.218819
20628	12584	16-17-0725(A)	20242170015363	GIVING FALSE INFO TO LEO, FIRE OR RESCUE DEPT.	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.220395
20629	12585	56-01-0460(A)(1)(A)	20242351269958	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.222111
20630	12586	56-05-2930(A)	20242351280608	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.223409
20631	12586	56-01-0020	20242351280607	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.223964
20632	12587	61-04-0110	20240190218781	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.226101
20633	12587	56-05-2930(A)	20240190218782	DRIVING UNDER THE INFLUENCE (DUI)	0.00	General Sessions Court	2024-11-07 22:00:05.226706
20634	12588	ISH	2023DR2700246P001	In-State Hold	0.00	14th Circuit Family Court	2024-11-07 22:00:05.228562
20635	12589	Magistrate Bench Warrant	20210190162284	Magistrate Bench Warrant	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.229933
20636	12590	44-53-370	20240190183589	Marij: Simple Possession	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.231551
20637	12591	16-13-0010(A)	2024A0720200099/05851	FORGERY; VALUE OF $10,000 OR MORE & OR VALUE OF $10,000 OR LESS	0.00	General Sessions Court	2024-11-07 22:00:05.233049
20638	12591	ISH	2024A2710200264	In-State Hold	0.00		2024-11-07 22:00:05.233543
20639	12592	16-03-0600(E)(1)	7102P0571755	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.235462
20640	12593	56-01-0460(A)(1)(A)	20240270094376	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.237079
20641	12593	44-53-370	20240270094377	Marij: Simple Possession	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.23756
20642	12594	16-13-0110(A)	2024A0710300311	SHOPLIFTING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.239645
20643	12594	ISH		In-State Hold	0.00		2024-11-07 22:00:05.240078
20644	12595	56-05-2920	20240190202232	RECKLESS DRIVING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.242074
20645	12596	14-25-0045	00000	CONTEMPT OF MUNICIPAL COURT	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.24415
20646	12597	56-01-0460(A)(1)(A)	20240270093171	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.245681
20647	12598	16-03-0600(E)(1)	20240180118579	ASSAULT & BATTERY 3RD DEGREE	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.247256
20648	12598	9-1005	2024018011857	Trespassing	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.247887
20649	12599	16-17-0530	20240190203044	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.24953
20650	12600	7-7001	20240180122708	Appearing Drunk on Streets	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.250938
20651	12601	16-17-0530	4102P0067573	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.252499
20652	12602	56-05-2930(A)	6012P0051741	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.254166
20653	12603	16-13-0110(A)	2024A0710300226	SHOPLIFTING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.255633
20654	12604	16-03-0600(E)(1)	2024a0710300321	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.257184
20655	12605	56-05-2930(A)	20240190220905	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.259312
20656	12605	44-53-0370	20240190222470	Simple Possession	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.259875
20657	12606	56-05-2930(A)	20242170015481	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.261599
20658	12606	56-01-0460(A)(2)(A)	20242170014682	DRIVING UNDER SUSPENSION; LICENSE SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.262121
20659	12607	16-17-0530	20240190220102	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.263661
20660	12608	56-05-0750(B)(1)	20242351290478	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.265279
20661	12608	56-01-0020	20242351290477	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.265826
20662	12609	56-05-2930(A)	20240190214373	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.267135
20663	12610	Family Court Bench Warrnt	2016DR0700684P-001	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:05.268463
20664	12611	7-7001	20240180126614	Appearing Drunk on Streets	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.270302
20665	12612	16-13-0030(B)	2024A0710300342	GRAND LARCENY; VALUE MORE THAN $2,000 BUT LESS THAN $10,000 & OR VALUE MORE THAN $10,000	10000.00	General Sessions Court	2024-11-07 22:00:05.271579
20666	12613	56-05-2930(A)	20242351232643	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.273039
20667	12614	56-01-0460(A)(1)(A)	20240190214834	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.274618
20668	12615	44-53-0370	20240190221306	Simple Possession	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.276936
20669	12615	56-01-0460(A)(1)(A)	20240190221307	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.27739
20670	12616	56-05-2930(A)	8102P0795505	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.278951
20671	12617	16-03-0600(E)(1)	2024A0710200330/75738	ASSAULT & BATTERY 3RD DEGREE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.280692
20672	12617	16-03-0600(E)(1)	2024A0710200331	ASSAULT & BATTERY 3RD DEGREE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.281122
20673	12617	General Sessns Bench Warr	2021A0710200214	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:05.281576
20674	12618	56-05-2930(A)	20240190231021	DRIVING UNDER THE INFLUENCE (DUI)	0.00		2024-11-07 22:00:05.283236
20675	12620	56-01-0460(A)(2)(A)	20242351288792	DRIVING UNDER SUSPENSION; LICENSE SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.285816
20676	12620	ICE		ICE Hold	0.00		2024-11-07 22:00:05.286357
20677	12621	16-03-0600(D)(1)	2024A0710200490	ASSAULT & BATTERY 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.288029
20678	12621	16-03-0600(D)(1)	2024A0710200489	ASSAULT & BATTERY 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.288426
20679	12621	16-11-0520(A)	20240190195275	MALICIOUS INJURY TO TREE, HOUSE; TRESPASS UPON REAL PROPERTY	0.00		2024-11-07 22:00:05.288817
20680	12622	16-23-0440(B)		DISCHARGING FIREARM INTO VEHICLE; AIRCRAFT; ETC. WHILE OCCUPIED	0.00		2024-11-07 22:00:05.290458
20681	12622	16-23-0030		SALE OR DELIVERY OF FIREARM TO AND POSSESSION BY; CERTAIN PERSONS UNLAWFUL; STOLEN FIREARM	0.00		2024-11-07 22:00:05.290982
20682	12623	56-01-0460(A)(1)(B)	20242351311279	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 2ND OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.292993
20683	12624	56-05-2930(A)	20242170015376	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.294851
20684	12624	61-06-4020	20242170015377	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.295463
20685	12625	16-09-0320(A)	20242170015835	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.29716
20686	12625	16-17-0530	20242170015834	PUBLIC DISORDERLY CONDUCT	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.297573
20687	12626	Probation and Parole Viol	W-07-247-0039	Probation and Parole Violation	0.00	General Sessions Court	2024-11-07 22:00:05.298857
20688	12627	44-53-0375 (B) (1)	2024A0710200539	DISTRIBUTION ETC. METHAMPHETAMINE 1ST EXCLUDES MANUFACTURING METH SEE CDR CODE 3776	0.00	General Sessions Court	2024-11-07 22:00:05.300562
20689	12627	44-53-0370(D)(4)	2024A0710200540	DRUGS/FENTANYL, POSSESSION OF MORE THAN 2 GRAINS	0.00	General Sessions Court	2024-11-07 22:00:05.301113
20690	12627	44-53-0370/d4c	77188 / 2024A0710200542	Marij:Poss28g(1oz)<10g-2nd-sub	0.00	General Sessions Court	2024-11-07 22:00:05.30156
20691	12627	24-07-0155	77187 / 2024A0710200541	CONTRABAND; FURNISH. OR POSS.; COUNTY OR MUNICIPAL PRISONS PROHIBITED	0.00	General Sessions Court	2024-11-07 22:00:05.301959
20692	12628	General Sessions Commtmnt		General Sessions Commitment	0.00	General Sessions Court	2024-11-07 22:00:05.303735
20693	12629	56-05-2930(A)	20240190223526	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.305184
20694	12630	16-17-0430(A)	2024A0710400238	UNLAWFUL COMMUNICATION (AFTER 07/20/01)	0.00		2024-11-07 22:00:05.306853
20695	12630	16-03-1700(B)	2024A0710400239	2ND DEGREE HARASSMENT	0.00		2024-11-07 22:00:05.307388
20696	12632	Motion to Relieved Bond		Bond Revocation	0.00		2024-11-07 22:00:05.31057
20697	12632	Motion to Relieved Bond	20230190160053,2300160310	Bond Revocation	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.311059
20698	12632	44-53-0375(A)	77182/2024A0710200500	POSSESSION OF LESS THAN 1G OF METH OR COCAINE BASE	0.00	General Sessions Court	2024-11-07 22:00:05.311484
20699	12633	16-13-0110(A)	20240190214368	SHOPLIFTING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.312877
20700	12634	Public Drunk	8102P0795509	Public Drunk	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.314465
20701	12635	44-53-0370(B)(2)	2024A0720200145	MANUF.; POSS. OF OTHER SUB. IN SCH. I; II; III OR FLUNITRAZEPAM OR ANALOGUE; W.I.T.D.	0.00	General Sessions Court	2024-11-07 22:00:05.31607
20702	12635	44-53-0370(B)(2)	2024A0720200144	MANUF.; POSS. OF OTHER SUB. IN SCH. I; II; III OR FLUNITRAZEPAM OR ANALOGUE; W.I.T.D.	0.00	General Sessions Court	2024-11-07 22:00:05.316479
20703	12635	16-09-0320(A)	2024a0720200144	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00	General Sessions Court	2024-11-07 22:00:05.316948
20704	12636	44-53-0370(D)(5)	76377	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00	General Sessions Court	2024-11-07 22:00:05.318521
20705	12637	16-03-0600(E)(1)	20240190218794	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.319897
20706	12638	16-25-0020(D)	20240190218941	DOMESTIC VIOLENCE 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.32189
20707	12638	44-53-0370(D)(5)	20240190218942	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.322389
20708	12639	56-05-2930(A)	20242351271927	DRIVING UNDER THE INFLUENCE (DUI)	0.00	General Sessions Court	2024-11-07 22:00:05.323918
20709	12639	56-01-0460(A)(1)(C)	20242351271928	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:05.324432
20710	12640	44-53-0370	20240190223850	Simple Possession	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.326589
20711	12640	16-17-0725 (B)	20240190223850	GIVING FALSE INFO TO LEO, FIRE, OR RESCUE DEPT. - TRAFFIC	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.327038
20712	12640	56-01-0460(A)(1)(A)	20240190223850	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.327541
20713	12641	16-13-0420(A)	2024A0710400264	FAILURE TO RETURN RENTED OBJECTS; FRAUD APPROPRIATION	0.00	General Sessions Court	2024-11-07 22:00:05.328972
20714	12642	16-03-0010	2024A0710400227	MURDER	0.00	General Sessions Court	2024-11-07 22:00:05.330558
20715	12642	16-23-0490	2024A0710400228	POSS. WEAPON DURING VIOLENT CRIME; IF NOT ALSO SENTENCED TO LIFE WITHOUT PAROLE OR DEATH	0.00	General Sessions Court	2024-11-07 22:00:05.331074
20716	12642	00-00-0000	2024A0710400229	Breach/ Breach of Peace, Aggravated in Nature	0.00	General Sessions Court	2024-11-07 22:00:05.331598
20717	12643	ISH		In-State Hold	0.00		2024-11-07 22:00:05.333293
20718	12644	16-13-0110(A)	77269/2024A0710300267	SHOPLIFTING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.335602
20719	12644	54-3	20240190214359	FLEEING TO EVADE/ARREST	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.336097
20720	12644	44-53-0375(A)	77268/22024A710200521	POSSESSION OF LESS THAN 1G OF METH OR COCAINE BASE	0.00	General Sessions Court	2024-11-07 22:00:05.336625
20721	12645	16-11-0640	20240190223415	UNLAWFUL ENTRY INTO ENCLOSED PLACES	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.33859
20722	12646	16-11-0020	64120 / 2024A0710200505	POSSESSION; MAKING IMPLEMENTS CAPABLE OF BEING USED IN CRIME	0.00	General Sessions Court	2024-11-07 22:00:05.340097
20723	12646	16-13-0110(A) Enhancement	77109 / 2024A0710200506	SHOPLIFTING/VALUE 2000 OR LESS ENHANCEMENT PER 16-01-0057	0.00	General Sessions Court	2024-11-07 22:00:05.340605
20724	12647	56-05-2930(A)	20242351245081	DRIVING UNDER THE INFLUENCE (DUI)	0.00		2024-11-07 22:00:05.342792
20725	12647	56-05-1220	20242351245082	HIT AND RUN; ATT. VEHICLE; DUTIES OF DRIVER INVOLVED IN ACCIDENT; PROPERTY DAMAGE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.343265
20726	12648	16-13-0110(A)	2024A0710300340	SHOPLIFTING	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.344797
20727	12649	7-7001	20240180124515	Appearing Drunk on Streets	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.346235
20728	12650	44-53-370	20240190221309	Marij: Simple Possession	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.347874
20729	12651	16-13-0110(A)	2024A0720600301	SHOPLIFTING	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.349406
20730	12652	ISH		In-State Hold	0.00	General Sessions Court	2024-11-07 22:00:05.351141
20731	12653	ISH		In-State Hold	0.00		2024-11-07 22:00:05.35281
20732	12654	16-25-0020(C)	2024019026653	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.354394
20733	12654	16-11-0510(A)	20240190206652	MALICIOUS INJURY TO ANIMALS; PERSONAL PROPERTY	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.354978
20734	12655	16-13-0110(A) Enhancement	2024A0720400150	SHOPLIFTING/VALUE 2000 OR LESS ENHANCEMENT PER 16-01-0057	0.00	General Sessions Court	2024-11-07 22:00:05.356496
20735	12655	00-00-0000L	20242170014695	VIOLATION OF CITY ORDINANCE (USE STATE CODE IF POSSIBLE)	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.356986
20736	12655	16-14-0060	2024A0720400120	FINANCIAL TRANSACTION FRAUD	0.00	General Sessions Court	2024-11-07 22:00:05.357392
20737	12655	16-14-0060	2024A0720400121	FINANCIAL TRANSACTION FRAUD	0.00	General Sessions Court	2024-11-07 22:00:05.357802
20738	12656	16-03-0654	2024A0720600322	CRIMINAL SEXUAL CONDUCT - THIRD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.360038
20739	12657	44-53-0370(D)(3)	77267/2024A0710200513	POSSESSION OF COCAINE, POSSESSION OF 15 DOSAGE UNITS OF MDMA OR ECSTASY	0.00	General Sessions Court	2024-11-07 22:00:05.361586
20740	12657	44-53-0375(B)(1)	77266/2024A0710200514	MANUFACTURE, DISTRIBUTION ETC. OF COCAINE BASE 1ST	0.00	General Sessions Court	2024-11-07 22:00:05.362039
20741	12658	7-7001	20240180122055	Appearing Drunk on Streets	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.363395
20742	12659	56-05-2930(A)	20240190222908	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.364742
20743	12660	56-01-0460(A)(1)(A)	20242170015753	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.366463
20744	12660	44-53-0370	20242170015558	Simple Possession	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.366978
20745	12660	61-06-4020	20242170015559	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.367397
20746	12660	00-00-0000b	20242170015560	FleeingtoEvade	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.367809
20747	12661	16-13-0110(A)	2024A0720600171/17603	SHOPLIFTING	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.369518
20748	12661	9-1005	2024A0720600170/17605	Trespassing	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.370094
20749	12662	Family Court Bench Warrnt	2009DR0700759	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:05.371583
20750	12663	16-11-0312(B)	01802/2024A0720400141	BURGLARY (VIOLENT) - SECOND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.373012
20751	12664	16-25-0020(C)	2024A0710300327	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.374476
20752	12665	56-05-0950	202423551264518	FAILURE TO OBEY TRAFFIC-CONTROL DEVICES	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.376465
20753	12665	56-01-0020	20242351264516	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.37688
20754	12665	61-04-0110	20242351264517	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.377277
20755	12665	56-05-2930(A)	20242351264519	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.377644
20756	12666	56-05-2930(A)	20240190227354	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.378983
20757	12667	ISH		In-State Hold	0.00		2024-11-07 22:00:05.38053
20758	12668	16-03-0600(E)(1)	20240190195277	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.382037
20759	12669	16-01-0055	2024A0720600272	ACCESSORY AFTER THE FACT TO AN EXEMPT FELONY OR FELONY A-F OR MURDER	100000.00	General Sessions Court	2024-11-07 22:00:05.383554
20760	12670	ISH		In-State Hold	0.00		2024-11-07 22:00:05.385418
20761	12671	16-17-0530	20240190182165	PUBLIC DISORDERLY CONDUCT	0.00		2024-11-07 22:00:05.386983
20762	12672	16-03-0600(E)(1)	20240190209599	ASSAULT & BATTERY 3RD DEGREE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.38824
20763	12673	16-03-0600(E)(1)	2024A0720200137	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.390396
20764	12673	16-03-0600(D)(1)	2024A0720200136	ASSAULT & BATTERY 2ND DEGREE	10000.00	General Sessions Court	2024-11-07 22:00:05.390964
20765	12673	ICE		ICE Hold	0.00		2024-11-07 22:00:05.391651
20766	12674	16-25-0020(D)	20240180118569	DOMESTIC VIOLENCE 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.393662
20767	12675	ISH		In-State Hold	0.00		2024-11-07 22:00:05.395636
20768	12676	16-25-65	67576 / 2024A0710200590	DVHAN	10000.00	General Sessions Court	2024-11-07 22:00:05.397418
20769	12677	44-53-0375/C1a	77183	Meth:Traff10gormore<28g1st	0.00	General Sessions Court	2024-11-07 22:00:05.399204
20770	12677	44-53-0370(D)(5)	20240190223779	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00		2024-11-07 22:00:05.39973
20771	12678	44-53-370	20240190222271	Marij: Simple Possession	0.00		2024-11-07 22:00:05.401606
20772	12679	44-53-0370(D)(2)	2024A0710400214	POSS OF OTHER CONTROLLED SUB IN SCHED I TO V	10000.00	General Sessions Court	2024-11-07 22:00:05.404117
20773	12679	44-53-0370(D)(4)	2024A0710400215	DRUGS/FENTANYL, POSSESSION OF MORE THAN 2 GRAINS	10000.00	General Sessions Court	2024-11-07 22:00:05.404819
20774	12679	44-53-0375(A)	2024A0710400216	POSSESSION OF LESS THAN 1G OF METH OR COCAINE BASE	10000.00	General Sessions Court	2024-11-07 22:00:05.405369
20775	12679	General Sessns Bench Warr	2024a0710200360	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:05.405847
20776	12679	General Sessns Bench Warr	2024a072060053	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:05.406527
20777	12679	General Sessns Bench Warr	2024A0720600054	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:05.407217
20778	12679	General Sessns Bench Warr	2024A0710200362	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:05.407746
20779	12679	General Sessns Bench Warr	2021A0720400102	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:05.40845
20780	12679	16-09-0320(A)	77193/2024A0710200613	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	10000.00	General Sessions Court	2024-11-07 22:00:05.409085
20781	12680	16-11-0620	20240190208483	ENTERING PREMISES AFTER WARNING OR REFUSING TO LEAVE ON REQUEST	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.410896
20782	12680	16-17-0530	20240190208935	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.41143
20783	12681	16-11-0610	2024A0710300268	TRESPASSING	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.413485
20784	12681	Magistrate Bench Warrant	2024019021071	Magistrate Bench Warrant	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.414104
20785	12682	16-13-0180(B4)	20240180116163	RSG/RECEIVING GOODS; REPRESENTED AS STOLEN; VALUE $2,000 OR LESS	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.416159
20786	12683	ISH		In-State Hold	0.00		2024-11-07 22:00:05.41896
20787	12684	44-53-0370 (D) (5)	20240180122593	Marij/Poss 28g<10gr<Hash 1st	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.420995
20788	12684	16-23-0230	16841 / 2024A0720600361	UNLAW. STORE, KEEP, POSS. MACHINE GUN OR SAWED-OFF SHOTGUN OR RIFLE	0.00	General Sessions Court	2024-11-07 22:00:05.421502
20789	12685	56-01-0460(A)(1)(A)		DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00		2024-11-07 22:00:05.423546
20790	12686	56-01-0460(A)(1)(A)	20240190202732	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.425731
20791	12686	44-53-0370(D)(5)	20240190203041	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.42633
20792	12687	56-05-2930(A)	20242351302580	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.427948
20793	12688	56-05-2920	20240270099379	RECKLESS DRIVING	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.429824
20794	12688	56-05-2740	20240270099378	DISREGARDING STOP SIGN	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.43029
20795	12688	56-05-1520(G)(4)	20240270099380	SPEEDING 25MPH OVER THE SPEED LIMIT	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.430765
20796	12689	44-53-0370(D)(5)		POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00		2024-11-07 22:00:05.43236
20797	12689	16-17-0500(F)(1)		ATT TO PURCHASE OR ATT TO POSS OR POSS OF TABACCO PRODUCT BY A MINOR (NON-CRIMINAL)	0.00		2024-11-07 22:00:05.432845
20798	12689	16-03-0600(E)(1)		ASSAULT & BATTERY 3RD DEGREE	0.00		2024-11-07 22:00:05.433539
20799	12690	44-53-0375/Aa	75466/2024A0710200593	CrackCocaine:Poss1st	5000.00	General Sessions Court	2024-11-07 22:00:05.435745
20800	12690	56-01-0460(A)(1)(A)	20240190213616	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.436304
20801	12690	61-04-0110	20240190213617	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.436802
20802	12690	ICE		ICE Hold	0.00		2024-11-07 22:00:05.437447
20803	12691	56-05-950b	4102p0330341	DisregardingTrafficSignal	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.440755
20804	12691	56-01-0020	4102p0330340	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.441403
20805	12692	56-01-0020	4102P0330340	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.443472
20806	12692	56-05-1520(G)(1)	4102P0330339	SPEEDING: 10 MPH OR LESS OVER THE SPEED LIMIT	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.443936
20807	12692	56-05-0950	4102P0330341	FAILURE TO OBEY TRAFFIC-CONTROL DEVICES	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.444363
20808	12693	44-53-0370		Simple Possession	0.00		2024-11-07 22:00:05.445776
20809	12694	16-14-0060(A)(1-5)	2024A0710300352	FINANCIAL TRANSACTION CARD FRAUD IN 6 MONTH PERIOD	0.00	General Sessions Court	2024-11-07 22:00:05.447479
20810	12694	16-14-0020	2024A0710300345	FINANCIAL TRANSACTION CARD THEFT	0.00	General Sessions Court	2024-11-07 22:00:05.448052
20811	12694	16-14-0060	2024A0710300344	FINANCIAL TRANSACTION FRAUD	0.00	General Sessions Court	2024-11-07 22:00:05.448483
20812	12694	16-14-0060(A)(1-5)	2024A0710300353	FINANCIAL TRANSACTION CARD FRAUD IN 6 MONTH PERIOD	0.00	General Sessions Court	2024-11-07 22:00:05.44891
20813	12695	Probation and Parole Viol	W-07-24-0045	Probation and Parole Violation	0.00	General Sessions Court	2024-11-07 22:00:05.450675
20814	12696	16-13-0230(A)	2024A0720200159	BREACH OF TRUST WITH FRAUDULENT INTENT	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.452153
20815	12696	16-14-0060	2024a0720200160	FINANCIAL TRANSACTION FRAUD	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.452784
20816	12697	56-01-0460(A)(1)(A)	20242351285406	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.454834
20817	12698	Family Court Bench Warrnt	2022DR0700710	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:05.456669
20818	12698	Family Court Bench Warrnt	2023DR070039	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:05.457254
20819	12699	56-01-0460(A)(1)(A)	202402700971171	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.459475
20820	12699	56-10-0240(D)(1)	20240270097177	FAILURE TO RETURN LICENSE PLATE AND REGISTRATION UPON LOSS OF INSURANCE 1ST	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.460012
20821	12700	16-25-0020(D)	20240190227540	DOMESTIC VIOLENCE 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.461721
20822	12701	56-01-0020	20242351275138	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.463109
20823	12701	56-05-2930(A)	202423551275139	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.463514
20824	12701	ICE		ICE Hold	0.00		2024-11-07 22:00:05.463993
20825	12702	56-05-2930(A)	20242351308797	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.465562
20826	12703	16-13-0030(A)	2023A0710300309	PETIT OR SIMPLE LARCENY -$2,000 OR LESS	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.467357
20827	12703	ISH	2023a2710200144	In-State Hold	0.00		2024-11-07 22:00:05.467845
20828	12704	16-03-0600(E)(1)	20240190212998	ASSAULT & BATTERY 3RD DEGREE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.469207
20829	12705	23-31-0400(C)	75285	USE OF FIREARM WHILE UNDER INFLUENCE OF ALCOHOL OR DRUGS	0.00	General Sessions Court	2024-11-07 22:00:05.470815
20830	12705	16-23-0440(A)	75284	DISCHARGING FIREARMS INTO A DWELLING	0.00	General Sessions Court	2024-11-07 22:00:05.471436
20831	12706	56-05-2930(A)	20242351308682	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.473029
20832	12707	56-05-2930(A)	20242351288795	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.474498
20833	12708	16-21-0080c	76428/2024A0710200535	POSS., CONCEAL, SELL., OR DISPOSE OF STOLEN VEHICLE; VALUE MORE THAN $2;000 BUT LESS THAN $10;000	0.00	General Sessions Court	2024-11-07 22:00:05.476549
20834	12709	56-10-0240(D)(1)	2024019019311	FAILURE TO RETURN LICENSE PLATE AND REGISTRATION UPON LOSS OF INSURANCE 1ST	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.478159
20835	12709	56-01-0460(A)(1)(A)	202401190193913	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.478807
20836	12709	56-10-0520	20240190193912	UNINSURED MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.479322
20837	12710	56-05-2930(A)	20240270093064	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.480801
20838	12711	56-05-2930(A)	20242351296450	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.482525
20839	12711	56-01-0020	20242351296451	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.483077
20840	12712	61-04-0110	20240190213871	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.484524
20841	12712	44-53-0370	20240190213876	Simple Possession	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.485033
20842	12712	44-53-0370(D)(3)	77265	POSSESSION OF COCAINE, POSSESSION OF 15 DOSAGE UNITS OF MDMA OR ECSTASY	0.00	General Sessions Court	2024-11-07 22:00:05.485448
20843	12713	44-53-0375(A)	49676/2024A0710200599	POSSESSION OF LESS THAN 1G OF METH OR COCAINE BASE	0.00	General Sessions Court	2024-11-07 22:00:05.487008
20844	12713	24-03-0950	77130/2024A0710200598	CONTRABAND; POSSESSION BY PRISONER; FURNISHING OR ATTEMPT TO FURNISH PRISONER WITH	0.00	General Sessions Court	2024-11-07 22:00:05.4875
20845	12714	16-03-0600(E)(1)	20240190219307	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.489102
20846	12715	44-53-0370(D)(5)	20240190223953	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.490497
20847	12716	44-53-0370(D)(5)	20240190228488	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.492914
20848	12716	63-19-2440	20240190228489	ABC(B/W):PURCHASE, COMSUMPTION OR POSSESSION OF BEER OR WINE BY MINOR	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.493375
20849	12717	56-05-2930(A)	20240190218791	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.494752
20850	12718	16-17-0530	20240190220295	PUBLIC DISORDERLY CONDUCT	0.00		2024-11-07 22:00:05.496261
20851	12719	56-05-2930(A)	20240190218796	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.497768
20852	12719	61-04-0110	20240190218797	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.498254
20853	12719	ICE		ICE Hold	0.00		2024-11-07 22:00:05.498683
20854	12720	16-03-0600(E)(1)	74216/2024A0710300175	ASSAULT & BATTERY 3RD DEGREE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.50032
20855	12720	Magistrate Bench Warrant	20220190127216	Magistrate Bench Warrant	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.500809
20856	12720	General Sessns Bench Warr	20210190149544	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:05.501375
20857	12720	16-25-0020(D)	2024A0710300304	DOMESTIC VIOLENCE 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.501862
20858	12720	Motion to Relieved Bond	20210190149544	Bond Revocation	0.00	General Sessions Court	2024-11-07 22:00:05.502417
20859	12721	16-25-0020(D)	2024A0710300304	DOMESTIC VIOLENCE 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.503943
20860	12722	16-25-0020(C)	20240190098057	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.505869
20861	12722	16-03-0600(E)(1)	20240190098056	ASSAULT & BATTERY 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.506408
20862	12723	56-05-2930(A)	20240190201381	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.508201
20863	12723	56-01-0020	20240190201371	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.508943
20864	12723	61-04-0110	20240190201369	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.509461
20865	12724	17-7-111	20240190221305	Loitering (HH Town Ord)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.51079
20866	12725	44-53-0375/Aa	77234/2024A0710200496	CrackCocaine:Poss1st	0.00	General Sessions Court	2024-11-07 22:00:05.512288
20867	12726	61-04-0110	20240190228486	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.51397
20868	12727	56-01-0460(A)(1)(A)		DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00		2024-11-07 22:00:05.51588
20869	12728	56-01-0460(A)(1)(A)	20240270091351	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.517513
20870	12728	56-03-1360	20240270091372	IMPROPER VEHICLE LICENSE (REGISTERED TO ANOTHER VEHICLE)	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.518139
20871	12729	16-17-0530	20240190223080	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.520051
20872	12730	56-01-0460(A)(1)(A)	20240190220019	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.521601
20873	12731	61-04-0110	20242351255994	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.523959
20874	12731	56-05-2930(A)	20242351255993	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.524898
20875	12732	56-10-0520	20242351245073	UNINSURED MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.52692
20876	12732	56-01-0460(A)(2)(A)	20242351245072	DRIVING UNDER SUSPENSION; LICENSE SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.527457
20877	12733	56-05-2930(A)	20240190223525	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.529185
20878	12734	9-1005	20240180126611	Trespassing	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.530605
20879	12734	7-7001	20240180126612	Appearing Drunk on Streets	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.531024
20880	12735	16-13-0030(A)	2022A0710200537	PETIT OR SIMPLE LARCENY -$2,000 OR LESS	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.532476
20881	12736	16-13-0230(A)	2024A0710300315	BREACH OF TRUST WITH FRAUDULENT INTENT	0.00	General Sessions Court	2024-11-07 22:00:05.534384
20882	12737	44-53-0370(D)(5)		POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00		2024-11-07 22:00:05.536058
20883	12738	44-53-370	20240190221319	Marij: Simple Possession	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.537551
20884	12739	44-53-0370/D3c	77112/2024A0710200532	Cocaine:Possession3rd	0.00	General Sessions Court	2024-11-07 22:00:05.539334
20885	12739	44-53-0370/d4c	77113/2024A0710200533	Marij:Poss28g(1oz)<10g-2nd-sub	0.00	General Sessions Court	2024-11-07 22:00:05.539862
20886	12740	ISH		In-State Hold	0.00		2024-11-07 22:00:05.541125
20887	12741	56-01-0020	20240190220023	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.543055
20888	12741	56-05-2930(A)	2024019022911	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.543632
20889	12742	44-53-0370 (D) (5)	20242351296456	Marij/Poss 28g<10gr<Hash 1st	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.545246
20890	12742	44-53-0375/Ad	2024A0710200595	Meth:Poss<1gram1stoffense	0.00	General Sessions Court	2024-11-07 22:00:05.545741
20891	12742	16-23-0230	2024A0710200596	UNLAW. STORE, KEEP, POSS. MACHINE GUN OR SAWED-OFF SHOTGUN OR RIFLE	0.00	General Sessions Court	2024-11-07 22:00:05.54634
20892	12743	56-05-2930(A)	20242170015907	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.547791
20893	12744	16-25-0020(C)	2024A0710300310	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.549439
20894	12745	16-11-0313	2024A0710400198/76989	BURGLARY - THIRD DEGREE- 1ST OR 2ND OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:05.551196
20895	12745	16-13-0240	2024A0710400200/76991	OBTAIN SIGNATURE OF PROP. UNDER FALSE PRETENSES	0.00	General Sessions Court	2024-11-07 22:00:05.551727
20896	12745	16-13-0240	2024A0710400199/76990	OBTAIN SIGNATURE OF PROP. UNDER FALSE PRETENSES	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.552256
20897	12746	16-03-0600(E)(1)	20242170026059	ASSAULT & BATTERY 3RD DEGREE	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.554003
20898	12746	16-09-0320(A)	20242170016060	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.554453
20899	12747	56-01-0020		DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00		2024-11-07 22:00:05.55603
20900	12748	56-05-2930(A)	20240190220033	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.557687
20901	12749	16-17-0530	20240190227543	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.560002
20902	12750	16-17-0640	2024A0710300161	BLACKMAIL OR EXTORTION	0.00	General Sessions Court	2024-11-07 22:00:05.561391
20903	12751	9-1005	20240180118577	Trespassing	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.562908
20904	12752	44-53-0370/b1e	77243/2024A0710200638	Marij:PWITD/S&D 1stoffense	0.00	General Sessions Court	2024-11-07 22:00:05.564706
20905	12753	56-01-0460(A)(1)(B)	20242351259966	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 2ND OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.566289
20906	12754	44-53-370	20240190207305	Marij: Simple Possession	0.00		2024-11-07 22:00:05.56787
20907	12754	56-10-0225	20240190207306	FAILURE TO MAINTAIN PROOF OF INSURANCE IN MOTOR VEHICLE	0.00		2024-11-07 22:00:05.568273
20908	12755	16-25-0020(D)	20240190224180	DOMESTIC VIOLENCE 3RD DEGREE	0.00		2024-11-07 22:00:05.570025
20909	12756	Family Court Commitment	2018DR0700214	Family Court Commitment	0.00	14th Circuit Family Court	2024-11-07 22:00:05.571539
20910	12757	00-00-0000L	20242170015729	VIOLATION OF CITY ORDINANCE (USE STATE CODE IF POSSIBLE)	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.573039
20911	12757	61-04-0110	202421700157332	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.57351
20912	12757	56-01-0460(A)(2)(C)	20242170015731	DRIVING UNDER SUSPENSION; LICENSE SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.574003
20913	12757	56-05-2930(A)	2024170015730	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.574557
20914	12757	Magistrate Commitment	20230190135637	Magistrate Commitment	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.575438
20915	12758	56-01-0460(A)(1)(C)	20243070079573	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00		2024-11-07 22:00:05.577069
20916	12758	56-03-0110	20243070079574	PERMITTING OR OPERATING VEHICLE WHICH IS NOT REGISTERED AND LICENSED	0.00		2024-11-07 22:00:05.577593
20917	12758	56-05-1520(G)(3)	20243070079572	SPEEDING 15MPH-24MPH OVER THE SPEED LIMIT	0.00		2024-11-07 22:00:05.578034
20918	12758	56-10-0520	20243070079575	UNINSURED MOTOR VEHICLE	0.00		2024-11-07 22:00:05.578495
20919	12759	2-1005	20240180117386	Fleeing to Evade Arrest or Detention	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.580042
20920	12759	16-11-0520(A)	20240180117384	MALICIOUS INJURY TO TREE, HOUSE; TRESPASS UPON REAL PROPERTY	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.580583
20921	12759	16-09-0320(A)	16150/2024A0720600286	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00	General Sessions Court	2024-11-07 22:00:05.581054
20922	12759	16-11-0510(A)	18101/20240180117385	MALICIOUS INJURY TO ANIMALS; PERSONAL PROPERTY	0.00	General Sessions Court	2024-11-07 22:00:05.581623
20923	12760	16-23-0230	77194/2024A0710200624	UNLAW. STORE, KEEP, POSS. MACHINE GUN OR SAWED-OFF SHOTGUN OR RIFLE	0.00		2024-11-07 22:00:05.583107
20924	12760	56-05-0750(B)(1)	20240190223787	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 1ST OFFENSE	0.00		2024-11-07 22:00:05.583534
20925	12760	44-53-0370(D)(5)	20240190223789	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00		2024-11-07 22:00:05.584025
20926	12760	56-01-0460(A)(1)(A)	20240190223788	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00		2024-11-07 22:00:05.584622
20927	12761	16-13-0110(A)	20240180103928	SHOPLIFTING	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.58662
20928	12762	56-05-2930(A)	20242351287870	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.588296
20929	12762	61-04-0110	20242351287871	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.588838
20930	12762	44-53-370	20242351287872	Marij: Simple Possession	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.589387
20931	12762	61-06-4020	20242351287873	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.589977
20932	12763	56-01-0020	20240190180215	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00		2024-11-07 22:00:05.591626
20933	12764	56-05-2930(A)	20240190178336	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.593334
20934	12764	56-01-0020	20240190180215	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.593746
20935	12765	ISH		In-State Hold	0.00		2024-11-07 22:00:05.595343
20936	12766	16-25-0020(C)	20242170015598	DOMESTIC VIOLENCE 2ND DEGREE	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.596745
20937	12767	56-01-0510	20242351268594	UNLAWFUL USE OF LICENSE OR FRAUDULENT APPLICATION FOR LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.598083
20938	12767	56-03-0840	20242351268595	OPERATING VEHICLE WHILE LICENSE/REGISTRATION EXPIRED	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.598548
20939	12767	61-04-0110	20242351272918	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.598934
20940	12767	56-05-2930(A)	20242351269961	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.599462
20941	12767	63-19-2440	20242351272919	ABC(B/W):PURCHASE, COMSUMPTION OR POSSESSION OF BEER OR WINE BY MINOR	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.600082
20942	12768	61-06-4020	20240190228481	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.601569
20943	12768	56-01-0460(A)(1)(B)	20240190228482	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 2ND OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.602042
20944	12769	56-05-2930(A)	20240190202708	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.603259
20945	12770	7-7001	8102P0795558	Appearing Drunk on Streets	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.604801
20946	12771	56-05-2930(A)	20242170015564	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.606115
20947	12772	Probation and Parole Viol	SEE ADDITIONAL INFO	Probation and Parole Violation	100000.00	General Sessions Court	2024-11-07 22:00:05.607383
20948	12773	44-53-0375(A)	77192/2024A0710200606	POSSESSION OF LESS THAN 1G OF METH OR COCAINE BASE	0.00	General Sessions Court	2024-11-07 22:00:05.609606
20949	12774	56-05-1900	20242351275703	TRAFFIC/ DRVING ON THE WRONG SIDE OF ROAD, IMPROPER LANE OR UNSAFELY SHIFTING LANES	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.611098
20950	12774	56-01-0020	20242351275702	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.611655
20951	12774	56-05-2930(A)	2024235127504	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.612058
20952	12775	16-11-0620	20240190183618	ENTERING PREMISES AFTER WARNING OR REFUSING TO LEAVE ON REQUEST	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.613264
20953	12776	56-05-2930(A)	20240190223743	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.614745
20954	12777	General Sessions Commtmnt	2023A0710300271	General Sessions Commitment	0.00	General Sessions Court	2024-11-07 22:00:05.616197
20955	12778	16-11-0510(A)	2024A0710300281	MALICIOUS INJURY TO ANIMALS; PERSONAL PROPERTY	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.617569
20956	12779	Magistrate Bench Warrant	2024B0710300039	Magistrate Bench Warrant	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.619391
20957	12780	ISH		In-State Hold	0.00		2024-11-07 22:00:05.620994
20958	12781	44-53-0370(A)	16837/2024A0720600297	MANUF.; POSS. OF SCH. IV DRUGS; EXCEPT FLUNITRAZEPAM; WITH INTENT TO DISTRIBUTE  - 1ST OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:05.622551
20959	12781	16-23-0030	16836/2024A0720600298	SALE OR DELIVERY OF FIREARM TO AND POSSESSION BY; CERTAIN PERSONS UNLAWFUL; STOLEN FIREARM	0.00	General Sessions Court	2024-11-07 22:00:05.622943
20960	12781	16-23-0500(A)	16838/2024A0720600299	POSSESSION OF FIREARM OR AMMUNITION BY PERSON CONVICTED OF VIOLENT FELONY	0.00	General Sessions Court	2024-11-07 22:00:05.623426
20961	12782	56-05-0750(B)(2)	20240190223786	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 2ND OR SUB. OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:05.625335
20962	12782	16-09-0320(A)	77191/2024A0710200604	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00	General Sessions Court	2024-11-07 22:00:05.626012
20963	12783	16-13-0160/A1a	2022A0710400092	B&EAuto/Misc.Items	0.00	General Sessions Court	2024-11-07 22:00:05.627478
20964	12783	16-13-0160/A1a	2022A0710400113	B&EAuto/Misc.Items	0.00	General Sessions Court	2024-11-07 22:00:05.628089
20965	12784	16-25-0020(A)	2024A0720600300	DOMESTIC VIOLENCE	0.00	General Sessions Court	2024-11-07 22:00:05.629485
20966	12785	44-53-0375	73283	SIMPLE POSSESSION OF CRACK	0.00	General Sessions Court	2024-11-07 22:00:05.630687
20967	12786	16-13-0230(A)	2017A0720200229	BREACH OF TRUST WITH FRAUDULENT INTENT	0.00	General Sessions Court	2024-11-07 22:00:05.632207
20968	12787	16-11-0312	2023A0710400036	BURGLARY (NON-VIOLENT) - SECOND DEGREE	15000.00	General Sessions Court	2024-11-07 22:00:05.633694
20969	12788	44-53-0370(D)(3)	77046/2024A0710200550	POSSESSION OF COCAINE, POSSESSION OF 15 DOSAGE UNITS OF MDMA OR ECSTASY	0.00	General Sessions Court	2024-11-07 22:00:05.635047
20970	12789	56-01-0460(A)(1)(A)	20240190221318	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.636623
20971	12789	44-53-370	20240190221317	Marij: Simple Possession	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.637282
20972	12790	56-01-0460(A)(1)(C)	20240190228495	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.638893
20973	12790	16-17-0725(A)	20240190228496	GIVING FALSE INFO TO LEO, FIRE OR RESCUE DEPT.	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.639332
20974	12790	54-3	20240190228497	FLEEING TO EVADE/ARREST	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.639821
20975	12790	61-04-0110	20240190228498	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.64021
20976	12791	56-01-0460(A)(1)(C)	20240190227362	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.642316
20977	12791	56-05-2930(A)	20240190227363	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.642866
20978	12791	44-53-0370(D)(2)	2024a0710300179/75437	POSS OF OTHER CONTROLLED SUB IN SCHED I TO V	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.643311
20979	12792	Public Drunk	20210180121151	Public Drunk	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.644697
20980	12792	2-1005	20240180121150	Fleeing to Evade Arrest or Detention	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.645232
20981	12793	56-05-2930(A)	20240190225076	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.647207
20982	12794	56-05-2930(A)	20240190214355	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.648556
20983	12795	General Sessns Bench Warr	2020GS0701511	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:05.650118
20984	12795	Motion to Relieved Bond	20200270059655	Bond Revocation	0.00		2024-11-07 22:00:05.650511
20985	12796	ISH		In-State Hold	0.00		2024-11-07 22:00:05.651973
20986	12797	16-23-0440(A)	75705/2024A0710400246	DISCHARGING FIREARMS INTO A DWELLING	25000.00	General Sessions Court	2024-11-07 22:00:05.653267
20987	12797	16-23-0500(A)	75706/2024A0710400245	POSSESSION OF FIREARM OR AMMUNITION BY PERSON CONVICTED OF VIOLENT FELONY	25000.00	General Sessions Court	2024-11-07 22:00:05.653736
20988	12797	23-31-0400(C)	75705/2024A071000244	USE OF FIREARM WHILE UNDER INFLUENCE OF ALCOHOL OR DRUGS	25000.00	General Sessions Court	2024-11-07 22:00:05.654252
20989	12798	56-01-0020	20240190223530	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.655627
20990	12798	16-23-0230	2024A0710400266	UNLAW. STORE, KEEP, POSS. MACHINE GUN OR SAWED-OFF SHOTGUN OR RIFLE	50000.00	General Sessions Court	2024-11-07 22:00:05.65612
20991	12799	56-05-2930(A)	20242170016040	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.657748
20992	12799	61-06-4020	20242170016041	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.658537
20993	12800	16-13-0110(A) Enhancement	17765/2024A0720600255	SHOPLIFTING/VALUE 2000 OR LESS ENHANCEMENT PER 16-01-0057	10000.00	General Sessions Court	2024-11-07 22:00:05.660393
20994	12801	16-03-0600(E)(1)	20240270088269	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.661943
20995	12801	16-11-0510(A)	20240270088268	MALICIOUS INJURY TO ANIMALS; PERSONAL PROPERTY	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.662505
20996	12802	56-05-2930(A)	2024235253231	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.664039
20997	12803	56-05-0750(B)(1)		FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 1ST OFFENSE	0.00		2024-11-07 22:00:05.665416
20998	12803	56-05-2920		RECKLESS DRIVING	0.00		2024-11-07 22:00:05.665935
20999	12804	56-05-0750(B)(1)	20240270097335	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 1ST OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:05.667541
21000	12804	56-05-2920	20240270097336	RECKLESS DRIVING	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.667949
21001	12806	56-05-2930(A)	20240190199375	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.670766
21002	12807	56-01-0020	20242351248294	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.672393
21003	12807	56-05-2930(A)	20242351243765	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.673116
21004	12807	61-04-0110	20242351248295	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.673581
21005	12808	56-05-2930(A)	20242170015727	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.675449
21006	12809	16-17-0530	20240190212035	PUBLIC DISORDERLY CONDUCT	0.00		2024-11-07 22:00:05.67731
21007	12810	ISH		In-State Hold	0.00		2024-11-07 22:00:05.678618
21008	12811	44-53-0370/b1e	77121	Marij:PWITD/S&D 1stoffense	0.00	General Sessions Court	2024-11-07 22:00:05.680264
21009	12812	56-05-2930(A)	2024018015621	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.681775
21010	12813	16-17-0530	8102P0795652	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.68345
21011	12814	56-01-0020	20242351265391	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.684799
21012	12814	56-01-0460(A)(1)(B)	20242351265390	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 2ND OFFENSE	0.00		2024-11-07 22:00:05.685172
21013	12814	56-10-0225	20242351265393	FAILURE TO MAINTAIN PROOF OF INSURANCE IN MOTOR VEHICLE	0.00		2024-11-07 22:00:05.685635
21014	12814	56-05-1520(G)(3)	20242351265392	SPEEDING 15MPH-24MPH OVER THE SPEED LIMIT	0.00		2024-11-07 22:00:05.686108
21015	12815	56-01-0020	20240190225115	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.687708
21016	12816	16-25-0020(C)	20240270089140	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.68932
21017	12816	44-53-0375(B)(1)	2024A0720200154/06020	MANUFACTURE, DISTRIBUTION ETC. OF COCAINE BASE 1ST	0.00	General Sessions Court	2024-11-07 22:00:05.689706
21018	12817	56-05-2920		RECKLESS DRIVING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.691147
21019	12817	56-01-0020		DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.692073
21020	12818	56-01-0020	20242351241816	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.69377
21021	12818	56-05-4410	20242351239034	UNLAWFUL OPERATION OF UNSAFE OR IMPROPERLY EQUIPPED VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.694246
21022	12818	61-04-0110	20242351239032	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.694629
21023	12818	56-01-0450	20242351239031	DRIVING WHILE PRIVILEGE TO DRIVE IS SUSPENDED AND PERSON IS NOT LICENSED	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.694994
21024	12818	ICE		ICE Hold	0.00		2024-11-07 22:00:05.695375
21025	12819	16-17-0530	20240190193908	PUBLIC DISORDERLY CONDUCT	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.696946
21026	12819	16-25-65	71673/2024A0710200567	DVHAN	25000.00	General Sessions Court	2024-11-07 22:00:05.697475
21027	12819	ICE		ICE Hold	0.00		2024-11-07 22:00:05.698044
21028	12820	ICE		ICE Hold	0.00		2024-11-07 22:00:05.699699
21029	12820	56-01-0020	20240190220508	DRIVING WITHOUT A LICENSE OR POSSESSION OF MORE THAN ONE DRIVERS LICENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.700097
21030	12820	63-19-2440	20240190220509	ABC(B/W):PURCHASE, COMSUMPTION OR POSSESSION OF BEER OR WINE BY MINOR	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.700594
21031	12820	44-53-0370(D)(5)	20240190220510	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.701034
21032	12820	56-05-0750(B)(1)	20240190220511	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 1ST OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:05.701423
21033	12820	56-05-2920	20240190220512	RECKLESS DRIVING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.701791
21034	12821	56-05-1250	2024A0710300314	STRIKING FIXTURES ON OR ADJACENT TO HIGHWAY - FAILURE TO REPORT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.703613
21035	12822	16-21-0080c	2024A0720400161	POSS., CONCEAL, SELL., OR DISPOSE OF STOLEN VEHICLE; VALUE MORE THAN $2;000 BUT LESS THAN $10;000	0.00	General Sessions Court	2024-11-07 22:00:05.705093
21036	12822	54-3	20242170015830	FLEEING TO EVADE/ARREST	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.705651
21037	12822	56-01-0460(A)(1)(A)	20242170015831	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.706095
21038	12822	56-05-1520(A)	20242170015829	DRIVING VEHICLE TOO FAST FOR CONDITIONS	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.706484
21039	12823	61-04-0110	20240190212673	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.708061
21040	12823	44-53-0370(D)(2)	2024A0710200484	POSS OF OTHER CONTROLLED SUB IN SCHED I TO V	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.708785
21041	12823	16-13-0110(A)	2024A0710200488	SHOPLIFTING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.70933
21042	12824	56-05-2930(A)	20240180116173	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.710926
21043	12825	61-04-0110	20240190223210	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.712529
21044	12825	61-06-4020	20240190223209	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.713012
21045	12825	44-53-0370 (D) (5)	20240190223211	Marij/Poss 28g<10gr<Hash 1st	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.713541
21046	12825	56-05-2930(A)	20240190223212	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.713954
21047	12826	7-7004	20240180122691	Possession of Open Containers	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.715454
21048	12826	56-05-1520(G)(3)	20240180122689	SPEEDING 15MPH-24MPH OVER THE SPEED LIMIT	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.715889
21049	12826	2-1005	20240180122690	Fleeing to Evade Arrest or Detention	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.716359
21050	12827	56-01-0460(A)(1)(C)	20240190218932	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.717795
21051	12827	Magistrate Bench Warrant	20220190174672	Magistrate Bench Warrant	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.71839
21052	12828	17-09-0010	20	FUG. FROM JUSTICE WARRANT; NON-CRIM. HOLD FUG. MAX. 20 DAYS. GOV. OFC.	0.00	General Sessions Court	2024-11-07 22:00:05.719905
21053	12829	16-11-0620	20240190223083	ENTERING PREMISES AFTER WARNING OR REFUSING TO LEAVE ON REQUEST	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.721179
21054	12830	34-03-0110(A)	2024A0720200161	FEDERALLY CHARTERED OR INSURED FINANCIAL INSTITUTION CRIME	0.00	General Sessions Court	2024-11-07 22:00:05.722699
21055	12830	34-03-0110(A)	2024A0720200162	FEDERALLY CHARTERED OR INSURED FINANCIAL INSTITUTION CRIME	0.00	General Sessions Court	2024-11-07 22:00:05.723219
21056	12831	Post Conviction Hearing		Post Conviction Hearing	0.00		2024-11-07 22:00:05.724562
21057	12832	ISH		In-State Hold	0.00		2024-11-07 22:00:05.726514
21058	12833	16-17-0530	20240190202071	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.728316
21059	12834	16-25-0020(D)	20240190226266	DOMESTIC VIOLENCE 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.729725
21060	12835	16-03-0600(D)(1)		ASSAULT & BATTERY 2ND DEGREE	0.00		2024-11-07 22:00:05.73133
21061	12836	16-03-0600(D)(1)	2024a07202000109	ASSAULT & BATTERY 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.732739
21062	12837	16-03-0010	2024A0710400221/77435	MURDER	0.00	General Sessions Court	2024-11-07 22:00:05.734216
21063	12837	16-23-0490	2024A0710400222/77436	POSS. WEAPON DURING VIOLENT CRIME; IF NOT ALSO SENTENCED TO LIFE WITHOUT PAROLE OR DEATH	0.00	General Sessions Court	2024-11-07 22:00:05.734592
21064	12837	00-00-0000	2024A0710400223/77437	Breach/ Breach of Peace, Aggravated in Nature	0.00	General Sessions Court	2024-11-07 22:00:05.735062
21065	12838	44-53-1110	20240180116002	GLUE SNIFFING , AROMATIC HYDROCARBONS UNLAWFUL	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.736496
21066	12839	16-17-0530	20242170015582	PUBLIC DISORDERLY CONDUCT	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.738123
21067	12840	ISH		In-State Hold	0.00		2024-11-07 22:00:05.739963
21068	12841	44-53-0370(a1)	75283/2024A0710200570	Cont. Sub: PWITD I-V	0.00	General Sessions Court	2024-11-07 22:00:05.741514
21069	12841	44-53-0370(D)(5)	20240190225947	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.742244
21070	12842	16-03-0600(E)(1)	20240190222150	ASSAULT & BATTERY 3RD DEGREE	1087.50	Beaufort County Magistrate	2024-11-07 22:00:05.744123
21071	12842	16-13-0030(A)	20240190222152	PETIT OR SIMPLE LARCENY -$2,000 OR LESS	2125.00	Beaufort County Magistrate	2024-11-07 22:00:05.744668
21072	12842	16-03-0600(D)(1)	20240190222151	ASSAULT & BATTERY 2ND DEGREE	10000.00	General Sessions Court	2024-11-07 22:00:05.745077
21073	12843	16-25-0020(D)	2024A0710400204	DOMESTIC VIOLENCE 3RD DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.746441
21074	12844	16-11-0600	4102P0336001	ENTRY ON ANOTHER'S PASTURE OR OTHER LANDS AFTER NOTICE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.747975
21075	12845	16-11-0110(B)	15648 / 2024A0720600317	ARSON - SECOND DEGREE	25000.00	General Sessions Court	2024-11-07 22:00:05.749674
21076	12846	56-01-0460(A)(1)(C)	20240180123137	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.751288
21077	12846	56-01-1100	17776 / 2024A0720600362	HABITUAL TRAFFIC OFFENDERS; DUS AS PER HABITUAL TRAFFIC OFFENDER STATUS	0.00	General Sessions Court	2024-11-07 22:00:05.751832
21078	12847	Drug Court Bench Warrant	2023GS0700562	Drug Court Bench Warrant	2000.00	General Sessions Court	2024-11-07 22:00:05.753515
21079	12848	16-17-0530	20240270095184	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.754898
21080	12849	61-06-4020	20240190198842	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.756118
21081	12849	44-53-0370(D)(5)	20240190198841	POSS. OF 28G (1 OZ) OR LESS OF MARIJUANA	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.756618
21082	12850	56-05-2930(A)	20242351303729	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.758372
21083	12850	61-06-4020	20242351303730	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.759067
21084	12850	44-53-0370	20242351303731	Simple Possession	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.759677
21085	12850	56-05-1520(G)(4)	20242351304793	SPEEDING 25MPH OVER THE SPEED LIMIT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.760185
21086	12851	50-21-0112(A)	E011939	RECKLESS OPERATION UNDER THE INFLUENCE OF DRUGS/ALCOHOL	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.761561
21087	12852	23-47-0080	15531 / 20240720600284	USE OF 911 NUMBER UNLAWFULLY	5000.00	General Sessions Court	2024-11-07 22:00:05.762884
21088	12853	16-25-0020(C)	2023A0720600134	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.764449
21089	12854	56-05-2930(A)	20242351244792	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.766031
21090	12855	16-25-0020(D)	20240190224179	DOMESTIC VIOLENCE 3RD DEGREE	0.00		2024-11-07 22:00:05.767655
21091	12856	16-13-0110(A)	20242170015407	SHOPLIFTING	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.768877
21092	12856	General Sessns Bench Warr	2022A0710200013	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:05.769407
21093	12856	General Sessns Bench Warr	2022A0710200014	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:05.769964
21094	12856	16-13-0110(A)	2024A0720400155	SHOPLIFTING	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.770384
21095	12857	56-05-2930(A)	20242351099907	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.771791
21096	12857	61-04-0110	20242351099909	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.77236
21097	12857	44-53-0370	20242351099908	Simple Possession	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.772849
21098	12857	56-01-0460(A)(1)(B)	20242351099906	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 2ND OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.773328
21099	12858	61-06-4020	20240190222477	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.774933
21100	12858	44-53-0375	2024A0710200631	SIMPLE POSSESSION OF CRACK	5000.00	General Sessions Court	2024-11-07 22:00:05.775622
21101	12858	61-04-0110	20240190219670	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.776274
21102	12859	16-17-0725 (B)	20240190223130	GIVING FALSE INFO TO LEO, FIRE, OR RESCUE DEPT. - TRAFFIC	0.00		2024-11-07 22:00:05.778234
21103	12860	16-17-0725(A)	20240190223130	GIVING FALSE INFO TO LEO, FIRE OR RESCUE DEPT.	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.779446
21104	12861	56-01-0460(A)(1)(C)	20240190210063	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 3RD OR SUB. OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.781174
21105	12862	44-53-0370/B1a1	77044/2024A0710200498	Cocaine:PWITD1st	0.00	General Sessions Court	2024-11-07 22:00:05.782612
21106	12862	44-53-0375/B1b	77043/2024a0710200499	CrackCocaine:PWITD	0.00	General Sessions Court	2024-11-07 22:00:05.783015
21107	12863	56-05-0750(B)(1)	2024A0710300240	FAILURE TO STOP FOR A BLUE LIGHT; NO INJURY OR DEATH - 1ST OFFENSE	0.00	General Sessions Court	2024-11-07 22:00:05.784595
21108	12863	17-11-110	2024A0710300242	Fleeing to evade arrest or detention	0.00	General Sessions Court	2024-11-07 22:00:05.784985
21109	12863	56-01-0050	2024A0710300243	VIOLATION OF BEGINNER PERMIT (DL)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.785531
21110	12863	56-05-2570	2024A0710300244	UNATTENDED VEHICLE-ENGINE RUNNING	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.786159
21111	12863	16-11-0700(C)	2024A0710300245	LITTERING; NOT MORE THAN 15LBS	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.786795
21112	12863	44-53-0370 (D) (5)	2024A0710300241	Marij/Poss 28g<10gr<Hash 1st	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.787291
21113	12864	16-17-0530	20240190195279	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.788948
21114	12864	16-09-0320(A)	64390/2024A0710200527	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00	General Sessions Court	2024-11-07 22:00:05.789477
21115	12865	23-47-0080	76142/2024A0710200536	USE OF 911 NUMBER UNLAWFULLY	0.00	General Sessions Court	2024-11-07 22:00:05.791086
21116	12866	16-03-0010	2024A0710400224	MURDER	0.00	General Sessions Court	2024-11-07 22:00:05.792953
21117	12866	16-23-0490	2024A0710400225	POSS. WEAPON DURING VIOLENT CRIME; IF NOT ALSO SENTENCED TO LIFE WITHOUT PAROLE OR DEATH	0.00	General Sessions Court	2024-11-07 22:00:05.793462
21118	12866	00-00-0000	2024A0710400226	Breach/ Breach of Peace, Aggravated in Nature	0.00	General Sessions Court	2024-11-07 22:00:05.793888
21119	12867	16-23-0490	2024A0710400225	POSS. WEAPON DURING VIOLENT CRIME; IF NOT ALSO SENTENCED TO LIFE WITHOUT PAROLE OR DEATH	0.00	General Sessions Court	2024-11-07 22:00:05.795393
21120	12867	22-03-0550	2024A0710400226	BREACH OF PEACE; AGGRAVATED IN NATURE	0.00	General Sessions Court	2024-11-07 22:00:05.795931
21121	12867	16-03-0010	2024A0710400224	MURDER	0.00	General Sessions Court	2024-11-07 22:00:05.796385
21122	12868	16-17-0530	20240270089175	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.798051
21123	12869	44-53-0375/Ab	75467/2024A0710200594	CrackCocaine:Poss2nd	0.00	General Sessions Court	2024-11-07 22:00:05.799332
21124	12870	56-01-0460(A)(1)(B)	20242170015360	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 2ND OFFENSE	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.800847
21125	12871	56-01-0460(A)(1)(A)	20242170013950	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.802239
21126	12871	ISH		In-State Hold	0.00		2024-11-07 22:00:05.802876
21127	12872	16-25-0020(C)	20240190228261	DOMESTIC VIOLENCE 2ND DEGREE	0.00	General Sessions Court	2024-11-07 22:00:05.804342
21128	12873	Public Drunk	20240180126080	Public Drunk	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.805815
21129	12874	16-17-0530	20240190201353	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.807526
21130	12874	16-03-1040(A)	75559	THREATENING LIFE; PERSON OR FAMILY OF PUBLIC OFFICIAL, TEACHER, PRINCIPAL	0.00	General Sessions Court	2024-11-07 22:00:05.808259
21131	12874	16-17-0725(A)	20240190199877	GIVING FALSE INFO TO LEO, FIRE OR RESCUE DEPT.	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.80897
21132	12875	44-53-0370/D3a		Cocaine:Possession1st	5000.00	General Sessions Court	2024-11-07 22:00:05.810426
21133	12875	16-03-0600(E)(1)	2024A0710200562	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.810818
21134	12876	16-17-0430(A)		UNLAWFUL COMMUNICATION (AFTER 07/20/01)	0.00		2024-11-07 22:00:05.812524
21135	12877	General Sessns Bench Warr	2020A0710200206	General Sessions Bench Warrant	0.00	General Sessions Court	2024-11-07 22:00:05.813981
21136	12878	16-17-0530	20240270097249	PUBLIC DISORDERLY CONDUCT	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.815644
21137	12878	16-11-520	20240270097247	Malicious Injury To Property	0.00	Bluffton Municipal Court	2024-11-07 22:00:05.816124
21138	12879	56-05-1220	20242351286170	HIT AND RUN; ATT. VEHICLE; DUTIES OF DRIVER INVOLVED IN ACCIDENT; PROPERTY DAMAGE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.817911
21139	12879	56-05-2930(A)	20242351286168	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.818356
21140	12879	56-01-0460(A)(1)(A)	20242351286169	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.818878
21141	12880	Family Court Bench Warrnt	2021DR0700869	Family Court Bench Warrant	0.00	14th Circuit Family Court	2024-11-07 22:00:05.820428
21142	12881	61-04-0110	20242351296454	OPEN CONTAINER OF BEER OR WINE IN MOTOR VEHICLE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.822189
21143	12881	56-01-0460(A)(1)(A)	20242351296453	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.822951
21144	12881	56-05-2930(A)	20242351296452	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.823471
21145	12882	16-13-0230(A)	2024A0710300354	BREACH OF TRUST WITH FRAUDULENT INTENT	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.825311
21146	12883	16-03-0600(E)(1)	20240190228266	ASSAULT & BATTERY 3RD DEGREE	0.00		2024-11-07 22:00:05.827264
21147	12884	44-53-0370/b1e	73351	Marij:PWITD/S&D 1stoffense	0.00	General Sessions Court	2024-11-07 22:00:05.829897
21148	12884	16-23-0500(A)	73350	POSSESSION OF FIREARM OR AMMUNITION BY PERSON CONVICTED OF VIOLENT FELONY	0.00	General Sessions Court	2024-11-07 22:00:05.830448
21149	12885	ISH		In-State Hold	0.00		2024-11-07 22:00:05.832429
21150	12886	16-03-0600(E)(1)	2024S0710300332	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.834106
21151	12887	ISH		In-State Hold	0.00		2024-11-07 22:00:05.835898
21152	12888	ISH		In-State Hold	0.00		2024-11-07 22:00:05.837976
21153	12889	16-15-0020	2024A0720400140	INCEST	50000.00	General Sessions Court	2024-11-07 22:00:05.840763
21154	12889	16-03-0655/B1a	2024A0720400139	CSCMinor/sodomy(oral/anal)(11-14)	100000.00	General Sessions Court	2024-11-07 22:00:05.841589
21155	12890	44-53-0370(B)(2)	77272/2024a0710200548	MANUF.; POSS. OF OTHER SUB. IN SCH. I; II; III OR FLUNITRAZEPAM OR ANALOGUE; W.I.T.D.	0.00	General Sessions Court	2024-11-07 22:00:05.843916
21156	12890	44-53-0370(D)(2)	77273/2024A0710200549	POSS OF OTHER CONTROLLED SUB IN SCHED I TO V	0.00	General Sessions Court	2024-11-07 22:00:05.844439
21157	12891	44-53-0375/Ad	77233	Meth:Poss<1gram1stoffense	0.00	General Sessions Court	2024-11-07 22:00:05.845967
21158	12892	56-01-0460(A)(1)(A)	20240190214805	DRIVING UNDER SUSPENSION; LICENSE NOT SUSPENDED FOR DUI - 1ST OFFENSE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.847341
21159	12893	General Sessions Commtmnt	2023A0720100064	General Sessions Commitment	0.00		2024-11-07 22:00:05.849163
21160	12894	16-13-0230(A)	76378/202A0710300365	BREACH OF TRUST WITH FRAUDULENT INTENT	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.850611
21161	12895	16-03-0600(E)(1)	20240190226000	ASSAULT & BATTERY 3RD DEGREE	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.852058
21162	12896	56-05-2930(A)	20240190224089	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.855088
21163	12897	16-09-0320(A)	49674/2024A0710200483	RESISTING ARREST; OPPOSE OR RESIST LAW ENFORCEMENT OFFICER SERVING PROCESS OR MAKING ARREST	0.00	General Sessions Court	2024-11-07 22:00:05.856563
21164	12897	17-11-110	20240190220099	Fleeing to evade arrest or detention	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.856962
21165	12898	16-11-0620	64117/2024A0710300276	ENTERING PREMISES AFTER WARNING OR REFUSING TO LEAVE ON REQUEST	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.859018
21166	12898	16-11-0620	64119/2024A0710300277	ENTERING PREMISES AFTER WARNING OR REFUSING TO LEAVE ON REQUEST	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.859653
21167	12898	16-11-0620	64118/2024A0710300278	ENTERING PREMISES AFTER WARNING OR REFUSING TO LEAVE ON REQUEST	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.860102
21168	12898	16-11-0620	2024A0710200495	ENTERING PREMISES AFTER WARNING OR REFUSING TO LEAVE ON REQUEST	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.860495
21169	12898	00-00-0000b	2024A0710200494	FleeingtoEvade	0.00	Beaufort City Municipal Court	2024-11-07 22:00:05.860871
21170	12898	56-05-1810(C)	2024A0710200493	DRIVING ON WRONG SIDE OF ROAD	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.86126
21171	12899	56-05-2930(A)	20242351263195	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.862831
21172	12900	56-05-2930(A)	20240190222263	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Beaufort County Magistrate	2024-11-07 22:00:05.864171
21173	12901	56-05-2930(A)	20242170015809	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Port Royal Municipal Court	2024-11-07 22:00:05.866013
21174	12902	56-05-2930(A)	20240190221524	DRIVING UNDER THE INFLUENCE (DUI)	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.86779
21175	12902	61-06-4020	20240190221320	TRANSPORT ALCOHOL IN MOTOR VEHICLE WITH SEAL BROKEN	0.00	Bluffton Magistrate Court	2024-11-07 22:00:05.868279
\.


--
-- Name: arrest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.arrest_id_seq', 12902, true);


--
-- Name: inmate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inmate_id_seq', 12978, true);


--
-- Name: offense_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.offense_id_seq', 21175, true);


--
-- Name: arrest arrest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arrest
    ADD CONSTRAINT arrest_pkey PRIMARY KEY (id);


--
-- Name: inmate inmate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inmate
    ADD CONSTRAINT inmate_pkey PRIMARY KEY (id);


--
-- Name: offense offense_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offense
    ADD CONSTRAINT offense_pkey PRIMARY KEY (id);


--
-- Name: arrest arrest_inmate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arrest
    ADD CONSTRAINT arrest_inmate_id_fkey FOREIGN KEY (inmate_id) REFERENCES public.inmate(id) ON DELETE CASCADE;


--
-- Name: offense offense_arrest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offense
    ADD CONSTRAINT offense_arrest_id_fkey FOREIGN KEY (arrest_id) REFERENCES public.arrest(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

