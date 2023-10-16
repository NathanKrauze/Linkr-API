--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
-- Name: hashtags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    "hashtagText" text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    "idPost" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    "postUrl" text NOT NULL,
    "postText" text,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "idUser" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: trends; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trends (
    id integer NOT NULL,
    "idPost" integer NOT NULL,
    "idHashtag" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: trends_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trends_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trends_id_seq OWNED BY public.trends.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "pictureUrl" text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: trends id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trends ALTER COLUMN id SET DEFAULT nextval('public.trends_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hashtags VALUES (1, 'teste', '2023-10-14 15:38:00.304592');
INSERT INTO public.hashtags VALUES (5, 'whatsapp', '2023-10-14 15:48:10.356006');
INSERT INTO public.hashtags VALUES (6, 'app', '2023-10-14 15:49:33.336568');
INSERT INTO public.hashtags VALUES (7, 'teste2', '2023-10-16 16:00:57.540671');
INSERT INTO public.hashtags VALUES (8, 'teste5', '2023-10-16 16:19:37.506584');


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (1, 1, 'https://web.whatsapp.com/', 'whatsapp #teste text #whatsapp', '2023-10-14 15:30:41.706545');
INSERT INTO public.posts VALUES (2, 1, 'https://web.whatsapp.com/', 'whatsapp #teste text #whatsapp', '2023-10-14 15:38:00.284126');
INSERT INTO public.posts VALUES (3, 1, 'https://web.whatsapp.com/', 'whatsapp #teste text #whatsapp', '2023-10-14 15:41:23.334861');
INSERT INTO public.posts VALUES (4, 1, 'https://web.whatsapp.com/', 'whatsapp #teste text #whatsapp', '2023-10-14 15:44:25.538316');
INSERT INTO public.posts VALUES (5, 1, 'https://web.whatsapp.com/', 'whatsapp #teste text #whatsapp', '2023-10-14 15:46:35.129186');
INSERT INTO public.posts VALUES (6, 1, 'https://web.whatsapp.com/', 'whatsapp #teste text #whatsapp', '2023-10-14 15:48:10.285404');
INSERT INTO public.posts VALUES (7, 1, 'https://web.whatsapp.com/', 'whatsapp #teste text #app', '2023-10-14 15:49:33.304949');
INSERT INTO public.posts VALUES (8, 2, 'http://localhost:3000/timeline', 'teste #teste3', '2023-10-16 16:00:57.510251');
INSERT INTO public.posts VALUES (9, 2, 'http://localhost:3000/timeline', 'teste #teste5', '2023-10-16 16:19:37.492953');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (4, '896f9d3c-40b6-4d0b-85ef-4bb185b12a47', 1, '2023-10-10 23:28:50.859085');
INSERT INTO public.sessions VALUES (5, '874d3c99-66db-4db5-88c1-844edfb16f18', 2, '2023-10-11 15:32:45.738838');
INSERT INTO public.sessions VALUES (6, '94804575-74bc-40e8-a680-f00a9fb38bae', 2, '2023-10-11 15:37:47.385307');
INSERT INTO public.sessions VALUES (7, 'a9b1e5ae-2fbc-403e-b7ca-bf5ad1f9b8ec', 2, '2023-10-11 15:47:13.904088');
INSERT INTO public.sessions VALUES (8, '3aee06a1-d44b-4208-9646-4983e1a51936', 2, '2023-10-11 19:10:35.822589');
INSERT INTO public.sessions VALUES (9, '621e1045-5c9a-4364-9218-a679ab175c3b', 2, '2023-10-14 18:39:20.15367');
INSERT INTO public.sessions VALUES (10, '5f5744c1-0ce8-4517-b0d4-a63fc63f88e5', 2, '2023-10-14 19:41:26.245638');
INSERT INTO public.sessions VALUES (11, 'e3c08131-0f62-4fed-aa66-252bd2a015a7', 2, '2023-10-16 14:57:09.02826');


--
-- Data for Name: trends; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trends VALUES (1, 6, 1, '2023-10-14 15:48:10.335107');
INSERT INTO public.trends VALUES (2, 6, 5, '2023-10-14 15:48:10.35956');
INSERT INTO public.trends VALUES (3, 7, 1, '2023-10-14 15:49:33.32133');
INSERT INTO public.trends VALUES (4, 7, 6, '2023-10-14 15:49:33.340447');
INSERT INTO public.trends VALUES (5, 8, 7, '2023-10-16 16:00:57.547786');
INSERT INTO public.trends VALUES (6, 9, 8, '2023-10-16 16:19:37.509265');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Iguana61', 'iguana@driven.com', '$2b$10$Of7QbS.3TmrgIJ16hwUhCur9dCSVgp1KjtRlMKgCDC2XG9wyKIYFy', 'https://picture1.com', '2023-10-10 23:19:31.662349');
INSERT INTO public.users VALUES (2, 'henrique1', 'henrique@driven.com', '$2b$10$wnAozzBXEYVlnsdWHIC.nuAELxENLjSWQMBte71RR0W7HhJ6IEFcK', 'https://w7.pngwing.com/pngs/211/502/png-transparent-lionel-messi-art-lionel-messi-wpap-desktop-lionel-messi-face-poster-head-thumbnail.png', '2023-10-11 15:31:10.182612');
INSERT INTO public.users VALUES (3, 'henrique1', 'henrique2@driven.com', '$2b$10$ZO4rrPbTzmSdFgul/sRFSe1aHzBWBWeWunCQqUjvPkwtGYGGANLaS', 'https://w7.pngwing.com/pngs/211/502/png-transparent-lionel-messi-art-lionel-messi-wpap-desktop-lionel-messi-face-poster-head-thumbnail.png', '2023-10-11 15:49:32.776925');


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 8, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 9, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 11, true);


--
-- Name: trends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trends_id_seq', 6, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: hashtags hashtags_hashtagText_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT "hashtags_hashtagText_key" UNIQUE ("hashtagText");


--
-- Name: hashtags hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pkey PRIMARY KEY (id);


--
-- Name: likes likes_idUser_idPost_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_idUser_idPost_key" UNIQUE ("idUser", "idPost");


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: trends trends_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trends
    ADD CONSTRAINT trends_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: likes likes_idPost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_idPost_fkey" FOREIGN KEY ("idPost") REFERENCES public.posts(id);


--
-- Name: likes likes_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public.users(id);


--
-- Name: posts posts_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public.users(id);


--
-- Name: sessions sessions_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public.users(id);


--
-- Name: trends trends_idHashtag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trends
    ADD CONSTRAINT "trends_idHashtag_fkey" FOREIGN KEY ("idHashtag") REFERENCES public.hashtags(id);


--
-- Name: trends trends_idPost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trends
    ADD CONSTRAINT "trends_idPost_fkey" FOREIGN KEY ("idPost") REFERENCES public.posts(id);


--
-- PostgreSQL database dump complete
--

