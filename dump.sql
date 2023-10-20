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
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    "idPost" integer NOT NULL,
    "textComment" text NOT NULL,
    createdat timestamp without time zone DEFAULT now()
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


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
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


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
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.comments VALUES (1, 2, 10, 'bom dia', '2023-10-18 21:22:29.383085');
INSERT INTO public.comments VALUES (2, 3, 10, 'bom tarde', '2023-10-18 21:23:21.906624');
INSERT INTO public.comments VALUES (3, 4, 10, 'bom tarde', '2023-10-18 21:23:29.609661');
INSERT INTO public.comments VALUES (4, 1, 10, 'bom noite', '2023-10-18 21:23:53.915041');
INSERT INTO public.comments VALUES (5, 2, 11, 'messi is the best', '2023-10-19 13:38:29.922917');
INSERT INTO public.comments VALUES (6, 2, 11, 'messi is the best', '2023-10-19 13:38:37.403019');
INSERT INTO public.comments VALUES (7, 2, 11, 'messi is the best', '2023-10-19 13:38:41.260014');
INSERT INTO public.comments VALUES (8, 4, 8, 'Amaterasu', '2023-10-19 14:54:46.758164');
INSERT INTO public.comments VALUES (9, 2, 11, 'good morning', '2023-10-20 13:29:13.043964');
INSERT INTO public.comments VALUES (10, 2, 11, 'good afternoom', '2023-10-20 13:32:22.276748');
INSERT INTO public.comments VALUES (11, 2, 9, 'ola', '2023-10-20 13:34:48.267229');
INSERT INTO public.comments VALUES (12, 2, 11, 'ola', '2023-10-20 14:28:38.260843');
INSERT INTO public.comments VALUES (13, 2, 8, 'mankeyou sharigan', '2023-10-20 15:57:26.910896');
INSERT INTO public.comments VALUES (14, 2, 11, 'oi', '2023-10-20 16:09:24.607598');
INSERT INTO public.comments VALUES (15, 2, 11, 'oi2', '2023-10-20 16:10:57.522933');
INSERT INTO public.comments VALUES (16, 2, 10, 'good morning', '2023-10-20 16:13:07.124084');
INSERT INTO public.comments VALUES (17, 2, 10, 'jgjhgj', '2023-10-20 16:13:33.063345');
INSERT INTO public.comments VALUES (18, 2, 9, 'oi', '2023-10-20 16:24:51.398017');
INSERT INTO public.comments VALUES (19, 2, 9, 'oi2', '2023-10-20 16:27:31.547963');
INSERT INTO public.comments VALUES (20, 2, 10, 'fkjdhkgjhfkg', '2023-10-20 16:33:36.075816');


--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hashtags VALUES (1, 'teste', '2023-10-14 15:38:00.304592');
INSERT INTO public.hashtags VALUES (5, 'whatsapp', '2023-10-14 15:48:10.356006');
INSERT INTO public.hashtags VALUES (6, 'app', '2023-10-14 15:49:33.336568');
INSERT INTO public.hashtags VALUES (7, 'teste2', '2023-10-16 16:00:57.540671');
INSERT INTO public.hashtags VALUES (8, 'teste5', '2023-10-16 16:19:37.506584');
INSERT INTO public.hashtags VALUES (9, 'duolingo', '2023-10-16 22:31:10.952687');
INSERT INTO public.hashtags VALUES (10, 'learn', '2023-10-16 22:31:10.998191');
INSERT INTO public.hashtags VALUES (11, 'english', '2023-10-16 22:31:10.999769');


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.likes VALUES (4, 2, 11, '2023-10-20 14:04:19.109949');


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
INSERT INTO public.posts VALUES (10, 2, 'https://www.duolingo.com/learn', 'duolingo #duolingo #english teste #learn', '2023-10-16 22:31:10.930516');
INSERT INTO public.posts VALUES (11, 2, 'https://www.duolingo.com/learn', 'duolingo #duolingo', '2023-10-16 22:31:33.752009');


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
INSERT INTO public.sessions VALUES (12, 'a8ad8189-bfb7-48d2-97ca-3279fc08102f', 2, '2023-10-16 17:09:02.685987');
INSERT INTO public.sessions VALUES (13, '9a72c955-9bdd-4722-b71d-daa056aae254', 2, '2023-10-16 22:30:04.515326');
INSERT INTO public.sessions VALUES (14, '5e730e72-ed71-404d-b3cd-54e5be0a7a0e', 2, '2023-10-17 18:54:02.34001');
INSERT INTO public.sessions VALUES (15, '9deeef35-540d-4189-917f-5b0ac944b816', 2, '2023-10-17 19:02:06.268842');
INSERT INTO public.sessions VALUES (16, '14ec0660-ab1d-402b-bee4-db70ee1aa02c', 2, '2023-10-17 20:39:02.972882');
INSERT INTO public.sessions VALUES (17, 'e665d180-4700-414f-af52-13a2ec24a915', 2, '2023-10-17 20:52:49.680146');
INSERT INTO public.sessions VALUES (18, '77c4a4b4-ce04-4729-9b29-809544fe42ab', 2, '2023-10-17 22:02:06.918768');
INSERT INTO public.sessions VALUES (19, 'ff589f37-ea0b-4b1b-9f09-88de094cd167', 2, '2023-10-17 22:04:22.169628');
INSERT INTO public.sessions VALUES (20, '76dc4acc-a500-4a24-8e9d-8e007dfe2b69', 2, '2023-10-17 22:05:02.254874');
INSERT INTO public.sessions VALUES (21, '10bfcee8-13b8-4481-bea4-7d44289f3432', 2, '2023-10-17 22:06:26.837367');
INSERT INTO public.sessions VALUES (22, 'a8261f14-34e0-43b6-8900-ada77426a6db', 2, '2023-10-17 22:10:19.177904');
INSERT INTO public.sessions VALUES (23, 'd7674b8f-e892-4ee8-bd15-4569f2b5ee9e', 2, '2023-10-17 22:31:57.391546');
INSERT INTO public.sessions VALUES (24, '361058e9-4fae-4803-ac1c-7753f537e3ac', 2, '2023-10-17 22:36:32.757267');
INSERT INTO public.sessions VALUES (25, '2d6d5d4c-ac67-4410-85ce-557f4637aa04', 2, '2023-10-17 22:45:05.354226');
INSERT INTO public.sessions VALUES (26, 'd9245b7a-8e74-42cc-b292-134f484f6741', 2, '2023-10-19 15:53:57.331599');
INSERT INTO public.sessions VALUES (27, 'a52ea688-a4cb-426a-aae3-92dd5a8c70eb', 2, '2023-10-19 23:01:38.971906');
INSERT INTO public.sessions VALUES (28, '8b99ddc8-685d-4608-a3a6-767778f6a9d2', 2, '2023-10-20 11:54:13.931985');
INSERT INTO public.sessions VALUES (29, 'a3cd7369-cc59-47b7-9f6d-d2ea03bc4808', 2, '2023-10-20 11:57:30.997118');
INSERT INTO public.sessions VALUES (30, 'a7f1baa3-1c6f-41ed-9ade-84c12fe78b9e', 2, '2023-10-20 13:28:55.507605');
INSERT INTO public.sessions VALUES (31, '01073172-8299-48c1-80a3-50d970d5f89c', 2, '2023-10-20 13:47:53.269435');
INSERT INTO public.sessions VALUES (32, '329614af-952c-4681-940f-071362d463b1', 2, '2023-10-20 15:51:31.400166');
INSERT INTO public.sessions VALUES (33, '6ff8f6f3-0c8d-4e90-be69-cc910ae3108c', 2, '2023-10-20 17:23:47.225123');
INSERT INTO public.sessions VALUES (34, 'ed8965c8-9673-4ad0-a099-4f4bad322672', 2, '2023-10-20 17:29:33.799342');


--
-- Data for Name: trends; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trends VALUES (1, 6, 1, '2023-10-14 15:48:10.335107');
INSERT INTO public.trends VALUES (2, 6, 5, '2023-10-14 15:48:10.35956');
INSERT INTO public.trends VALUES (3, 7, 1, '2023-10-14 15:49:33.32133');
INSERT INTO public.trends VALUES (4, 7, 6, '2023-10-14 15:49:33.340447');
INSERT INTO public.trends VALUES (5, 8, 7, '2023-10-16 16:00:57.547786');
INSERT INTO public.trends VALUES (6, 9, 8, '2023-10-16 16:19:37.509265');
INSERT INTO public.trends VALUES (7, 10, 9, '2023-10-16 22:31:10.961477');
INSERT INTO public.trends VALUES (8, 10, 10, '2023-10-16 22:31:11.000316');
INSERT INTO public.trends VALUES (9, 10, 11, '2023-10-16 22:31:11.003027');
INSERT INTO public.trends VALUES (10, 11, 9, '2023-10-16 22:31:33.760698');
INSERT INTO public.trends VALUES (11, 11, 9, '2023-10-20 17:31:42.297678');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Iguana61', 'iguana@driven.com', '$2b$10$Of7QbS.3TmrgIJ16hwUhCur9dCSVgp1KjtRlMKgCDC2XG9wyKIYFy', 'https://picture1.com', '2023-10-10 23:19:31.662349');
INSERT INTO public.users VALUES (2, 'henrique1', 'henrique@driven.com', '$2b$10$wnAozzBXEYVlnsdWHIC.nuAELxENLjSWQMBte71RR0W7HhJ6IEFcK', 'https://w7.pngwing.com/pngs/211/502/png-transparent-lionel-messi-art-lionel-messi-wpap-desktop-lionel-messi-face-poster-head-thumbnail.png', '2023-10-11 15:31:10.182612');
INSERT INTO public.users VALUES (3, 'henrique1', 'henrique2@driven.com', '$2b$10$ZO4rrPbTzmSdFgul/sRFSe1aHzBWBWeWunCQqUjvPkwtGYGGANLaS', 'https://w7.pngwing.com/pngs/211/502/png-transparent-lionel-messi-art-lionel-messi-wpap-desktop-lionel-messi-face-poster-head-thumbnail.png', '2023-10-11 15:49:32.776925');
INSERT INTO public.users VALUES (4, 'corvo61', 'itachi@driven.com', '$2b$10$VR2jqp7eH1XfULw314SN0e1btA.HoByV1clwbDp/aZOi7hfSmvvJu', 'https://w7.pngwing.com/pngs/211/502/png-transparent-lionel-messi-art-lionel-messi-wpap-desktop-lionel-messi-face-poster-head-thumbnail.png', '2023-10-16 22:17:22.205182');


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 20, true);


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 11, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 4, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 11, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 34, true);


--
-- Name: trends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trends_id_seq', 11, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


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
-- Name: comments comments_idPost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_idPost_fkey" FOREIGN KEY ("idPost") REFERENCES public.posts(id);


--
-- Name: comments comments_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public.users(id);


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

