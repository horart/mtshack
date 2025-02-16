--
-- PostgreSQL database dump
--

-- Dumped from database version 17.3 (Debian 17.3-1.pgdg120+1)
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-16 08:44:06 UTC

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
-- TOC entry 222 (class 1259 OID 16413)
-- Name: bills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bills (
    id integer NOT NULL,
    user_id integer NOT NULL,
    sum double precision NOT NULL,
    month date NOT NULL
);


ALTER TABLE public.bills OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16412)
-- Name: bills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bills_id_seq OWNER TO postgres;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 221
-- Name: bills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bills_id_seq OWNED BY public.bills.id;


--
-- TOC entry 218 (class 1259 OID 16390)
-- Name: houses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.houses (
    id integer NOT NULL,
    address character varying NOT NULL,
    district integer NOT NULL,
    flat_count integer NOT NULL
);


ALTER TABLE public.houses OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16389)
-- Name: houses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.houses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.houses_id_seq OWNER TO postgres;

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 217
-- Name: houses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.houses_id_seq OWNED BY public.houses.id;


--
-- TOC entry 220 (class 1259 OID 16399)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying NOT NULL,
    age integer NOT NULL,
    house_id integer NOT NULL,
    flat_number integer NOT NULL,
    hia integer[]
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16398)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3222 (class 2604 OID 16416)
-- Name: bills id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills ALTER COLUMN id SET DEFAULT nextval('public.bills_id_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 16393)
-- Name: houses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.houses ALTER COLUMN id SET DEFAULT nextval('public.houses_id_seq'::regclass);


--
-- TOC entry 3221 (class 2604 OID 16402)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3381 (class 0 OID 16413)
-- Dependencies: 222
-- Data for Name: bills; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bills (id, user_id, sum, month) VALUES (1, 1, 500, '2025-02-01');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (2, 1, 0, '2023-03-29');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (3, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (4, 1, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (5, 1, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (6, 1, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (7, 1, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (8, 1, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (9, 1, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (10, 1, 0, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (11, 1, 0, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (12, 1, 0, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (13, 1, 0, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (14, 1, 0, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (15, 1, 0, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (16, 1, 0, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (17, 1, 0, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (18, 1, 0, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (19, 1, 0, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (20, 1, 0, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (21, 1, 0, '2024-10-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (22, 1, 0, '2024-11-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (23, 1, 0, '2024-12-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (24, 1, 0, '2025-01-17');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (25, 1, 0, '2025-02-16');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (26, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (27, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (28, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (29, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (30, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (31, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (32, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (33, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (34, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (35, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (36, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (37, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (38, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (39, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (40, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (41, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (42, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (43, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (44, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (45, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (46, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (47, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (48, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (49, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (50, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (51, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (52, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (53, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (54, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (55, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (56, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (57, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (58, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (59, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (60, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (61, 7, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (62, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (63, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (64, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (65, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (66, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (67, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (68, 7, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (69, 8, 0, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (70, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (71, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (72, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (73, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (74, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (75, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (76, 7, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (77, 8, 0, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (78, 9, 0, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (79, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (80, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (81, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (82, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (83, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (84, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (85, 7, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (86, 8, 0, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (87, 9, 0, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (88, 10, 0, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (89, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (90, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (91, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (92, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (93, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (94, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (95, 7, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (96, 8, 0, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (97, 9, 0, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (98, 10, 0, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (99, 11, 0, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (100, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (101, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (102, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (103, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (104, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (105, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (106, 7, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (107, 8, 0, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (108, 9, 0, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (109, 10, 0, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (110, 11, 0, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (111, 12, 0, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (112, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (113, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (114, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (115, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (116, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (117, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (118, 7, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (119, 8, 0, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (120, 9, 0, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (121, 10, 0, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (122, 11, 0, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (123, 12, 0, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (124, 13, 0, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (125, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (126, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (127, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (128, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (129, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (130, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (131, 7, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (132, 8, 0, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (133, 9, 0, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (134, 10, 0, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (135, 11, 0, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (136, 12, 0, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (137, 13, 0, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (138, 14, 0, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (139, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (140, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (141, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (142, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (143, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (144, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (145, 7, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (146, 8, 0, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (147, 9, 0, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (148, 10, 0, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (149, 11, 0, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (150, 12, 0, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (151, 13, 0, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (152, 14, 0, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (153, 15, 0, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (154, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (155, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (156, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (157, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (158, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (159, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (160, 7, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (161, 8, 0, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (162, 9, 0, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (163, 10, 0, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (164, 11, 0, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (165, 12, 0, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (166, 13, 0, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (167, 14, 0, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (168, 15, 0, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (169, 16, 0, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (170, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (171, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (172, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (173, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (174, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (175, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (176, 7, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (177, 8, 0, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (178, 9, 0, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (179, 10, 0, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (180, 11, 0, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (181, 12, 0, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (182, 13, 0, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (183, 14, 0, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (184, 15, 0, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (185, 16, 0, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (186, 17, 0, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (187, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (188, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (189, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (190, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (191, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (192, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (193, 7, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (194, 8, 0, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (195, 9, 0, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (196, 10, 0, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (197, 11, 0, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (198, 12, 0, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (199, 13, 0, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (200, 14, 0, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (201, 15, 0, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (202, 16, 0, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (203, 17, 0, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (204, 18, 0, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (205, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (206, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (207, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (208, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (209, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (210, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (211, 7, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (212, 8, 0, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (213, 9, 0, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (214, 10, 0, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (215, 11, 0, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (216, 12, 0, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (217, 13, 0, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (218, 14, 0, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (219, 15, 0, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (220, 16, 0, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (221, 17, 0, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (222, 18, 0, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (223, 19, 0, '2024-10-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (224, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (225, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (226, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (227, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (228, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (229, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (230, 7, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (231, 8, 0, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (232, 9, 0, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (233, 10, 0, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (234, 11, 0, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (235, 12, 0, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (236, 13, 0, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (237, 14, 0, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (238, 15, 0, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (239, 16, 0, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (240, 17, 0, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (241, 18, 0, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (242, 19, 0, '2024-10-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (243, 20, 0, '2024-11-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (244, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (245, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (246, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (247, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (248, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (249, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (250, 7, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (251, 8, 0, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (252, 9, 0, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (253, 10, 0, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (254, 11, 0, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (255, 12, 0, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (256, 13, 0, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (257, 14, 0, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (258, 15, 0, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (259, 16, 0, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (260, 17, 0, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (261, 18, 0, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (262, 19, 0, '2024-10-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (263, 20, 0, '2024-11-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (264, 21, 0, '2024-12-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (265, 1, 0, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (266, 2, 0, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (267, 3, 0, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (268, 4, 0, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (269, 5, 0, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (270, 6, 0, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (271, 7, 0, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (272, 8, 0, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (273, 9, 0, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (274, 10, 0, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (275, 11, 0, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (276, 12, 0, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (277, 13, 0, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (278, 14, 0, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (279, 15, 0, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (280, 16, 0, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (281, 17, 0, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (282, 18, 0, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (283, 19, 0, '2024-10-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (284, 20, 0, '2024-11-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (285, 21, 0, '2024-12-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (286, 22, 0, '2025-01-17');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (287, 2, 3809.8, '2023-03-29');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (288, 2, 3883.6, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (289, 2, 4229.25, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (290, 2, 3569.9, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (291, 2, 2568.4, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (292, 2, 2704.75, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (293, 2, 2549.3, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (294, 2, 2737.6, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (295, 2, 4566.85, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (296, 2, 4294.2, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (297, 2, 4192.5, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (298, 2, 4492.9, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (299, 2, 4076.3, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (300, 2, 4574.15, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (301, 2, 4619.8, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (302, 2, 3913.45, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (303, 2, 2727.6, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (304, 2, 3043.25, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (305, 2, 3222.9, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (306, 2, 3324.4, '2024-10-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (307, 2, 4371.95, '2024-11-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (308, 2, 4843.6, '2024-12-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (309, 2, 4749.2, '2025-01-17');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (310, 2, 4984.7, '2025-02-16');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (311, 3, 4172.8, '2023-03-29');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (312, 3, 4589.6, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (313, 3, 4389.25, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (314, 3, 3653.9, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (315, 3, 2553.4, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (316, 3, 2899.75, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (317, 3, 3067.3, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (318, 3, 3201.6, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (319, 3, 3989.8500000000004, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (320, 3, 4361.2, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (321, 3, 4134.5, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (322, 3, 4121.9, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (323, 3, 4513.3, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (324, 3, 4725.15, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (325, 3, 4199.8, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (326, 3, 3890.45, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (327, 3, 2794.6, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (328, 3, 2867.25, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (329, 3, 3606.9, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (330, 3, 3673.4, '2024-10-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (331, 3, 3913.95, '2024-11-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (332, 3, 4861.6, '2024-12-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (333, 3, 4392.2, '2025-01-17');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (334, 3, 4256.7, '2025-02-16');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (335, 4, 4252.8, '2023-03-29');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (336, 4, 3939.6, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (337, 4, 3733.25, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (338, 4, 3634.9, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (339, 4, 2999.4, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (340, 4, 2418.75, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (341, 4, 2856.3, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (342, 4, 2703.6, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (343, 4, 3899.8500000000004, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (344, 4, 4099.2, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (345, 4, 4234.5, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (346, 4, 4415.9, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (347, 4, 4207.3, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (348, 4, 4660.15, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (349, 4, 4446.8, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (350, 4, 4224.45, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (351, 4, 3472.6, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (352, 4, 3377.25, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (353, 4, 3484.9, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (354, 4, 3585.4, '2024-10-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (355, 4, 4728.95, '2024-11-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (356, 4, 3973.6000000000004, '2024-12-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (357, 4, 4276.2, '2025-01-17');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (358, 4, 4485.7, '2025-02-16');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (359, 5, 4515.8, '2023-03-29');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (360, 5, 4428.6, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (361, 5, 3681.25, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (362, 5, 4029.9, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (363, 5, 2960.4, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (364, 5, 3138.75, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (365, 5, 3294.3, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (366, 5, 2618.6, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (367, 5, 4284.85, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (368, 5, 4600.2, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (369, 5, 4155.5, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (370, 5, 3860.8999999999996, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (371, 5, 4219.3, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (372, 5, 4799.15, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (373, 5, 3835.8, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (374, 5, 3976.45, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (375, 5, 2613.6, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (376, 5, 2877.25, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (377, 5, 3017.9, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (378, 5, 3371.4, '2024-10-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (379, 5, 4219.95, '2024-11-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (380, 5, 4725.6, '2024-12-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (381, 5, 4567.2, '2025-01-17');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (382, 5, 4086.7, '2025-02-16');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (383, 6, 3782.8, '2023-03-29');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (384, 6, 3711.6, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (385, 6, 3927.25, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (386, 6, 3865.9, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (387, 6, 2781.4, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (388, 6, 2726.75, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (389, 6, 2799.3, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (390, 6, 3022.6, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (391, 6, 4420.85, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (392, 6, 4662.2, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (393, 6, 4158.5, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (394, 6, 4726.9, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (395, 6, 4204.3, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (396, 6, 3939.1499999999996, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (397, 6, 4751.8, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (398, 6, 3902.45, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (399, 6, 3162.6, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (400, 6, 3414.25, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (401, 6, 3094.9, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (402, 6, 3598.4, '2024-10-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (403, 6, 3949.95, '2024-11-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (404, 6, 4105.6, '2024-12-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (405, 6, 4787.2, '2025-01-17');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (406, 6, 4657.7, '2025-02-16');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (407, 7, 3745.8, '2023-03-29');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (408, 7, 4215.6, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (409, 7, 4106.25, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (410, 7, 3437.9, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (411, 7, 2655.4, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (412, 7, 2501.75, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (413, 7, 3000.3, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (414, 7, 3360.6, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (415, 7, 4093.8500000000004, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (416, 7, 3812.2, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (417, 7, 4647.5, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (418, 7, 4056.8999999999996, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (419, 7, 4168.3, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (420, 7, 4138.15, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (421, 7, 4505.8, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (422, 7, 4308.45, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (423, 7, 2883.6, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (424, 7, 2818.25, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (425, 7, 3597.9, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (426, 7, 3154.4, '2024-10-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (427, 7, 4630.95, '2024-11-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (428, 7, 4457.6, '2024-12-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (429, 7, 4898.2, '2025-01-17');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (430, 7, 4646.7, '2025-02-16');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (431, 23, 3860.8, '2023-03-29');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (432, 23, 3630.6, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (433, 23, 4173.25, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (434, 23, 3560.9, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (435, 23, 2976.4, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (436, 23, 2435.75, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (437, 23, 3115.3, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (438, 23, 2660.6, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (439, 23, 4227.85, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (440, 23, 4413.2, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (441, 23, 4372.5, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (442, 23, 4575.9, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (443, 23, 4112.3, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (444, 23, 4576.15, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (445, 23, 4413.8, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (446, 23, 4345.45, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (447, 23, 2610.6, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (448, 23, 3080.25, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (449, 23, 2682.9, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (450, 23, 2914.4, '2024-10-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (451, 23, 3856.95, '2024-11-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (452, 23, 4676.6, '2024-12-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (453, 23, 4017.2, '2025-01-17');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (454, 23, 4234.7, '2025-02-16');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (455, 24, 3668.8, '2023-03-29');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (456, 24, 4139.6, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (457, 24, 4350.25, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (458, 24, 3756.9, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (459, 24, 2913.4, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (460, 24, 2454.75, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (461, 24, 2962.3, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (462, 24, 3166.6, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (463, 24, 3704.8500000000004, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (464, 24, 4631.2, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (465, 24, 4382.5, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (466, 24, 4576.9, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (467, 24, 4557.3, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (468, 24, 4499.15, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (469, 24, 3900.8, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (470, 24, 4122.45, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (471, 24, 3466.6, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (472, 24, 3172.25, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (473, 24, 3046.9, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (474, 24, 3377.4, '2024-10-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (475, 24, 3979.95, '2024-11-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (476, 24, 4802.6, '2024-12-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (477, 24, 4120.2, '2025-01-17');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (478, 24, 4122.7, '2025-02-16');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (479, 25, 4153.8, '2023-03-29');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (480, 25, 4060.6, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (481, 25, 4218.25, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (482, 25, 3847.9, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (483, 25, 3149.4, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (484, 25, 3253.75, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (485, 25, 2480.3, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (486, 25, 3374.6, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (487, 25, 3776.8500000000004, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (488, 25, 3926.2, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (489, 25, 3880.5, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (490, 25, 4030.8999999999996, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (491, 25, 4141.3, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (492, 25, 4586.15, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (493, 25, 4363.8, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (494, 25, 4445.45, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (495, 25, 3089.6, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (496, 25, 3450.25, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (497, 25, 2872.9, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (498, 25, 3685.4, '2024-10-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (499, 25, 4076.95, '2024-11-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (500, 25, 4210.6, '2024-12-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (501, 25, 4378.2, '2025-01-17');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (502, 25, 4701.7, '2025-02-16');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (503, 26, 4524.8, '2023-03-29');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (504, 26, 4087.6, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (505, 26, 3892.25, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (506, 26, 3936.9, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (507, 26, 2361.4, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (508, 26, 2730.75, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (509, 26, 2620.3, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (510, 26, 3262.6, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (511, 26, 4363.85, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (512, 26, 3832.2, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (513, 26, 4266.5, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (514, 26, 4349.9, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (515, 26, 4301.3, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (516, 26, 4085.1499999999996, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (517, 26, 4117.8, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (518, 26, 4004.45, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (519, 26, 2911.6, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (520, 26, 3250.25, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (521, 26, 3048.9, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (522, 26, 3181.4, '2024-10-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (523, 26, 4764.95, '2024-11-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (524, 26, 4795.6, '2024-12-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (525, 26, 4024.2, '2025-01-17');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (526, 26, 4598.7, '2025-02-16');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (527, 27, 4155.8, '2023-03-29');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (528, 27, 4328.6, '2023-04-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (529, 27, 3956.25, '2023-05-28');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (530, 27, 3891.9, '2023-06-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (531, 27, 2954.4, '2023-07-27');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (532, 27, 2820.75, '2023-08-26');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (533, 27, 2436.3, '2023-09-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (534, 27, 2615.6, '2023-10-25');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (535, 27, 4259.85, '2023-11-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (536, 27, 4233.2, '2023-12-24');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (537, 27, 4733.5, '2024-01-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (538, 27, 4422.9, '2024-02-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (539, 27, 4640.3, '2024-03-23');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (540, 27, 4455.15, '2024-04-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (541, 27, 4517.8, '2024-05-22');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (542, 27, 3674.45, '2024-06-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (543, 27, 3211.6, '2024-07-21');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (544, 27, 2941.25, '2024-08-20');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (545, 27, 3302.9, '2024-09-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (546, 27, 3371.4, '2024-10-19');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (547, 27, 4523.95, '2024-11-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (548, 27, 4296.6, '2024-12-18');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (549, 27, 4287.2, '2025-01-17');
INSERT INTO public.bills (id, user_id, sum, month) VALUES (550, 27, 4209.7, '2025-02-16');


--
-- TOC entry 3377 (class 0 OID 16390)
-- Dependencies: 218
-- Data for Name: houses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.houses (id, address, district, flat_count) VALUES (5, '', 3, 15);
INSERT INTO public.houses (id, address, district, flat_count) VALUES (6, '', 3, 15);
INSERT INTO public.houses (id, address, district, flat_count) VALUES (7, '', 3, 15);
INSERT INTO public.houses (id, address, district, flat_count) VALUES (8, 'string', 0, 16);
INSERT INTO public.houses (id, address, district, flat_count) VALUES (9, 'string', 0, 16);
INSERT INTO public.houses (id, address, district, flat_count) VALUES (10, 'string', 0, 16);
INSERT INTO public.houses (id, address, district, flat_count) VALUES (11, 'string', 0, 16);
INSERT INTO public.houses (id, address, district, flat_count) VALUES (12, 'string', 0, 16);
INSERT INTO public.houses (id, address, district, flat_count) VALUES (13, 'string', 0, 16);
INSERT INTO public.houses (id, address, district, flat_count) VALUES (14, 'string', 0, 16);
INSERT INTO public.houses (id, address, district, flat_count) VALUES (15, 'string', 0, 16);
INSERT INTO public.houses (id, address, district, flat_count) VALUES (16, 'string', 0, 16);
INSERT INTO public.houses (id, address, district, flat_count) VALUES (17, 'string', 0, 16);


--
-- TOC entry 3379 (class 0 OID 16399)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (1, 'Petr', 1, 5, 69, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (2, 'Egor5', 50, 5, 6, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (3, 'Egor6', 60, 6, 7, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (4, 'Egor7', 70, 7, 8, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (5, 'Egor2', 20, 7, 3, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (6, 'Egor3', 30, 8, 4, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (7, 'Egor4', 40, 9, 5, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (8, 'Egor5', 50, 10, 6, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (9, 'Egor6', 60, 11, 7, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (10, 'Egor7', 70, 12, 8, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (11, 'Egor2', 20, 7, 3, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (12, 'Egor3', 30, 8, 4, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (13, 'Egor4', 40, 9, 5, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (14, 'Egor5', 50, 10, 6, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (15, 'Egor6', 60, 11, 7, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (16, 'Egor7', 70, 12, 8, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (17, 'Egor2', 20, 7, 3, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (18, 'Egor3', 30, 8, 4, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (19, 'Egor4', 40, 9, 5, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (20, 'Egor5', 50, 10, 6, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (21, 'Egor6', 60, 11, 7, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (22, 'Egor7', 70, 12, 8, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (23, 'Lesha10', 80, 5, 3, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (24, 'Lesha11', 88, 6, 3, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (25, 'Lesha12', 96, 7, 3, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (26, 'Lesha13', 104, 8, 3, '{}');
INSERT INTO public.users (id, name, age, house_id, flat_number, hia) VALUES (27, 'Lesha14', 112, 9, 3, '{}');


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 221
-- Name: bills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bills_id_seq', 550, true);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 217
-- Name: houses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.houses_id_seq', 17, true);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 27, true);


--
-- TOC entry 3228 (class 2606 OID 16418)
-- Name: bills bills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 16397)
-- Name: houses houses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.houses
    ADD CONSTRAINT houses_pkey PRIMARY KEY (id);


--
-- TOC entry 3226 (class 2606 OID 16406)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3230 (class 2606 OID 16419)
-- Name: bills bills_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3229 (class 2606 OID 16407)
-- Name: users users_house_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_house_id_fkey FOREIGN KEY (house_id) REFERENCES public.houses(id);


-- Completed on 2025-02-16 08:44:07 UTC

--
-- PostgreSQL database dump complete
--
