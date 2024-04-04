--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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
-- Name: check_attendance(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.check_attendance() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM attendance 
        WHERE emp_f_id = NEW.emp_f_id 
        AND date_trunc('day', date) = date_trunc('day', CURRENT_DATE)
    ) THEN
        RAISE EXCEPTION 'User already has attendance recorded for today';
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.check_attendance() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: applicant_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_list (
    id integer NOT NULL,
    email character varying(255),
    app_id character varying(255),
    first_name character varying(255) NOT NULL,
    sur_name character varying(255) NOT NULL,
    passport character varying(255),
    dob character varying(255),
    pass_issuedate character varying(255),
    pass_expdate character varying(255),
    phone character varying(255),
    address character varying(255),
    marital_status character varying(255),
    spouse character varying(255),
    doc_link character varying(255),
    status character varying(255) DEFAULT 'pending'::character varying,
    office_f_id integer,
    project_f_id integer,
    created_by character varying(255),
    department character varying(255),
    date character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_by character varying(255),
    password character varying(255),
    asign_status character varying(255),
    work_status character varying(255) DEFAULT 'Pending'::character varying,
    pic character varying(255),
    father_name character varying(255),
    mom_name character varying(255),
    traveled_eu character varying(255),
    rejection character varying(255),
    rej_status character varying(255)
);


ALTER TABLE public.applicant_list OWNER TO postgres;

--
-- Name: applicant_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicant_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.applicant_list_id_seq OWNER TO postgres;

--
-- Name: applicant_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicant_list_id_seq OWNED BY public.applicant_list.id;


--
-- Name: applicant_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_status (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'pending'::character varying,
    office_f_id integer,
    project_f_id integer,
    applicant_f_id integer,
    created_by character varying(255),
    date character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.applicant_status OWNER TO postgres;

--
-- Name: applicant_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicant_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.applicant_status_id_seq OWNER TO postgres;

--
-- Name: applicant_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicant_status_id_seq OWNED BY public.applicant_status.id;


--
-- Name: attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attendance (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'pending'::character varying,
    emp_f_id integer,
    office_f_id integer,
    created_by character varying(255),
    date date,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    login_time character varying(100),
    logout_time character varying(100),
    device_id character varying(255)
);


ALTER TABLE public.attendance OWNER TO postgres;

--
-- Name: attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attendance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attendance_id_seq OWNER TO postgres;

--
-- Name: attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attendance_id_seq OWNED BY public.attendance.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    id integer NOT NULL,
    number_of_applicant character varying(255),
    applicant_f_id integer,
    office_f_id integer,
    status character varying(255) DEFAULT 'Pending'::character varying,
    document character varying(255),
    created_by character varying(255),
    updated_by character varying(255),
    date character varying(255),
    "timestamp" timestamp with time zone DEFAULT now() NOT NULL,
    remarks character varying(999)
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_id_seq OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- Name: employ; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employ (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(255),
    user_id character varying(255),
    office_f_id integer,
    designation character varying(255),
    department character varying(255),
    age character varying(255),
    phone character varying(255),
    email character varying(255),
    date character varying(255),
    "timestamp" character varying(255),
    password character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.employ OWNER TO postgres;

--
-- Name: employ_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employ_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employ_id_seq OWNER TO postgres;

--
-- Name: employ_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employ_id_seq OWNED BY public.employ.id;


--
-- Name: main_payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_payments (
    id integer NOT NULL,
    emp_f_id integer,
    app_f_id integer,
    office_f_id integer,
    project_f_id integer,
    amount character varying(255),
    status character varying(255) DEFAULT 'Pending'::character varying,
    created_by character varying(255),
    updated_by character varying(255),
    document character varying(255),
    date character varying(255),
    "timestamp" character varying(255)
);


ALTER TABLE public.main_payments OWNER TO postgres;

--
-- Name: main_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_payments_id_seq OWNER TO postgres;

--
-- Name: main_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_payments_id_seq OWNED BY public.main_payments.id;


--
-- Name: main_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_projects (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(255),
    project_id character varying(255),
    number_of_applicant character varying(255),
    status character varying(255) DEFAULT 'Pending'::character varying,
    department character varying(255),
    created_by character varying(255),
    updated_by character varying(255),
    date character varying(255),
    "timestamp" timestamp with time zone DEFAULT now() NOT NULL,
    end_date character varying(255)
);


ALTER TABLE public.main_projects OWNER TO postgres;

--
-- Name: main_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_projects_id_seq OWNER TO postgres;

--
-- Name: main_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_projects_id_seq OWNED BY public.main_projects.id;


--
-- Name: notify; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notify (
    id integer NOT NULL,
    emp_f_id integer,
    app_f_id integer,
    office_f_id integer,
    project_f_id integer,
    remark character varying(775),
    date character varying(255),
    status character varying(255) DEFAULT 'Pending'::character varying,
    viewed character varying(255) DEFAULT 'Pending'::character varying,
    created_by character varying(255),
    updated_by character varying(255),
    "timestamp" character varying(255),
    designation character varying(255)
);


ALTER TABLE public.notify OWNER TO postgres;

--
-- Name: notify_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notify_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notify_id_seq OWNER TO postgres;

--
-- Name: notify_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notify_id_seq OWNED BY public.notify.id;


--
-- Name: office; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.office (
    id integer NOT NULL,
    admin_name character varying(255) NOT NULL,
    office_place character varying(255),
    office_id character varying(255),
    department character varying(255),
    phone character varying(255),
    date character varying(255),
    "timestamp" character varying(255)
);


ALTER TABLE public.office OWNER TO postgres;

--
-- Name: office_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.office_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.office_id_seq OWNER TO postgres;

--
-- Name: office_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.office_id_seq OWNED BY public.office.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    emp_f_id integer,
    app_f_id integer,
    office_f_id integer,
    project_f_id integer,
    amount character varying(255),
    payment_type character varying(255),
    transac_acc character varying(255),
    status character varying(255) DEFAULT 'Pending'::character varying,
    created_by character varying(255),
    updated_by character varying(255),
    document character varying(255),
    date character varying(255),
    "timestamp" character varying(255)
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(255),
    project_id character varying(255),
    office_f_id integer,
    status character varying(255) DEFAULT 'Pending'::character varying,
    department character varying(255),
    created_by character varying(255),
    date character varying(255),
    "timestamp" character varying(255),
    target character varying(255),
    updated_by character varying(255),
    end_date character varying(255)
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'pending'::character varying,
    office_f_id integer,
    created_by character varying(255),
    date character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    num_applicants character varying(255),
    project_name character varying(255),
    updated_by character varying(255),
    mpid integer,
    project_id character varying(255)
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO postgres;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(128) NOT NULL,
    password character varying(128) NOT NULL,
    flag character varying(255),
    created_by character varying(255),
    created_date timestamp without time zone,
    modified_date timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: applicant_list id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_list ALTER COLUMN id SET DEFAULT nextval('public.applicant_list_id_seq'::regclass);


--
-- Name: applicant_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_status ALTER COLUMN id SET DEFAULT nextval('public.applicant_status_id_seq'::regclass);


--
-- Name: attendance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance ALTER COLUMN id SET DEFAULT nextval('public.attendance_id_seq'::regclass);


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- Name: employ id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employ ALTER COLUMN id SET DEFAULT nextval('public.employ_id_seq'::regclass);


--
-- Name: main_payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_payments ALTER COLUMN id SET DEFAULT nextval('public.main_payments_id_seq'::regclass);


--
-- Name: main_projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_projects ALTER COLUMN id SET DEFAULT nextval('public.main_projects_id_seq'::regclass);


--
-- Name: notify id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notify ALTER COLUMN id SET DEFAULT nextval('public.notify_id_seq'::regclass);


--
-- Name: office id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office ALTER COLUMN id SET DEFAULT nextval('public.office_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: applicant_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicant_list (id, email, app_id, first_name, sur_name, passport, dob, pass_issuedate, pass_expdate, phone, address, marital_status, spouse, doc_link, status, office_f_id, project_f_id, created_by, department, date, created_at, updated_at, updated_by, password, asign_status, work_status, pic, father_name, mom_name, traveled_eu, rejection, rej_status) FROM stdin;
65	jbbusiness1234@gmail.com	Jazz20240328	Jazz	test	1234567894	2024-03-28	2024-03-12	2024-03-22	1254874596	fdfdfdf	Married	Kanchana	https://gitfunswokhu.in/image/MCN%20401%20ISE%20Module%201.pdf	pending	12	\N	\N	Worked Abroad	2024-03-27	2024-03-27 18:05:31.287232+00	2024-03-27 18:05:31.287232+00	\N	20240328	Success	Success	\N	Hello	Cathy	Travelled To Europe		Not Faced Rejection Before
70	jbbusiness1234@gmail.com	Sonu20000103	Sonu	test	1234567894	2000-01-03	2024-04-01	2024-04-16	1458569844	dfdfdf	Not Married		\N	pending	12	\N	\N	Worked Abroad	2024-04-03	2024-04-03 16:36:11.32033+00	2024-04-03 16:36:11.32033+00	\N	20000103	\N	Pending	\N	Jose	Cathy	Travelled To Europe		Not Faced Rejection Before
71	jbbusiness1234@gmail.com	test new20240414	test new	test last	1234567894	2024-04-14	2024-04-28	2024-04-30	1458478457	fdfdfdf	Not Married		\N	pending	12	\N	\N	Worked Abroad	2024-04-03	2024-04-03 17:19:22.69608+00	2024-04-03 17:19:22.69608+00	\N	20240414	\N	Pending	\N	Hello	Cathy	Travelled To Europe		Not Faced Rejection Before
69	adithyanunni258@gmail.com	adi20240331	adi	u	KL0013AM	2024-03-31	2024-04-02	2024-04-12	9061616161	cd	Not Married		\N	pending	12	\N	\N	Worked Abroad	2024-04-01	2024-04-01 08:31:12.656246+00	2024-04-01 08:31:12.656246+00	\N	20240331	\N	Success	\N	wdf	dcw	Travelled To Europe		Not Faced Rejection Before
66	adarshkachary@gmail.com	Adarsh19951208	Adarsh	k	w2342334	1995-12-08	2002-03-09	2022-03-08	8089671893	asdassldjwndkwedne	Not Married		\N	pending	13	\N	\N	Worked Abroad	2024-03-28	2024-03-28 03:28:51.34736+00	2024-03-28 03:28:51.34736+00	\N	19951208	Success	Pending	\N	kuttappan	Leela	Not Travelled To Europe		Not Faced Rejection Before
68	jbbusiness1234@gmail.com	John20051026	John	Doe	1234567894	2005-10-26	2024-04-05	2024-04-22	1548745487	John Doe House 	Not Married	Machu	\N	pending	12	\N	\N	Worked Abroad	2024-04-01	2024-04-01 05:44:44.957269+00	2024-04-01 05:44:44.957269+00	\N	20051026	Success	Success	\N	Doe	Cathy	Not Travelled To Europe	No rejection	Not Faced Rejection Before
67	jbbusiness1234@gmail.com	Kumar19950412	Kumar	KS	1234567894	1995-04-12	2024-03-11	2024-03-27	1458456245	Kumar House Ernakulam kerala India	Not Married		\N	pending	12	\N	\N	Worked In India	2024-03-30	2024-03-30 07:34:21.476419+00	2024-03-30 07:34:21.476419+00	\N	19950412	Success	Success	https://gitfunswokhu.in/image/srk.jpg	K Suresh	Bhavani	Not Travelled To Europe		Not Faced Rejection Before
\.


--
-- Data for Name: applicant_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicant_status (id, status, office_f_id, project_f_id, applicant_f_id, created_by, date, created_at, updated_at) FROM stdin;
161	pending	12	180	65	Admin	2024-02-20	2024-03-29 13:36:12.244724+00	2024-03-29 13:36:12.244724+00
162	pending	12	180	67	Admin	2024-02-20	2024-03-31 09:00:27.521362+00	2024-03-31 09:00:27.521362+00
163	pending	12	180	68	Admin	2024-02-20	2024-04-01 05:45:14.535016+00	2024-04-01 05:45:14.535016+00
164	pending	12	180	69	Admin	2024-02-20	2024-04-01 08:32:12.381988+00	2024-04-01 08:32:12.381988+00
\.


--
-- Data for Name: attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attendance (id, status, emp_f_id, office_f_id, created_by, date, created_at, updated_at, login_time, logout_time, device_id) FROM stdin;
241	Loggedout	26	12	\N	2024-03-26	2024-03-26 10:54:22.083351+00	2024-03-26 10:54:22.083351+00	6:24:20 PM	6:24:39 PM	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36Win32-330
242	Loggedout	26	12	\N	2024-03-27	2024-03-27 16:03:12.102732+00	2024-03-27 16:03:12.102732+00	11:33:11 PM	1:15:08 AM	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36Win32-330
243	Loggedout	27	13	\N	2024-03-28	2024-03-28 01:26:14.927419+00	2024-03-28 01:26:14.927419+00	8:56:14 AM	9:05:47 AM	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15MacIntel-330
244	Active	26	12	\N	2024-03-29	2024-03-29 11:08:43.925302+00	2024-03-29 11:08:43.925302+00	6:38:42 PM	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36Win32-330
252	Loggedout	29	12	\N	2024-04-01	2024-04-01 05:16:03.832107+00	2024-04-01 05:16:03.832107+00	12:46:02 PM	2:00:54 PM	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36Win32-330
224	Loggedout	27	13	\N	2024-03-24	2024-03-24 02:21:16.484101+00	2024-03-24 02:21:16.484101+00	9:51:16 AM	8:00:49 PM	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15MacIntel-330
245	Loggedout	26	12	\N	2024-03-30	2024-03-30 05:10:56.261235+00	2024-03-30 05:10:56.261235+00	12:40:56 PM	12:50:03 PM	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36Win32-330
221	Loggedout	27	13	\N	2024-03-23	2024-03-23 15:21:19.319756+00	2024-03-23 15:21:19.319756+00	10:51:19 PM	12:02:38 AM	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15MacIntel-330
225	Loggedout	26	12	\N	2024-03-24	2024-03-24 03:25:34.848896+00	2024-03-24 03:25:34.848896+00	10:55:34 AM	1:34:02 AM	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36Win32-330
240	Loggedout	26	12	\N	2024-03-25	2024-03-25 14:39:49.625947+00	2024-03-25 14:39:49.625947+00	10:09:46 PM	10:10:59 PM	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36Win32-330
191	Loggedout	26	12	\N	2024-03-23	2024-03-23 05:05:11.387066+00	2024-03-23 05:05:11.387066+00	12:35:10 PM	12:04:53 AM	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36Win32-330
248	Loggedout	26	12	\N	2024-03-31	2024-03-31 06:46:54.020513+00	2024-03-31 06:46:54.020513+00	2:16:52 PM	12:56:10 AM	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36Win32-330
262	Loggedout	31	12	\N	2024-04-01	2024-04-01 09:19:25.92594+00	2024-04-01 09:19:25.92594+00	4:49:24 PM	8:24:51 PM	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36Win32-330
272	Loggedout	30	12	\N	2024-04-01	2024-04-01 12:55:05.371608+00	2024-04-01 12:55:05.371608+00	8:25:03 PM	9:36:11 PM	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36Win32-330
249	Loggedout	26	12	\N	2024-04-01	2024-04-01 02:42:54.686848+00	2024-04-01 02:42:54.686848+00	10:12:53 AM	12:26:14 AM	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36Win32-330
284	Active	30	12	\N	2024-04-03	2024-04-03 04:52:03.756638+00	2024-04-03 04:52:03.756638+00	12:22:02 PM	1:39:01 PM	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36Win32-330
286	Active	30	12	\N	2024-04-04	2024-04-04 03:10:50.374289+00	2024-04-04 03:10:50.374289+00	10:40:50 AM	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36Win32-330
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (id, number_of_applicant, applicant_f_id, office_f_id, status, document, created_by, updated_by, date, "timestamp", remarks) FROM stdin;
16	\N	65	12	Success	https://gitfunswokhu.in/image/MCN%20401%20ISE%20Module%201.pdf	Jazz	\N	2024-03-30	2024-03-30 07:21:04.602526+00	\N
17	\N	68	12	Pending	https://gitfunswokhu.in/image/MCN%20401%20ISE%20Module%203.pdf	John	\N	2024-04-01	2024-04-01 11:01:56.122985+00	\N
\.


--
-- Data for Name: employ; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employ (id, name, address, user_id, office_f_id, designation, department, age, phone, email, date, "timestamp", password, updated_by) FROM stdin;
27	BALA	BHANU, KOLLAM	bala@integritat	13	manager	administrator	10	7025857000	jbhg@gmail	2024-01-03	\N	bala@123	\N
28	Adarsh	pky, kollam	adarsh@integritat	13	office assistant	Documentation	28	7025456982	jhggvuy@gmail.com	2024-01-03	\N	adarsh@123	\N
31	Sean	Sean House	sean12345	12	Documentation	Sales	31	1258478457	jbbusiness1234@gmail.com	2024-04-01	\N	sean@123	\N
26	Harris	Harris house	harris123	12	Finance	Sales	27	1548754693	jbbusiness1234@gmail.com	2024-03-23	\N	harris@123	\N
29	Shreyas	Shreyas House Ernakulam	shreyas1	12	Management	Mech	30	1258478596	jbbusiness1234@gmail.com	2024-04-01	\N	shreyas@123	\N
30	Deepak	Deepak House	deepak12	12	Manager	sales	30	1254874547	jbbusiness1234@gmail.com	2024-04-01	\N	deepak@123	\N
\.


--
-- Data for Name: main_payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_payments (id, emp_f_id, app_f_id, office_f_id, project_f_id, amount, status, created_by, updated_by, document, date, "timestamp") FROM stdin;
54	26	68	12	\N	60000	Rejected	Harris	\N	\N	2024-04-24	\N
56	30	70	12	\N	40000	Pending	Deepak	\N	\N	2024-04-10	\N
57	30	71	12	\N	50000	Pending	Deepak	\N	\N	2024-04-10	\N
55	26	69	12	\N	15000	Rejected	Harris	\N	\N	2024-04-18	\N
52	27	66	13	\N	55000	Success	BALA	\N	\N	2024-04-02	\N
53	26	67	12	\N	25000	Success	Harris	\N	\N	2024-04-10	\N
51	26	65	12	\N	50000	Pending	Harris	\N	\N	2024-03-30	\N
\.


--
-- Data for Name: main_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_projects (id, name, address, project_id, number_of_applicant, status, department, created_by, updated_by, date, "timestamp", end_date) FROM stdin;
40	Project 111	Project 111 Kerala	PRJ111	140	Pending	Mechanic	Admin	\N	2024-04-01	2024-03-26 19:52:56.839799+00	2024-04-10
41	Project 114	Project 114 Kerala Ltd	PRJ114	200	Pending	Mechanics	Admin	\N	2024-04-05	2024-03-26 19:59:59.59428+00	2024-04-16
42	Project 121	Project 121 Kerala	PRJ121	100	Pending	Technical	Admin	\N	2024-03-01	2024-03-26 20:42:26.462668+00	2024-03-24
43	Project 122	Project 122 Kerala	PRJ122	100	Pending	Mechanic	Admin	\N	2024-03-01	2024-03-26 20:55:23.816914+00	2024-03-24
44	zxz	Tata Kerala	PRJ 10	100	Pending	Sales	Admin	\N	2024-04-01	2024-03-26 20:56:53.384764+00	2024-04-10
45	Tata	Tata Kerala	12121	100	Pending	Sales	Admin	\N	2024-04-01	2024-03-26 20:58:22.401671+00	2024-04-06
46	Project150	dgdghdgdgdb	PRJ150	150	Pending	Sales	Admin	\N	2024-04-02	2024-03-26 21:02:49.79034+00	2024-04-06
47	Project 106	Project 106 kerala	PRJ106	100	Pending	Mechanic	Admin	\N	2024-03-01	2024-03-26 21:10:03.123068+00	2024-03-24
48	Project 107	Project 107 kerala	PRJ107	100	Pending	Sales	Admin	\N	2024-03-01	2024-03-26 21:12:58.639822+00	2024-03-10
49	Project160	Project 160 kerala	PRJ160	100	Pending	Technical	Admin	\N	2024-03-01	2024-03-26 21:26:23.094991+00	2024-03-18
50	Project 170	Project 170 kerala	PRJ 170	100	Pending	Mechanics	Admin	\N	2024-03-01	2024-03-26 21:27:40.530748+00	2024-03-24
51	Tata New	tata india	Tata002	100	Pending	Mechanic	Admin	\N	2024-04-01	2024-03-27 04:58:08.612011+00	2024-04-10
34	Project 50	dgdghdgdgdb	PRJ50	200	Completed	Sales	Admin	\N	2024-03-01	2024-03-26 19:08:38.943215+00	2024-03-22
24	MRF	Kollam	MRF6600	100	Pending	HR	Admin	\N	2024-03-20	2024-03-22 18:57:17.76912+00	2024-03-23
25	electro	Hungary	ELECTRO 2024	500	Pending	ELCTRO FACTORY WORKER	Admin	\N	2024-03-26	2024-03-23 17:05:21.578964+00	2024-04-29
26	MRF	MRF kerala	MRF001	952	Pending	Sales	Admin	\N	2024-04-01	2024-03-24 05:08:24.700471+00	2024-04-30
27	Tata Project	Tata ekm	TATA100	600	Pending	Sales	Admin	\N	2024-04-01	2024-03-26 14:38:37.469973+00	2024-04-30
28	Bajaj Project	Bajaj Kerala	BAJAJ100	800	Pending	Sales	Admin	\N	2024-04-01	2024-03-26 14:46:07.270829+00	2024-04-16
29	Yamaha Project New	Yamaha Kerala India	YAMAHA100	150	Pending	Sales	Admin	\N	2024-04-01	2024-03-26 14:54:02.760063+00	2024-04-06
30	Toyota Project New	Toyota Global	YOYOTA100	200	Pending	HR	Admin	\N	2024-04-01	2024-03-26 15:35:21.405178+00	2024-04-06
31	Suzuki Project	Suzuki India Ltd	SUZUKI200	500	Pending	Mechanics	Admin	\N	2024-04-01	2024-03-26 18:16:29.922169+00	2024-04-18
32	New Project 10	New Project Test address	NewProject100	500	Pending	Sales	Admin	\N	2024-04-01	2024-03-26 18:18:54.241724+00	2024-04-25
33	Dalmia Cement Project	Dalmia Kerala	DALMIA10	100	Pending	Technical	Admin	\N	2024-04-02	2024-03-26 18:21:55.805149+00	2024-04-10
35	Project 101	Project 101 Kerala	PRJ101	200	Pending	Technical	Admin	\N	2024-03-01	2024-03-26 19:18:00.373457+00	2024-03-26
36	Project 102	Project 102 Kerala	PRJ102	100	Pending	Mechanic	Admin	\N	2024-03-01	2024-03-26 19:30:41.316207+00	2024-03-18
37	Project 104	Project 104 Kerala	PRJ104	100	Pending	Technical	Admin	\N	2024-03-06	2024-03-26 19:33:49.023782+00	2024-03-25
38	Project 105	Project 105 Kerala	PRJ105	100	Pending	Mechanics	Admin	\N	2024-03-01	2024-03-26 19:36:20.86535+00	2024-03-18
39	Project 110	Project 110 Kerala	PRJ110	99	Pending	HR	Admin	\N	2024-04-01	2024-03-26 19:44:10.686667+00	2024-04-12
\.


--
-- Data for Name: notify; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notify (id, emp_f_id, app_f_id, office_f_id, project_f_id, remark, date, status, viewed, created_by, updated_by, "timestamp", designation) FROM stdin;
1	30	70	12	\N	Tha applicant Sonu is approved	2024-04-10	Pending	Pending	Deepak	\N	\N	\N
2	30	71	12	\N	Tha applicant test new is approved	2024-04-10	Pending	Pending	Deepak	\N	\N	Manager
\.


--
-- Data for Name: office; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.office (id, admin_name, office_place, office_id, department, phone, date, "timestamp") FROM stdin;
12	Admintest	Kochi	1	Sales	1234567894	2024-03-20	\N
13	BALA	TRIVANDRUM	INTEGRITAT@TVM	CONSULTANCY	7025857000	2024-01-21	\N
14	Admintest	Dubai	26	Sales	1234567894	2024-03-26	\N
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, emp_f_id, app_f_id, office_f_id, project_f_id, amount, payment_type, transac_acc, status, created_by, updated_by, document, date, "timestamp") FROM stdin;
36	26	68	12	\N	5000	\N	\N	Pending	Harris	\N	\N	2024-04-24	\N
35	26	68	12	\N	5000	\N	\N	Completed	Harris	\N	\N	2024-04-10	\N
34	26	67	12	\N	5000	Bank Transfer	SBI1545222	Completed	Harris	\N	https://gitfunswokhu.in/image/MCN%20401%20ISE%20Module%205.pdf	2024-04-16	\N
33	26	65	12	\N	2000	UPI	SBI1545222	Failed	Harris	\N	https://gitfunswokhu.in/image/mohanlal.jpg	2024-04-06	\N
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, name, address, project_id, office_f_id, status, department, created_by, date, "timestamp", target, updated_by, end_date) FROM stdin;
179	MRF	MRF kerala	MRF001	13	Pending	\N	Admin	2024-04-01	\N	40	\N	2024-04-30
180	MRF	MRF kerala	MRF001	12	Pending	\N	Admin	2024-04-01	\N	50	\N	2024-04-30
181	MRF	MRF kerala	MRF001	14	Pending	\N	Admin	2024-04-01	\N	30	\N	2024-04-30
183	electro	Hungary	ELECTRO 2024	12	Pending	\N	Admin	2024-03-26	\N	100	\N	2024-04-29
184	electro	Hungary	ELECTRO 2024	13	Pending	\N	Admin	2024-03-26	\N	100	\N	2024-04-29
185	electro	Hungary	ELECTRO 2024	14	Pending	\N	Admin	2024-03-26	\N	250	\N	2024-04-29
182	Project 50	\N	PRJ50	12	Completed	\N	Admin	2024-03-01	\N	180	admin	2024-03-22
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (id, status, office_f_id, created_by, date, created_at, updated_at, num_applicants, project_name, updated_by, mpid, project_id) FROM stdin;
102	Pending	13	Admin	2024-04-01	2024-03-26 18:13:24.553079+00	2024-03-26 18:13:24.553079+00	100	MRF	\N	\N	MRF001
103	Pending	13	Admin	2024-04-01	2024-03-26 18:13:42.134035+00	2024-03-26 18:13:42.134035+00	500	MRF	\N	\N	MRF001
104	Pending	12	Admin	2024-04-01	2024-03-26 18:13:50.883126+00	2024-03-26 18:13:50.883126+00	20	MRF	\N	\N	MRF001
105	Pending	13	Admin	2024-04-01	2024-03-26 18:14:51.793879+00	2024-03-26 18:14:51.793879+00	100	Toyota Project New	\N	\N	YOYOTA100
106	Pending	12	Admin	2024-04-01	2024-03-26 18:16:48.768674+00	2024-03-26 18:16:48.768674+00	200	Suzuki Project	\N	\N	SUZUKI200
107	Pending	13	Admin	2024-04-01	2024-03-26 18:16:49.057077+00	2024-03-26 18:16:49.057077+00	300	Suzuki Project	\N	\N	SUZUKI200
108	Pending	12	Admin	2024-04-01	2024-03-26 18:17:03.5275+00	2024-03-26 18:17:03.5275+00	200	Suzuki Project	\N	\N	SUZUKI200
109	Pending	13	Admin	2024-04-01	2024-03-26 18:17:03.530825+00	2024-03-26 18:17:03.530825+00	100	Suzuki Project	\N	\N	SUZUKI200
110	Pending	14	Admin	2024-04-01	2024-03-26 18:17:03.912457+00	2024-03-26 18:17:03.912457+00	50	Suzuki Project	\N	\N	SUZUKI200
111	Pending	12	Admin	2024-04-01	2024-03-26 18:19:12.137491+00	2024-03-26 18:19:12.137491+00	25	New Project 10	\N	\N	NewProject100
112	Pending	13	Admin	2024-04-01	2024-03-26 18:19:12.321379+00	2024-03-26 18:19:12.321379+00	100	New Project 10	\N	\N	NewProject100
113	Pending	13	Admin	2024-04-02	2024-03-26 18:22:13.7577+00	2024-03-26 18:22:13.7577+00	20	Dalmia Cement Project	\N	\N	DALMIA10
114	Pending	12	Admin	2024-04-02	2024-03-26 18:24:26.050107+00	2024-03-26 18:24:26.050107+00	50	Dalmia Cement Project	\N	\N	DALMIA10
115	Pending	12	Admin	2024-04-01	2024-03-26 19:00:30.872276+00	2024-03-26 19:00:30.872276+00	20	MRF	\N	\N	MRF001
116	Pending	13	Admin	undefined	2024-03-26 19:07:55.31383+00	2024-03-26 19:07:55.31383+00	50	MRF	\N	\N	MRF6600
68	In Progress	12	Test Admin	2024-03-01	2024-03-24 05:06:58.982287+00	2024-03-24 05:06:58.982287+00	200	electro	admin	\N	ELECTRO 2024
69	Pending	12	Admin	2024-04-01	2024-03-26 13:34:07.602908+00	2024-03-26 13:34:07.602908+00	100	MRF	\N	\N	MRF001
70	Pending	13	Admin	2024-04-01	2024-03-26 13:34:07.815176+00	2024-03-26 13:34:07.815176+00	100	MRF	\N	\N	MRF001
71	Pending	12	Admin	2024-04-01	2024-03-26 14:38:50.177724+00	2024-03-26 14:38:50.177724+00	20	Tata Project	\N	\N	TATA100
72	Pending	13	Admin	2024-04-01	2024-03-26 14:38:50.252298+00	2024-03-26 14:38:50.252298+00		Tata Project	\N	\N	TATA100
73	Pending	12	Admin	2024-04-01	2024-03-26 14:38:57.546535+00	2024-03-26 14:38:57.546535+00	20	Tata Project	\N	\N	TATA100
74	Pending	13	Admin	2024-04-01	2024-03-26 14:38:57.550992+00	2024-03-26 14:38:57.550992+00		Tata Project	\N	\N	TATA100
75	Pending	12	Admin	2024-04-01	2024-03-26 14:40:57.036688+00	2024-03-26 14:40:57.036688+00	20	Tata Project	\N	\N	TATA100
76	Pending	13	Admin	2024-04-01	2024-03-26 14:40:57.334789+00	2024-03-26 14:40:57.334789+00		Tata Project	\N	\N	TATA100
77	Pending	12	Admin	2024-04-01	2024-03-26 14:41:26.227372+00	2024-03-26 14:41:26.227372+00	50	Tata Project	\N	\N	TATA100
78	Pending	13	Admin	2024-04-01	2024-03-26 14:41:26.242729+00	2024-03-26 14:41:26.242729+00		Tata Project	\N	\N	TATA100
79	Pending	12	Admin	2024-04-01	2024-03-26 14:42:07.60062+00	2024-03-26 14:42:07.60062+00	60	Tata Project	\N	\N	TATA100
80	Pending	13	Admin	2024-04-01	2024-03-26 14:42:07.605179+00	2024-03-26 14:42:07.605179+00		Tata Project	\N	\N	TATA100
81	Pending	12	Admin	2024-04-01	2024-03-26 14:42:25.813779+00	2024-03-26 14:42:25.813779+00	40	Tata Project	\N	\N	TATA100
82	Pending	13	Admin	2024-04-01	2024-03-26 14:42:25.822567+00	2024-03-26 14:42:25.822567+00		Tata Project	\N	\N	TATA100
83	Pending	12	Admin	2024-04-01	2024-03-26 14:42:48.439151+00	2024-03-26 14:42:48.439151+00	80	Tata Project	\N	\N	TATA100
84	Pending	13	Admin	2024-04-01	2024-03-26 14:43:09.459127+00	2024-03-26 14:43:09.459127+00	100	Tata Project	\N	\N	TATA100
85	Pending	12	Admin	2024-04-01	2024-03-26 14:46:17.868401+00	2024-03-26 14:46:17.868401+00	40	Bajaj Project	\N	\N	BAJAJ100
86	Pending	13	Admin	2024-04-01	2024-03-26 14:50:26.793679+00	2024-03-26 14:50:26.793679+00	758	Bajaj Project	\N	\N	BAJAJ100
87	Pending	13	Admin	2024-04-01	2024-03-26 14:54:17.41214+00	2024-03-26 14:54:17.41214+00	20	Yamaha Project New	\N	\N	YAMAHA100
88	Pending	12	Admin	2024-04-01	2024-03-26 14:56:52.790406+00	2024-03-26 14:56:52.790406+00	50	Yamaha Project New	\N	\N	YAMAHA100
89	Pending	13	Admin	2024-04-01	2024-03-26 14:59:56.716635+00	2024-03-26 14:59:56.716635+00	60	Yamaha Project New	\N	\N	YAMAHA100
90	Pending	13	Admin	2024-04-01	2024-03-26 15:02:16.128294+00	2024-03-26 15:02:16.128294+00	4	Yamaha Project New	\N	\N	YAMAHA100
91	Pending	12	Admin	2024-04-01	2024-03-26 15:06:23.94065+00	2024-03-26 15:06:23.94065+00	5	Yamaha Project New	\N	\N	YAMAHA100
92	Pending	12	Admin	2024-04-01	2024-03-26 15:07:36.438138+00	2024-03-26 15:07:36.438138+00	5	Yamaha Project New	\N	\N	YAMAHA100
93	Pending	12	Admin	2024-04-01	2024-03-26 15:07:52.599896+00	2024-03-26 15:07:52.599896+00	2	Yamaha Project New	\N	\N	YAMAHA100
94	Pending	12	Admin	2024-04-01	2024-03-26 15:09:24.537956+00	2024-03-26 15:09:24.537956+00	1	Yamaha Project New	\N	\N	YAMAHA100
95	Pending	12	Admin	2024-04-01	2024-03-26 15:23:09.718273+00	2024-03-26 15:23:09.718273+00	10	Yamaha Project New	\N	\N	YAMAHA100
96	Pending	12	Admin	2024-04-01	2024-03-26 15:23:23.510766+00	2024-03-26 15:23:23.510766+00	10	Yamaha Project New	\N	\N	YAMAHA100
97	Pending	12	Admin	2024-04-01	2024-03-26 15:24:58.706742+00	2024-03-26 15:24:58.706742+00	5	Yamaha Project New	\N	\N	YAMAHA100
98	Pending	12	Admin	2024-04-01	2024-03-26 15:28:27.892547+00	2024-03-26 15:28:27.892547+00	2	Yamaha Project New	\N	\N	YAMAHA100
99	Pending	12	Admin	2024-04-01	2024-03-26 15:29:26.644385+00	2024-03-26 15:29:26.644385+00	1	Yamaha Project New	\N	\N	YAMAHA100
100	Pending	12	Admin	2024-04-01	2024-03-26 15:31:55.961438+00	2024-03-26 15:31:55.961438+00	1	Yamaha Project New	\N	\N	YAMAHA100
101	Pending	12	Admin	2024-04-01	2024-03-26 15:35:33.940207+00	2024-03-26 15:35:33.940207+00	20	Toyota Project New	\N	\N	YOYOTA100
117	Pending	12	Admin	undefined	2024-03-26 19:08:52.248901+00	2024-03-26 19:08:52.248901+00	40	Project 50	\N	\N	PRJ50
118	Pending	13	Admin	undefined	2024-03-26 19:08:52.29477+00	2024-03-26 19:08:52.29477+00	100	Project 50	\N	\N	PRJ50
119	Pending	12	Admin	undefined	2024-03-26 19:17:06.871967+00	2024-03-26 19:17:06.871967+00	20	Project 50	\N	\N	PRJ50
120	Pending	12	Admin	2024-03-01	2024-03-26 19:18:15.216429+00	2024-03-26 19:18:15.216429+00	100	Project 101	\N	\N	PRJ101
121	Pending	13	Admin	2024-03-01	2024-03-26 19:18:15.262571+00	2024-03-26 19:18:15.262571+00	80	Project 101	\N	\N	PRJ101
122	Pending	14	Admin	2024-03-01	2024-03-26 19:18:15.270855+00	2024-03-26 19:18:15.270855+00	40	Project 101	\N	\N	PRJ101
123	Pending	12	Admin	2024-03-01	2024-03-26 19:30:53.82697+00	2024-03-26 19:30:53.82697+00	50	Project 102	\N	\N	PRJ102
124	Pending	13	Admin	2024-03-01	2024-03-26 19:30:53.865682+00	2024-03-26 19:30:53.865682+00	20	Project 102	\N	\N	PRJ102
125	Pending	14	Admin	2024-03-01	2024-03-26 19:30:53.894263+00	2024-03-26 19:30:53.894263+00	40	Project 102	\N	\N	PRJ102
126	Pending	12	Admin	2024-03-06	2024-03-26 19:34:02.466224+00	2024-03-26 19:34:02.466224+00	20	Project 104	\N	\N	PRJ104
127	Pending	13	Admin	2024-03-06	2024-03-26 19:34:02.524494+00	2024-03-26 19:34:02.524494+00	30	Project 104	\N	\N	PRJ104
128	Pending	14	Admin	2024-03-06	2024-03-26 19:34:02.531291+00	2024-03-26 19:34:02.531291+00	60	Project 104	\N	\N	PRJ104
129	Pending	12	Admin	2024-03-01	2024-03-26 19:36:33.944901+00	2024-03-26 19:36:33.944901+00	20	Project 105	\N	\N	PRJ105
130	Pending	13	Admin	2024-03-01	2024-03-26 19:36:33.987084+00	2024-03-26 19:36:33.987084+00	50	Project 105	\N	\N	PRJ105
131	Pending	14	Admin	2024-03-01	2024-03-26 19:36:34.003929+00	2024-03-26 19:36:34.003929+00	60	Project 105	\N	\N	PRJ105
132	Pending	12	Admin	2024-04-01	2024-03-26 19:44:35.423746+00	2024-03-26 19:44:35.423746+00	50	Project 110	\N	\N	PRJ110
133	Pending	13	Admin	2024-04-01	2024-03-26 19:44:35.465587+00	2024-03-26 19:44:35.465587+00	20	Project 110	\N	\N	PRJ110
134	Pending	14	Admin	2024-04-01	2024-03-26 19:44:35.49235+00	2024-03-26 19:44:35.49235+00	60	Project 110	\N	\N	PRJ110
135	Pending	12	Admin	2024-04-01	2024-03-26 19:55:02.076964+00	2024-03-26 19:55:02.076964+00	60	Project 111	\N	\N	PRJ111
136	Pending	13	Admin	2024-04-01	2024-03-26 19:55:02.135672+00	2024-03-26 19:55:02.135672+00	10	Project 111	\N	\N	PRJ111
137	Pending	14	Admin	2024-04-01	2024-03-26 19:55:02.141878+00	2024-03-26 19:55:02.141878+00	10	Project 111	\N	\N	PRJ111
138	Pending	12	Admin	2024-04-05	2024-03-26 20:01:00.684423+00	2024-03-26 20:01:00.684423+00	20	Project 114	\N	\N	PRJ114
139	Pending	13	Admin	2024-04-05	2024-03-26 20:01:00.731406+00	2024-03-26 20:01:00.731406+00	50	Project 114	\N	\N	PRJ114
140	Pending	14	Admin	2024-04-05	2024-03-26 20:01:15.816592+00	2024-03-26 20:01:15.816592+00	30	Project 114	\N	\N	PRJ114
141	Pending	13	Admin	2024-04-05	2024-03-26 20:03:00.376804+00	2024-03-26 20:03:00.376804+00	40	Project 114	\N	\N	PRJ114
142	Pending	12	Admin	2024-03-01	2024-03-26 20:43:03.857886+00	2024-03-26 20:43:03.857886+00	110	Project 121	\N	\N	PRJ121
143	Pending	12	Admin	2024-03-01	2024-03-26 20:55:37.02299+00	2024-03-26 20:55:37.02299+00	80	Project 122	\N	\N	PRJ122
144	Pending	13	Admin	2024-03-01	2024-03-26 20:55:37.050934+00	2024-03-26 20:55:37.050934+00	30	Project 122	\N	\N	PRJ122
145	Pending	12	Admin	2024-04-01	2024-03-26 20:57:05.905062+00	2024-03-26 20:57:05.905062+00	50	zxz	\N	\N	PRJ 10
146	Pending	13	Admin	2024-04-01	2024-03-26 20:57:06.101961+00	2024-03-26 20:57:06.101961+00	60	zxz	\N	\N	PRJ 10
147	Pending	12	Admin	2024-04-01	2024-03-26 20:58:34.480615+00	2024-03-26 20:58:34.480615+00	60	Tata	\N	\N	12121
148	Pending	13	Admin	2024-04-01	2024-03-26 20:58:34.676521+00	2024-03-26 20:58:34.676521+00	50	Tata	\N	\N	12121
149	Pending	12	Admin	2024-04-02	2024-03-26 21:08:12.859747+00	2024-03-26 21:08:12.859747+00	120	Project150	\N	\N	PRJ150
150	Pending	13	Admin	2024-03-01	2024-03-26 21:11:24.64786+00	2024-03-26 21:11:24.64786+00	60	Project 106	\N	\N	PRJ106
151	Pending	12	Admin	2024-03-01	2024-03-26 21:11:24.654645+00	2024-03-26 21:11:24.654645+00	50	Project 106	\N	\N	PRJ106
152	Pending	12	Admin	2024-03-01	2024-03-26 21:13:57.638124+00	2024-03-26 21:13:57.638124+00	10	Project 107	\N	\N	PRJ107
153	Pending	13	Admin	2024-03-01	2024-03-26 21:13:57.818715+00	2024-03-26 21:13:57.818715+00	20	Project 107	\N	\N	PRJ107
154	Pending	14	Admin	2024-03-01	2024-03-26 21:14:13.297787+00	2024-03-26 21:14:13.297787+00	70	Project 107	\N	\N	PRJ107
155	Pending	12	Admin	2024-03-20	2024-03-26 21:16:07.354104+00	2024-03-26 21:16:07.354104+00	0	MRF	\N	\N	MRF6600
156	Pending	12	Admin	2024-03-01	2024-03-26 21:28:37.744088+00	2024-03-26 21:28:37.744088+00	80	Project160	\N	\N	PRJ160
158	Pending	14	Admin	2024-03-01	2024-03-26 21:29:09.562353+00	2024-03-26 21:29:09.562353+00	80	Project 170	\N	\N	PRJ 170
157	Success	12	Admin	2024-03-01	2024-03-26 21:29:08.847181+00	2024-03-26 21:29:08.847181+00	20	Project 170	admin	\N	PRJ 170
159	Pending	13	Admin	2024-03-01	2024-03-26 21:49:34.631514+00	2024-03-26 21:49:34.631514+00	20	Project160	\N	\N	PRJ160
160	Pending	12	Admin	2024-04-01	2024-03-27 04:59:05.326182+00	2024-03-27 04:59:05.326182+00	30	Tata New	\N	\N	Tata002
161	Pending	13	Admin	2024-04-01	2024-03-27 04:59:05.778884+00	2024-03-27 04:59:05.778884+00	70	Tata New	\N	\N	Tata002
162	Pending	12	Admin	2024-04-01	2024-03-27 13:12:06.76288+00	2024-03-27 13:12:06.76288+00	50	MRF	\N	\N	MRF001
163	Pending	14	Admin	2024-04-01	2024-03-27 13:12:06.938941+00	2024-03-27 13:12:06.938941+00	30	MRF	\N	\N	MRF001
164	Pending	13	Admin	2024-04-01	2024-03-27 13:12:06.943321+00	2024-03-27 13:12:06.943321+00	40	MRF	\N	\N	MRF001
165	Pending	12	Admin	2024-03-01	2024-03-27 13:21:20.00068+00	2024-03-27 13:21:20.00068+00	100	Project 50	\N	\N	PRJ50
166	Pending	12	Admin	2024-03-26	2024-03-27 15:18:39.193655+00	2024-03-27 15:18:39.193655+00	100	electro	\N	\N	ELECTRO 2024
167	Pending	13	Admin	2024-03-26	2024-03-27 15:18:39.326657+00	2024-03-27 15:18:39.326657+00	100	electro	\N	\N	ELECTRO 2024
168	Pending	14	Admin	2024-03-26	2024-03-27 15:18:39.330555+00	2024-03-27 15:18:39.330555+00	250	electro	\N	\N	ELECTRO 2024
67	Success	12	Test Admin	2024-03-01	2024-03-23 11:09:13.236243+00	2024-03-23 11:09:13.236243+00	50	MRF	harris123	\N	MRF6600
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, flag, created_by, created_date, modified_date) FROM stdin;
\.


--
-- Name: applicant_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicant_list_id_seq', 71, true);


--
-- Name: applicant_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicant_status_id_seq', 164, true);


--
-- Name: attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attendance_id_seq', 286, true);


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documents_id_seq', 17, true);


--
-- Name: employ_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employ_id_seq', 31, true);


--
-- Name: main_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_payments_id_seq', 57, true);


--
-- Name: main_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_projects_id_seq', 51, true);


--
-- Name: notify_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notify_id_seq', 2, true);


--
-- Name: office_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.office_id_seq', 14, true);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 36, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 185, true);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tasks_id_seq', 168, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: applicant_list applicant_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_list
    ADD CONSTRAINT applicant_list_pkey PRIMARY KEY (id);


--
-- Name: applicant_status applicant_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_status
    ADD CONSTRAINT applicant_status_pkey PRIMARY KEY (id);


--
-- Name: attendance attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: employ employ_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employ
    ADD CONSTRAINT employ_pkey PRIMARY KEY (id);


--
-- Name: main_payments main_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_payments
    ADD CONSTRAINT main_payments_pkey PRIMARY KEY (id);


--
-- Name: main_projects main_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_projects
    ADD CONSTRAINT main_projects_pkey PRIMARY KEY (id);


--
-- Name: notify notify_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notify
    ADD CONSTRAINT notify_pkey PRIMARY KEY (id);


--
-- Name: office office_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office
    ADD CONSTRAINT office_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: main_payments unique_app_f_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_payments
    ADD CONSTRAINT unique_app_f_id UNIQUE (app_f_id);


--
-- Name: attendance unique_employee_date_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT unique_employee_date_constraint UNIQUE (emp_f_id, date);


--
-- Name: attendance unique_user_attendance_date; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT unique_user_attendance_date UNIQUE (emp_f_id, date);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: applicant_list applicant_list_office_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_list
    ADD CONSTRAINT applicant_list_office_f_id_fkey FOREIGN KEY (office_f_id) REFERENCES public.office(id);


--
-- Name: applicant_list applicant_list_project_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_list
    ADD CONSTRAINT applicant_list_project_f_id_fkey FOREIGN KEY (project_f_id) REFERENCES public.projects(id);


--
-- Name: applicant_status applicant_status_applicant_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_status
    ADD CONSTRAINT applicant_status_applicant_f_id_fkey FOREIGN KEY (applicant_f_id) REFERENCES public.applicant_list(id);


--
-- Name: applicant_status applicant_status_office_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_status
    ADD CONSTRAINT applicant_status_office_f_id_fkey FOREIGN KEY (office_f_id) REFERENCES public.office(id);


--
-- Name: applicant_status applicant_status_project_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_status
    ADD CONSTRAINT applicant_status_project_f_id_fkey FOREIGN KEY (project_f_id) REFERENCES public.projects(id);


--
-- Name: attendance attendance_emp_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_emp_f_id_fkey FOREIGN KEY (emp_f_id) REFERENCES public.employ(id);


--
-- Name: attendance attendance_office_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_office_f_id_fkey FOREIGN KEY (office_f_id) REFERENCES public.office(id);


--
-- Name: documents documents_applicant_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_applicant_f_id_fkey FOREIGN KEY (applicant_f_id) REFERENCES public.applicant_list(id);


--
-- Name: documents documents_office_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_office_f_id_fkey FOREIGN KEY (office_f_id) REFERENCES public.office(id);


--
-- Name: employ employ_office_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employ
    ADD CONSTRAINT employ_office_f_id_fkey FOREIGN KEY (office_f_id) REFERENCES public.office(id);


--
-- Name: main_payments main_payments_app_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_payments
    ADD CONSTRAINT main_payments_app_f_id_fkey FOREIGN KEY (app_f_id) REFERENCES public.applicant_list(id);


--
-- Name: main_payments main_payments_emp_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_payments
    ADD CONSTRAINT main_payments_emp_f_id_fkey FOREIGN KEY (emp_f_id) REFERENCES public.employ(id);


--
-- Name: main_payments main_payments_office_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_payments
    ADD CONSTRAINT main_payments_office_f_id_fkey FOREIGN KEY (office_f_id) REFERENCES public.office(id);


--
-- Name: main_payments main_payments_project_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_payments
    ADD CONSTRAINT main_payments_project_f_id_fkey FOREIGN KEY (project_f_id) REFERENCES public.projects(id);


--
-- Name: notify notify_app_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notify
    ADD CONSTRAINT notify_app_f_id_fkey FOREIGN KEY (app_f_id) REFERENCES public.applicant_list(id);


--
-- Name: notify notify_emp_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notify
    ADD CONSTRAINT notify_emp_f_id_fkey FOREIGN KEY (emp_f_id) REFERENCES public.employ(id);


--
-- Name: notify notify_office_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notify
    ADD CONSTRAINT notify_office_f_id_fkey FOREIGN KEY (office_f_id) REFERENCES public.office(id);


--
-- Name: notify notify_project_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notify
    ADD CONSTRAINT notify_project_f_id_fkey FOREIGN KEY (project_f_id) REFERENCES public.projects(id);


--
-- Name: payments payments_app_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_app_f_id_fkey FOREIGN KEY (app_f_id) REFERENCES public.applicant_list(id);


--
-- Name: payments payments_emp_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_emp_f_id_fkey FOREIGN KEY (emp_f_id) REFERENCES public.employ(id);


--
-- Name: payments payments_office_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_office_f_id_fkey FOREIGN KEY (office_f_id) REFERENCES public.office(id);


--
-- Name: payments payments_project_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_project_f_id_fkey FOREIGN KEY (project_f_id) REFERENCES public.projects(id);


--
-- Name: projects projects_office_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_office_f_id_fkey FOREIGN KEY (office_f_id) REFERENCES public.office(id);


--
-- Name: tasks tasks_mpid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_mpid_fkey FOREIGN KEY (mpid) REFERENCES public.main_projects(id);


--
-- Name: tasks tasks_office_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_office_f_id_fkey FOREIGN KEY (office_f_id) REFERENCES public.office(id);


--
-- PostgreSQL database dump complete
--

