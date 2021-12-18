--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: Bookmarks; Type: TABLE; Schema: public; Owner: ultimatetab
--

CREATE TABLE public."Bookmarks" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer,
    "SongId" integer
);


ALTER TABLE public."Bookmarks" OWNER TO ultimatetab;

--
-- Name: Bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public."Bookmarks_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Bookmarks_id_seq" OWNER TO ultimatetab;

--
-- Name: Bookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ultimatetab
--

ALTER SEQUENCE public."Bookmarks_id_seq" OWNED BY public."Bookmarks".id;


--
-- Name: Histories; Type: TABLE; Schema: public; Owner: ultimatetab
--

CREATE TABLE public."Histories" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer,
    "SongId" integer
);


ALTER TABLE public."Histories" OWNER TO ultimatetab;

--
-- Name: Histories_id_seq; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public."Histories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Histories_id_seq" OWNER TO ultimatetab;

--
-- Name: Histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ultimatetab
--

ALTER SEQUENCE public."Histories_id_seq" OWNED BY public."Histories".id;


--
-- Name: Ratings; Type: TABLE; Schema: public; Owner: ultimatetab
--

CREATE TABLE public."Ratings" (
    id integer NOT NULL,
    rating integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "SongId" integer,
    "UserId" integer
);


ALTER TABLE public."Ratings" OWNER TO ultimatetab;

--
-- Name: Ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public."Ratings_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ratings_id_seq" OWNER TO ultimatetab;

--
-- Name: Ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ultimatetab
--

ALTER SEQUENCE public."Ratings_id_seq" OWNED BY public."Ratings".id;


--
-- Name: Songs; Type: TABLE; Schema: public; Owner: ultimatetab
--

CREATE TABLE public."Songs" (
    id integer NOT NULL,
    title character varying(255),
    artist character varying(255),
    album character varying(255),
    genre character varying(255),
    year integer,
    tab text,
    lyrics text,
    "youtubeId" character varying(255),
    "albumImage" character varying(255),
    views integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Songs" OWNER TO ultimatetab;

--
-- Name: Songs_id_seq; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public."Songs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Songs_id_seq" OWNER TO ultimatetab;

--
-- Name: Songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ultimatetab
--

ALTER SEQUENCE public."Songs_id_seq" OWNED BY public."Songs".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: ultimatetab
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    email character varying(255),
    username character varying(255),
    password character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer
);


ALTER TABLE public."Users" OWNER TO ultimatetab;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO ultimatetab;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ultimatetab
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: bookmarked_tab_sequence; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public.bookmarked_tab_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookmarked_tab_sequence OWNER TO ultimatetab;

--
-- Name: bookmarkssequence; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public.bookmarkssequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookmarkssequence OWNER TO ultimatetab;

--
-- Name: collection_id_sequence; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public.collection_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_id_sequence OWNER TO ultimatetab;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO ultimatetab;

--
-- Name: tab_collection_sequence; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public.tab_collection_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tab_collection_sequence OWNER TO ultimatetab;

--
-- Name: tab_comment_sequence; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public.tab_comment_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tab_comment_sequence OWNER TO ultimatetab;

--
-- Name: tab_id_sequence; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public.tab_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tab_id_sequence OWNER TO ultimatetab;

--
-- Name: tab_rating_sequence; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public.tab_rating_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tab_rating_sequence OWNER TO ultimatetab;

--
-- Name: tab_user_id_sequence; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public.tab_user_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tab_user_id_sequence OWNER TO ultimatetab;

--
-- Name: tabsequence; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public.tabsequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tabsequence OWNER TO ultimatetab;

--
-- Name: tabusersequence; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public.tabusersequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tabusersequence OWNER TO ultimatetab;

--
-- Name: user_tab_id_sequence; Type: SEQUENCE; Schema: public; Owner: ultimatetab
--

CREATE SEQUENCE public.user_tab_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_tab_id_sequence OWNER TO ultimatetab;

--
-- Name: Bookmarks id; Type: DEFAULT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Bookmarks" ALTER COLUMN id SET DEFAULT nextval('public."Bookmarks_id_seq"'::regclass);


--
-- Name: Histories id; Type: DEFAULT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Histories" ALTER COLUMN id SET DEFAULT nextval('public."Histories_id_seq"'::regclass);


--
-- Name: Ratings id; Type: DEFAULT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Ratings" ALTER COLUMN id SET DEFAULT nextval('public."Ratings_id_seq"'::regclass);


--
-- Name: Songs id; Type: DEFAULT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Songs" ALTER COLUMN id SET DEFAULT nextval('public."Songs_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Data for Name: Bookmarks; Type: TABLE DATA; Schema: public; Owner: ultimatetab
--

COPY public."Bookmarks" (id, "createdAt", "updatedAt", "UserId", "SongId") FROM stdin;
1	2021-12-18 12:40:25.408+01	2021-12-18 12:40:25.408+01	1	1
\.


--
-- Data for Name: Histories; Type: TABLE DATA; Schema: public; Owner: ultimatetab
--

COPY public."Histories" (id, "createdAt", "updatedAt", "UserId", "SongId") FROM stdin;
1	2021-12-18 12:40:25.417+01	2021-12-18 12:40:25.417+01	1	1
2	2021-12-18 12:40:25.418+01	2021-12-18 12:40:25.418+01	1	2
\.


--
-- Data for Name: Ratings; Type: TABLE DATA; Schema: public; Owner: ultimatetab
--

COPY public."Ratings" (id, rating, "createdAt", "updatedAt", "SongId", "UserId") FROM stdin;
1	5	2021-12-18 12:40:25.444+01	2021-12-18 12:40:25.444+01	1	1
2	1	2021-12-18 12:40:25.445+01	2021-12-18 12:40:25.445+01	1	2
3	4	2021-12-18 12:40:25.445+01	2021-12-18 12:40:25.445+01	2	1
4	3	2021-12-18 12:40:25.445+01	2021-12-18 12:40:25.445+01	3	1
\.


--
-- Data for Name: Songs; Type: TABLE DATA; Schema: public; Owner: ultimatetab
--

COPY public."Songs" (id, title, artist, album, genre, year, tab, lyrics, "youtubeId", "albumImage", views, "createdAt", "updatedAt") FROM stdin;
1	Beggin'	Maneskin	Chosen	Rock	2017	[Intro]\nN.C.\nPut your loving hand out, baby\nN.C.\n'Cause I'm beggin'\n \nBm  Bm  Bm  Bm\n \n \n[Chorus]\nBm            G           Em\n   I'm beggin', beggin' you\n                   F#7\nSo put your loving hand out, baby\nBm           G           Em\n  I'm beggin', beggin' you\n                   F#7\nSo put your loving hand out, darlin'\n \n \n[Verse 1]\nBm           G\n  Ridin' high, when I was king\nEm                     F#7\n  I played it hard and fast, 'cause I had everything\nBm             G\n  I walked away, you want me then\nEm                  F#7\n  But easy come and easy go and it would end\n \n    Bm\nSo, any time I need ya, let me go\n      G\nYeah, any time I feed you, get me? No\nEm\nAny time I see you, let me know\n      F#7\nBut I planted that seed, just let me grow\n    Bm\nI'm on my knees while I'm beggin'\n       G                    Em\n'Cause I don't wanna lose you\n    F#7         Bm\nHey yeah, ratatata\n \n \n[Chorus]\n(Bm)       G           Em\nI'm beggin', beggin' you\n                    F#7\nAnd put your loving hand out, baby\nBm           G           Em\n  I'm beggin', beggin' you\n                    F#7\nAnd put your loving hand out, darlin'\n \n \n[Verse 2]\nN.C.          G\nI need you to understand\nEm                F#7\n Tried so hard to be your man\nBm                    G\n  The kind of man you want in the end\n     Em                  F#7\nOnly then can I begin to live again\n \nBm              G\n  An empty shell, I used to be\nEm                 F#7\n  The shadow of my life was hangin' over me\nBm            G\n  A broken man, but I don't know\nEm                     F#7\n  Won't even stand the devil's dance to win my soul\n \n \n[Verse 3]\n        Bm\nWhat we doin'? What we chasin'?\n        G\nWhy the bottom? Why the basement?\n       Em\nWhy we got good shit, don't embrace it?\n        F#7\nWhy the feel for the need to replace me?\n           Bm\nYou on the wrong way track from the good\n                  G\nI want to paint a picture tellin' where we could be at\n       Em\nLike a heart in the best way should\n                 F#7\nYou can give it away, ya had it and you took the bait\n     Bm\nBut I keep walkin' on\n              G\nKeep rockin' dawns\n \nKeep walking forward\n                 Em\nNow the court is yours\n \nKeep browsin' halls\n                     F#7\n'Cause I don't wanna live in a broken home\n \nGirl, I'm beggin'\n \n \n[Chorus]\nBm N.C.\n  Mhh ye-e-e-ah\n            G          Em\nI'm beggin', beggin' you\n                   F#7\nSo put your loving hand out, baby\nBm           G           Em\n  I'm beggin', beggin' you\n                   F#7\nSo put your loving hand out, darlin'\n \n \n[Verse 4]\nN.C.\nI'm fightin' hard\n   G\nTo hold my own\nEm                    F#7\n   Just can't make it all alone\nBm\n   I'm holdin' on\n  G\nI can't fall back\n    Em                  F#7\nI'm just a con about to fade to black\n \n \n[Chorus]\nBm           G           Em\n  I'm beggin', beggin' you\n               F#7\nPut your loving  hand out, baby\nBm           G           Em\n  I'm beggin', beggin' you\n                  F#7\nSo put your loving  hand out, darlin'\n \nBm           G           Em\n  I'm beggin', beggin' you\n                   F#7\nSo put your loving hand out, baby\nBm           G           Em\n  I'm beggin', beggin' you\n                   F#7\nSo put your loving hand out, darlin'\n \n \n[Outro]\nBm           G           Em\n  I'm beggin', beggin' you\n                   F#7\nSo put your loving hand out, baby\nBm           G           Em\n  I'm beggin', beggin' you\n             F#7          Bm\nSo put your loving hand out	Put your loving hand out, baby\n'Cause I'm beggin'\nI'm beggin', beggin' you\nSo, put your loving hand out, baby\nI'm beggin', beggin' you\nSo, put your loving hand out, darling\nRiding high, when I was king\nI played it hard and fast, 'cause I had everything\nI walked away, but you warned me then\nBut easy come, and easy go, and it would end\nSo, any time I bleed, you let me go\nYeah, any time I feed, you get me know\nAny time I seek, you let me know\nBut I plan and see, just let me go\nI'm on my knees while I'm beggin'\n'Cause I don't want to lose you\nHey yeah, ratatata\n'Cause I'm beggin', beggin' you\nAnd put your loving hand out, baby\nI'm beggin', beggin' you\nAnd put your loving hand out, darling\nI need you to understand\nTried so hard to be your man\nThe kind of man you want in the end\nOnly then can I begin to live again\nAn empty shell\nI used to be\nThe shadow of my life was hanging over me\nA broken man\nThat I don't know\nWon't even stand the devil's chance to win my soul\nWhat we doing? What we chasing?\nWhy the bottom? Why the basement?\nWhy we got good shit, don't embrace it?\nWhy the feel for the need to replace me?\nYou're the wrong way track from the good\nI want to paint a picture telling where we could be at\nLike a heart ain't attached the way it should\nYou can give it away, you had, and you took the pay\nBut I keep walking on\nKeep opening doors\nKeep hoping for\nThat the call is yours\nKeep calls on hold\n'Cause I don't wanna live in a broken home\nGirl, I'm begging\nMmm, ye-e-e-ah\nI'm beggin', beggin' you\nSo, put your loving hand out, baby\nI'm beggin', beggin' you\nSo, put your loving hand out, darling\nI'm fighting hard\nTo hold my own\nJust can't make it all alone\nI'm holding on\nI can't fall back\nI'm just a calm 'bout to fade to black\nI'm beggin', beggin' you\nPut your loving hand out, baby\nI'm beggin', beggin' you\nSo, put your loving hand out, darling\nI'm beggin', beggin' you\nSo, put your loving hand out, baby\nI'm beggin', beggin' you\nSo, put your loving hand out, darling\nI'm beggin', beggin' you\nSo, put your loving hand out, baby\nI'm beggin', beggin' you\nSo, put your loving hand out	https://www.youtube.com/embed/InpTewd6uws	https://i.ytimg.com/vi/L0PBcnAaYwA/maxresdefault.jpg	0	2021-12-18 12:40:24.359+01	2021-12-18 12:40:24.359+01
2	Tornado of Souls	Megadeth	Tornado of Souls	thrash metal	1991	[Riff 1]\nNOTE: Slight palm mute during harmonics)\ne|--------------------------|\nB|--------------------------|\nG|----------------------7---|\nD|----------------7---------|\nA|-9------------------------|\nE|-7--7-7-7-7-7-7---7-7---7-|\n      h.h.h.h.h.h.h.h.h.h.h.\n \ne|----------------------------------|\nB|----------------------------------|\nG|--------------------------7-------|\nD|--------------------7-----------7-|\nA|-9-9-9----------------------------|\nE|-7-7-7--7-7-7-7-7-7---7-7---7-7---|\n          h.h.h.h.h.h.h.h.h.h.h.h.h.\n \n[Riff 2]\ne|-----------------------------------|\nB|-----------------------------------|\nG|---------------------------------7-|\nD|-------------------------7---9p7---|\nA|-----------7h8p7---7-8h9---9-------|\nE|-7--7-9-10------10-----------------|\n \ne|-----------------------------------|\nB|-----------------------------------|\nG|-----------------------------------|\nD|-------------------------7---9p7---|\nA|-----------7h8p7---7-8h9---9-----9-|\nE|-7--7-9-10------10-----------------|\n \ne|-----------------------------------|\nB|-----------------------------------|\nG|---------------------------------7-|\nD|-------------------------7---9p7---|\nA|-----------7h8p7---7-8h9---9-------|\nE|-7--7-9-10------10-----------------|\n \ne|--------------------------------|\nB|--------------------------------|\nG|--------------------------------|\nD|-/7----5------------------------|\nA|-/5----3----7h8p7-5h7p5-4h5p4-3-|\nE|--------------------------------|\n \n[Riff 3]\ne|-------------------------------|\nB|-------------------------------|\nG|-------------------------------|x6\nD|-4-----------------------------|\nA|-2---2-2-2---------------------|\nE|-----------2-2-3-3-0-0-2-2-3-0-|\n       * * * * * * * * * * * * *\n   "This morning I made the call..."\n \ne|-------------------------------|\nB|-------------------------------|\nG|-------------------------------|x2\nD|-2--------------------2--/5--5-|\nA|-0---0-0-0-2---3------0--/3--3-|\nE|-----------0-0-1--3-0----------|\n       * * *   *    * *\n   "Not for the money..."\n \ne|-------------------------------|\nB|-------------------------------|\nG|-------------------------------|x2\nD|-4-----------------------------|\nA|-2---2-2-2---------------------|\nE|-----------2-2-3-3-0-0-2-2-3-0-|\n       * * * * * * * * * * * * *\n   "Not for the power..."\n \n[Riff 4]\ne|----------------------------------------------|\nB|----------------------------------------------|\nG|----------------------------------------------|x3\nD|-4---------------------------------------/7-7-|\nA|-2----4-5--------------2----1/2--2-1~----/5-5-|\nE|----0-2-3--0-2-3-3-2-1-0--0-2/3--3-2~--0------|\n      * *    * * * * * *    *            *\n   "But now I'm safe...."\n \ne|---------------------------------------------------|\nB|---------------------------------------------------|\nG|---------------------------------------------------|\nD|-4-------------------------------------------------|\nA|-2----4-5--------------2----1/2--2-1~--4h5p4-4-0-1-|\nE|----0-2-3--0-2-3-3-2-1-0--0-2/3--3-2~--------------|\n      * *    * * * * * *    *\n   "In the eye of the tornado, blow me away..."\n \n[Play Riff 3]    "You've grown to loathe my name..."\n[Play Riff 4]   "But now I'm safe..."\n \n[Riff 5]\ne|--------------------------------|\nB|--------------------------------|\nG|--------------------------------|x2\nD|-4-x-x----------4-x-x---------7-|\nA|-2-x-x-4-5-x----2-x-x-4-5-x-x-5-|\nE|-------2-3-x----------2-3-x-x---|\n  "Who's to say...."\n \ne|--------------------------------|\nB|--------------------------------|\nG|--------------------------------|\nD|-2-x-x----------2-x-x---------5-|\nA|-0-x-x-2-3-x----0-x-x-2-3-x-x-3-|\nE|-------0-1-x----------0-1-x-x---|\n  "Who's to say, what's for me to do..."\n \ne|----------------------------------|\nB|----------------------------------|\nG|----------------------------------|\nD|-4-x-x----------4-x-x---------7-4-|\nA|-2-x-x-4-5-x----2-x-x-4-5-x-x-5-2-|\nE|-------2-3-x----------2-3-x-x-----|\n  "Cause a big nothing..."\n \n[Riff 6]\ne|-----------------------------------|\nB|-----------------------------------|\nG|---------------------------------7-|\nD|-------------------------7---9p7---|\nA|-----------7h8p7---7-8h9---9-------|\nE|-7--7-9-10------10-----------------|\n  "The land of opportunity..."\n \ne|-----------------------------------|\nB|-----------------------------------|\nG|-----------------------------------|\nD|-------------------------7---9p7---|\nA|-----------7h8p7---7-8h9---9-----9-|\nE|-7--7-9-10------10-----------------|\n  "...the golden chance for me..."\n \n[Riff 7]\nGuitar 1\ne|-------------------------------|\nB|-------------------------------|\nG|-------------------------------|\nD|-------------------------------|\nA|------5---7-5--------7-----5h7-|\nE|-7--7---7-----5-7--7---7-7-----|\n      *   *          *   * *\n \nGuitar 2 (Comes in 4th time on last two notes of above)\ne|-------------------------------|\nB|-------------------------------|\nG|-------------------------------|\nD|------4---5-4--------5-----4h5-|\nA|-5--5---5-----4-5--5---5-5-----|\nE|-------------------------------|\n      *   *          *   * *\n \n[Riff 8]\n(Solo Rhythm)\ne|---------------------------------|\nB|---------------------------------|\nG|---------------------------------|\nD|---------------------------------|\nA|-9----------------------9-9-(9)\\-|\nE|-7--7-7-7-7-7-7-7-7-7-7-7-7-(7)\\-|\n      * * * * * * * * * *\n \ne|------------------------------|\nB|------------------------------|\nG|------------------------------|\nD|------------------------------|\nA|-5----------------------5-5---|\nE|-3--3-3-3-3-3-3-3-3-3-3-3-3-3-|\n      * * * * * * * * * *     *\n \ne|------------------------------|\nB|------------------------------|\nG|------------------------------|\nD|------------------------------|\nA|-2----------------------2-2---|\nE|-0--0-0-0-0-0-0-0-0-0-0-0-0-0-|\n      * * * * * * * * * *     *\n \ne|---------------------------|\nB|---------------------------|\nG|---------------------------|\nD|---------------------------|\nA|-4------------7--------8---|\nE|-2--2-2-2-2-2-5--5-5-5-6-6-|\n      * * * * *    * * *   *\n \n[Solo]\n(Friedman)\ne|----------------------------------------|\nB|----------------------------------------|\nG|-3b5^r3b4~~--------4------6--7--(7)/9~~-|\nD|-----------------x------x---------------|\nA|---------------x------x-----------------|\nE|----------------------------------------|\n \ne|-------------------------------|\nB|-------------------------------|\nG|-9/11-11-9~----9-7-8b10^r8b9~~-|\nD|-------------------------------|\nA|-------------------------------|\nE|-------------------------------|\n \ne|-----------------------------|\nB|-----10-7--------------------|\nG|-7-9------9-7-6-7----6h7-6~~-|\nD|------------------9----------|\nA|-----------------------------|\nE|-----------------------------|\n \ne|----------------------------|\nB|----------------------------|\nG|-6b7-6-6h7-6----------------|\nD|-------------9-7---7-9------|\nA|-----------------9-----9~~--|\nE|----------------------------|\n \ne|--------------------------------------|\nB|-----------------12-14-12-14-14-12-14-|\nG|--------------11----------------------|\nD|------9h11h12-------------------------|\nA|-9h10---------------------------------|\nE|--------------------------------------|\n \ne|--------------------------------------------------------|\nB|-13b15--[14]15r14-12-[13]14r13b14-(14)r13--12-12-14-----|\nG|----------------------------------------------------12~-|\nD|--------------------------------------------------------|\nA|--------------------------------------------------------|\nE|--------------------------------------------------------|\n \ne|-------14-14/15\\14-10-14p10h14-10----10----|\nB|----------------------------------14----14-|\nG|-12-12-------------------------------------|\nD|-------------------------------------------|\nA|-------------------------------------------|\nE|-------------------------------------------|\n \ne|---------------------------------|\nB|-12------------------------------|\nG|----11\\9-11-9\\7-9b11--7-6~~-/15\\-|\nD|---------------------------------|\nA|---------------------------------|\nE|---------------------------------|\n \ne|-/14-10h14p10------------10-/19p14------------14-|\nB|-------------14-12--12-14---------15-14--14h15---|\nG|------------------11-------------------16--------|\nD|-------------------------------------------------|\nA|-------------------------------------------------|\nE|-------------------------------------------------|\n \ne|-19-15h19p15----------15-19-19b22r19-19p18-19~~-|\nB|------------17------17--------------------------|\nG|--------------16--16----------------------------|\nD|----------------17------------------------------|\nA|------------------------------------------------|\nE|------------------------------------------------|\n \ne|-0-19-16h19p16----------------12-16p12-----------------|\nB|--------------17---------------------------------------|\nG|----------------16\\13---13h16----------16-13--13\\9-9~~-|\nD|----------------------14--------------------15---------|\nA|-------------------------------------------------------|\nE|-------------------------------------------------------|\n \ne|--------------------------------------------|\nB|--------------------------------------------|\nG|-11-11-11/12-12-12/15-15-15\\7-7-7/9-9-9\\6~~-|\nD|--------------------------------------------|\nA|--------------------------------------------|\nE|--------------------------------------------|\n \ne|-----------------------------------------------------|\nB|-----------------------------------------------------|\nG|-7~----------------7-9-8b10---(10)r8-7~-------7------|\nD|-------9-------7h9-------------------------/9---9-9~-|\nA|---------9~------------------------------------------|\nE|-----------------------------------------------------|\n \ne|------------------------------------|\nB|------------------------------------|\nG|-7---9-7----------------------------|\nD|---9-----9-7--9b12r9--7-------------|\nA|-------------------------9\\7~----\\5-|\nE|------------------------------------|\n \ne|------------------------------------|\nB|--------------8h11/14p11------------|\nG|------------9------------12---------|\nD|----8h11-11----------------14-12----|\nA|-/9------------------------------14-|\nE|------------------------------------|\n \ne|-------------------------------------|\nB|----------10h14/19\\14p10----10h14p10-|\nG|-------------------------12----------|\nD|----11h14----------------------------|\nA|-12----------------------------------|\nE|-------------------------------------|\n \ne|-/14p10--10--14p10-14p10--10--14p10-14p10--10-|\nB|-------12---------------12---------------12---|\nG|----------------------------------------------|\nD|----------------------------------------------|\nA|----------------------------------------------|\nE|----------------------------------------------|\n \ne|-15p10--10-14p10--10-15p10--10-14p10--10-|\nB|------12--------12--------12--------12---|\nG|-----------------------------------------|\nD|-----------------------------------------|\nA|-----------------------------------------|\nE|-----------------------------------------|\n \ne|-15p10--10--15p10-15p10--10--15p10-15p10--10-|\nB|------12---------------12---------------12---|\nG|---------------------------------------------|\nD|---------------------------------------------|\nA|---------------------------------------------|\nE|---------------------------------------------|\n \ne|-17p10--10-15p10--10-17p10--10-15p10--10-|\nB|------12--------12--------12--------12---|\nG|-----------------------------------------|\nD|-----------------------------------------|\nA|-----------------------------------------|\nE|-----------------------------------------|\n \ne|-16p10--10--16p10-16p10--10--16p10-16p10--10-|\nB|------12---------------12---------------12---|\nG|---------------------------------------------|\nD|---------------------------------------------|\nA|---------------------------------------------|\nE|---------------------------------------------|\n \ne|-17p10--10-16p10--10-17p0--10-16p10----14-|\nB|------12--------12-------12--------12/----|\nG|------------------------------------------|\nD|------------------------------------------|\nA|------------------------------------------|\nE|------------------------------------------|\n \ne|-18p14--14--18p14-18p14--14--18p14-18p14--14-|\nB|------14---------------14---------------14---|\nG|---------------------------------------------|\nD|---------------------------------------------|\nA|---------------------------------------------|\nE|---------------------------------------------|\n \ne|-17p12--12-17p12-17p12--12-17p12-12-12-|\nB|------14--------------14---------------|\nG|---------------------------------------|\nD|---------------------------------------|\nA|---------------------------------------|\nE|---------------------------------------|\n \ne|-17b19~~----(19)r17\\--2/13-10-|\nB|------------------------------|\nG|------------------------------|\nD|------------------------------|\nA|------------------------------|\nE|------------------------------|\n \ne|-14-10----------10h14-10-/17-14/17-21-17-|\nB|-------14p12-----------------------------|\nG|-------------12--------------------------|\nD|-----------------------------------------|\nA|-----------------------------------------|\nE|-----------------------------------------|\n \ne|----------19-24p19----19-------------22-------------|\nB|-19----19----------22----22-22p19h22----22p19\\18h20-|\nG|----19----------------------------------------------|\nD|----------------------------------------------------|\nA|----------------------------------------------------|\nE|----------------------------------------------------|\n \ne|-19----------17----------15----------14------------------------|\nB|----18\\15h17----15\\14h15----14\\12h14----12\\10-12p10-12p10\\8h10-|\nG|---------------------------------------------------------------|\nD|---------------------------------------------------------------|\nA|---------------------------------------------------------------|\nE|---------------------------------------------------------------|\n \ne|--------------------------------------|\nB|-10p8\\7-8p7-10p7h8p7------------------|\nG|---------------------9p7-10p9p7-9p7~~-|\nD|--------------------------------------|\nA|--------------------------------------|\nE|--------------------------------------|\n \ne|--------7----------------|\nB|----------10p7-10b12~~\\--|\nG|-9b10^-------------------|\nD|-------------------------|\nA|-------------------------|\nE|-------------------------|\n \ne|-------------------------------------|\nB|-------4-5p4---------------8p7-------|\nG|-4h5h7-------7/10-7h8h10p7-----10/12-|\nD|-------------------------------------|\nA|-------------------------------------|\nE|-------------------------------------|\n \ne|---------------------------------------------|\nB|----------12p11----11-12p11----11-12-11-12~~-|\nG|-11h12h14-------14----------14---------------|\nD|---------------------------------------------|\nA|---------------------------------------------|\nE|---------------------------------------------|\n \n[Riff 9]\ne|--------------------------------|\nB|--------------------------------|\nG|------4-----------4-----2---2h4-|\nD|------4-----4-----4-----2---2h4-|\nA|-2--2---2-2-4-2-2---2-2---2-----|\nE|--------------------------------|\n      *   * *   * *   * *   *\n \ne|--------------------------------|\nB|--------------------------------|\nG|------4-----------4-----2---2h4-|\nD|------4-----4-----4-----2---2h4-|\nA|------------4-------------------|\nE|-3--3---3-3---3-3---3-3---3-----|\n      *   * *   * *   * *   *\n \ne|--------------------------------|\nB|--------------------------------|\nG|------4-----------4-----2---2h4-|\nD|------4-----4-----4-----2---2h4-|\nA|------------4-------------------|\nE|-0--0---0-0---0-0---0-0---0-----|\n      *   * *   * *   * *   *\n \ne|------------------------------|\nB|------------------------------|\nG|------4--------------4--------|\nD|------4-----4--------4--------|\nA|------------4---0--0---0-0-1--|\nE|-2--2---2-2---2---------------|\n      *   * *   *    *   * *\n \n[Riff 10]\nGuitar 1\ne|-------------------------------|\nB|-------------------------------|\nG|-------------------------------|\nD|-----------0-----------------0-|\nA|-2-----0-2---2-0-2~------0-2---|\nE|---0-2---------------0-2-------|\n     * * * *           * * * *\n \nGuitar 2\ne|-------------------------------|\nB|-------------------------------|\nG|-------------------------------|\nD|-----------7-----------------7-|\nA|-2-----7-9---9-7-9~------7-9---|\nE|---7-9---------------7-9-------|\n     * * * *           * * * *\n                                x3\ne|-------------------------------|\nB|-------------------------------|\nG|-------------------------------|\nD|-----------7-----------------7-|\nA|-9-----7-9---9-7-9~------7-9---|\nE|---7-9---------------7-9-------|\n     * * * *           * * * *\n \n[Riff 11]\ne|-------------------------------|\nB|-------------------------------|\nG|-------------------------------|\nD|-----------0-----------------0-|\nA|-2-----0-2---2-0-2~------0-2---|\nE|---0-2---------------0-2-------|\n     * * * *           * * * *\n  "I warn you of the fate..."\n \n[Riff 12]\ne|--------------------------------|\nB|--------------------------------|\nG|--------------------------------|\nD|------------0-----------------0-|\nA|-3------0-3---3-0-3~------0-3---|\nE|----0-3---------------0-3-------|\n      * * * *           * * * *\n  "You feel my fingertips..."\n \ne|--------------------------------|\nB|--------------------------------|\nG|--------------------------------|\nD|------------0-----------------0-|\nA|-2------0-2---2-0-2~------0-2---|\nE|----0-2---------------0-2-------|\n      * * * *           * * * *\n  "You won't forget my lips..."\n \ne|--------------------------------|\nB|--------------------------------|\nG|--------------------------------|\nD|------------0-----------------0-|\nA|-3------0-3---3-0-3~------0-3---|\nE|----0-3---------------0-3-------|\n      * * * *           * * * *\n  "You feel my cold breath..."\n \ne|--------------------------------|\nB|--------------------------------|\nG|--------------------------------|\nD|------------0-----------------0-|\nA|-2------0-2---2-0-2~------0-2---|\nE|----0-2---------------0-2-------|\n      * * * *           * * * *\n  "It's the kiss of death..."\n \n[Riff 13]\ne|--------------------------------------|\nB|--------------------------------------|\nG|--------------------------------------|\nD|-4--x-x----------2---------------2--x-|\nA|-2--x-x-4-5--x-x-0-2--x-x-4-5--x-0--x-|\nE|--------2-3--x-x---0--x-x-2-3--x------|\n \ne|-------------------------------------------------|\nB|-------------------------------------------------|\nG|-------------------------------------------------|\nD|-4--x-x----------2--/7--5----------------------4-|\nA|-2--x-x-4-5--x-x-0--/5--3--7h8p7-5h7p5-4h5p4-3-2-|\nE|--------2-3--x-x---------------------------------|	This morning I made the call\nThe one that ends it all\nHanging up, I wanted to cry\nBut dammit, this well's gone dry\nNot for the money\nNot for the fame\nNot for the power\nJust no more games\nBut now I'm safe in the eye of a tornado\nI can't replace the lies, that let a thousand days go\nNo more living trapped inside, in her way I'll surely die\nIn the eye of the tornado, blow me away\nYou'll grow to loathe my name\nYou'll hate me just the same\nYou won't need your breath\nAnd soon you'll meet your death\nNot from the years\nNot from the use\nNot from the tears\nJust self-abuse\nBut now I'm safe in the eye of a tornado\nI can't replace the lies that let a thousand days go\nNo more living trapped inside, in her way I'll surely die\nIn the eye of the tornado, blow me away\nto say what's for me to say?\n(Who's) to say what's for me to be?\n(Who's) to say what's for me to do?\n'Cause a big nothing it'll be for me\nThe land of opportunity\nThe golden chance for me\nMy future looks so bright\nNow I think I've seen the light\nCan't say what's on my mind\nCan't do what I really feel\nIn this bed I made for me\nIs where I sleep, I really feel\nI warn you of the fate\nProven true too late\nYour tongue twists perverse\nCome drink now of this curse\nAnd now I fill your brain\nI spin you round again\nMy poison fills your head\nAs I tuck you into bed\nYou feel my fingertips\nYou won't forget my lips\nYou'll feel my cold breath\nIt's the kiss of death	https://www.youtube.com/embed/Lcm9qqo_qB0	https://images.genius.com/f195c7fdc825b23023ec5b21e9308689.950x950x1.jpg	5	2021-12-18 12:40:24.36+01	2021-12-18 12:40:24.36+01
4	Meet Me In the Woods	Lord Huron	Strange Trails	Indie	2015	[Intro]\nEm D G\nEm G C\nEm D G\nEm G C\n \n[Verse 1]\n  Em                           D       G\nI took a little journey to the unknown,\n      Em                      G             C\nand I come back changed I can feel it in my bones.\n  Em                          D          G\nI fucked with forces that our eyes can't see.\nEm                     G       C\nNow the darkness got a hold on me.\nEm                     G       C\nNow the darkness got a hold on me.\n \n[Break]\nEm    D  G\noh oh oh oh oh\nEm             G         C\nla-dat-Dada la-Dada-Dada-Da\nEm    D  G\noh oh oh oh oh\nEm             G         C\nla-dat-Dada la-Dada-Dada-Da\n \n[Verse 2]\nEm                   D        G\nHow long baby have I been away?\n       Em                          G             C\nOh, it feels like ages though you say it's only days.\nEm                           D           G\nThere ain't language for the things I've seen. (yeah)\n        Em                         G          C\nAnd the truth is stranger than my own worst dreams.\n    Em                      G       C\nThe truth is stranger than all my dreams.\nEm                      G       C\nWoah the darkness got a hold on me.\n \n[Chorus]\nC                             Em\nI have seen what the darkness does.\nG                   C\nSay goodbye to who I was.\nC                          Em\nI ain't never been away so long.\nG                             C\nDon't look back them days are gone.\nC                          Em\nFollow me into the endless night.\nG                        C\nI can bring your fears to life.\nC                               Em\nShow me yours and I'll show you mine.\nG                        C\nMeet me in the woods tonight.\n \n[Break]\nEm    D  G\noh oh oh oh oh\nEm             G         C\nla-dat-Dada la-Dada-Dada-Da\nEm    D  G\noh oh oh oh oh\nEm             G         C\nla-dat-Dada la-Dada-Dada-Da\n \n[Verse 3]\n          Em                        G           C\nYeah, the truth is stranger than my own worst dreams.\nEm                     G       C\nOh, the darkness got a hold on me.\n \n[Chorus]\nC                             Em\nI have seen what the darkness does.\nG                   C\nSay goodbye to who I was.\nC                          Em\nI ain't never been away so long.\nG                             C\nDon't look back them days are gone.\nC                          Em\nFollow me into the endless night.\nG                         C\nI can bring your fears to life.\nC                               Em\nShow me yours and I'll show you mine.\nG                        C\nMeet me in the woods tonight.\n \n[Break] (x4)\nEm    D  G\noh oh oh oh oh\nEm             G         C\nla-dat-Dada la-Dada-Dada-Da\nEm    D  G\noh oh oh oh oh\nEm             G         C\nla-dat-Dada la-Dada-Dada-Da\n \n[Outro]\nEm    D  G\n \nEm             G         C\nla-dat-Dada la-Dada-Dada-Da	I took a little journey to the unknown\nAnd I've come back changed I can feel it in my bones\nI fucked with forces that our eyes can't see\nNow the darkness got a hold on me\nOh, the darkness got a hold on me\nHow long baby have I been away?\nOh, it feels like ages, though you say it's only days\nThere ain't language for the things I've seen\nAnd the truth is stranger than my own worst dreams\nThe truth is stranger than all my dreams\nOh, the darkness got a hold on me\nI have seen what the darkness does\nSay goodbye to who I was\nI ain't never been away so long\nDon't look back them days are gone\nFollow me into the endless night\nI can bring your fears to life\nShow me yours and I'll show you mine\nMeet me in the woods tonight\nThe truth is stranger than my own worst dreams\nOh, the darkness got a hold on me\nI have seen what the darkness does\nSay goodbye to who I was\nI ain't never been away so long\nDon't look back them days are gone\nFollow me into the endless night\nI can bring your fears to live\nShow me yours and I'll show you mine\nMeet me in the woods tonight	https://www.youtube.com/embed/d5axbaGBVto	https://i.scdn.co/image/ab67616d0000b2739d2efe43d5b7ebc7cb60ca81	15	2021-12-18 12:40:24.36+01	2021-12-18 12:40:24.36+01
5	Wicked Game	Chris Isaak	Heart Shaped World	Rock/pop	1989	\n[Intro]\nBm A E\ne|---------------------------------|  e|-2----0-----------------------------|\nB|---7b-7s0---7b-5-3-2-0-----------|  B|---3----3--2--0---------------------|\nG|4b-------4b---------------2---1--|  G|----------------2--1----1--2--2s4---|\nD|------------------------4---2----|  D|----------------------2-------------|\nA|---------------------------------|  A|------------------------------------|\nE|---------------------------------|  E|------------------------------------|Play 2x\n       PART 1  00:00-00:17              PART 2  00:18-00:34\n \n[Verse 1]\nBm                         A                       E\nThe world was on fire and no one could save me but you.\ne|------------|\nB|------------|\nG|----2---1---|\nD|--4---2-----|\nA|------------|\nE|------------|\n \nBm                            A                    E\nIt's strange what desire will make foolish people do.\ne|-----------|\nB|-----------|\nG|----1-2-4--|\nD|--2--------|\nA|-----------|\nE|-----------|\n \nBm                     A                     E\nI never dreamed that I'd meet somebody like you.\ne|------------|\nB|------------|\nG|----2---1---|\nD|--4---2-----|\nA|------------|\nE|------------|\n \nBm                     A                     E\nI never dreamed that I'd love somebody like you\ne|-----------|\nB|-----------|\nG|----1-2-4--|\nD|--2--------|\nA|-----------|\nE|-----------|\n \n[Chrous]\nBm A                   E\nI don't want to fall in love. (This world is only gonna break your heart)\ne|------------|\nB|------------|\nG|----2---1---|\nD|--4---2-----|\nA|------------|\nE|------------|\n \nBm A                   E\nI don't want to fall in love. (This world is only gonna break your heart)\ne|-----------|\nB|-----------|\nG|----1-2-4--|\nD|--2--------|\nA|-----------|\nE|-----------|\n \ne|-2----0-----------------------------|\nB|---3----3--2------------------------|\nG|-------------4--2--1----1--2--2s4---|\nD|----------------------2-------------|\nA|------------------------------------|\nE|------------------------------------|\nWith you.\n \ne|-2----0-----------------------------|\nB|---3----3--2------------------------|\nG|-------------4--2--1----1--2--2s4---|\nD|----------------------2-------------|\nA|------------------------------------|\nE|------------------------------------|\nWith you.      (This world is only gonna break your heart)\n \n[Verse 2]\nBm             A           E\nWhat a wicked game to play, to make me feel this way.\ne|------------|\nB|------------|\nG|----2---1---|\nD|--4---2-----|\nA|------------|\nE|------------|\n \nBm               A        E\nWhat a wicked thing to do, to let me dream of you.\ne|-----------|\nB|-----------|\nG|----1-2-4--|\nD|--2--------|\nA|-----------|\nE|-----------|\n \nBm              A          E\nWhat a wicked thing to say, you never felt this way.\ne|------------|\nB|------------|\nG|----2---1---|\nD|--4---2-----|\nA|------------|\nE|------------|\n \nBm              A         E\nWhat a wicked thing to do, to make me dream of you and,\ne|-----------|\nB|-----------|\nG|----1-2-4--|\nD|--2--------|\nA|-----------|\nE|-----------|\n \n[Chrous]\nBm A                   E\nI don't want to fall in love. (This world is only gonna break your heart)\nBm A                   E\nI don't want to fall in love. (This world is only gonna break your heart)\nWith you.\n \n[Instrumental]\ne|---------------------------------|  e|-2----0-----------------------------|\nB|---7b-7s0---7b-5-3-2-0-----------|  B|---3----3--2------------------------|\nG|4b-------4b---------------2---1--|  G|-------------4--2--1----1--2--2s4---|\nD|------------------------4---2----|  D|----------------------2-------------|\nA|---------------------------------|  A|------------------------------------|\nE|---------------------------------|  E|------------------------------------|Play 2x\n \n[Verse 3]\nBm                         A                       E\nThe world was on fire and no one could save me but you.\ne|------------|\nB|------------|\nG|----2---1---|\nD|--4---2-----|\nA|------------|\nE|------------|\n \nBm                            A                    E\nIt's strange what desire will make foolish people do.\ne|-----------|\nB|-----------|\nG|----1-2-4--|\nD|--2--------|\nA|-----------|\nE|-----------|\n \nBm                     A                     E\nI never dreamed that I'd meet somebody like you.\n \ne|------------|\nB|------------|\nG|----2---1---|\nD|--4---2-----|\nA|------------|\nE|------------|\n \nBm                     A                     E\nI never dreamed that I'd love somebody like you.\ne|-----------|\nB|-----------|\nG|----1-2-4--|\nD|--2--------|\nA|-----------|\nE|-----------|\n \n[Chrous]\nBm A                   E\nI don't want to fall in love. (This world is only gonna break your heart)\ne|------------|\nB|------------|\nG|----2---1---|\nD|--4---2-----|\nA|------------|\nE|------------|\n \nBm A                   E\nI don't want to fall in love. (This world is only gonna break your heart)\ne|-----------|\nB|-----------|\nG|----1-2-4--|\nD|--2--------|\nA|-----------|\nE|-----------|\n \ne|-2----0-----------------------------|\nB|---3----3--2------------------------|\nG|-------------4--2--1----1--2--2s4---|\nD|----------------------2-------------|\nA|------------------------------------|\nE|------------------------------------|\nWith you.\n \ne|-2----0-----------------------------|\nB|---3----3--2------------------------|\nG|-------------4--2--1----1--2--2s4---|\nD|----------------------2-------------|\nA|------------------------------------|\nE|------------------------------------|\nWith you.      (This world is only gonna break your heart)\n \n[Outro]\nBm       A       E\nNobody loves no one.\n \n \n************************************\n \n| b  Bend\n| s  Slide\n \n************************************	The world was on fire and no one could save me but you\nIt's strange what desire will make foolish people do\nI never dreamed that I'd meet somebody like you\nAnd I never dreamed that I'd lose somebody like you\nNo, I don't wanna fall in love (this world is only gonna break your heart)\nNo, I don't wanna fall in love (this world is only gonna break your heart)\nWith you\nWith you\n(This world is only gonna break your heart)\nWhat a wicked game you play, to make me feel this way\nWhat a wicked thing to do, to let me dream of you\nWhat a wicked thing to say, you never felt this way\nWhat a wicked thing to do, to make me dream of you\nAnd I don't wanna fall in love (this world is only gonna break your heart)\nNo, I don't wanna fall in love (this world is only gonna break your heart)\nWith you\nThe world was on fire and no one could save me but you\nStrange what desire will make foolish people do\nI never dreamed that I'd love somebody like you\nAnd I never dreamed that I'd lose somebody like you\nNo, I don't wanna fall in love (this world is only gonna break your heart)\nNo, I don't wanna fall in love (this world is only gonna break your heart)\nWith you (this world is only gonna break your heart)\nWith you (with you)\n(This world is only gonna break your heart)\nNo, I (this world is only gonna break your heart)\n(This world is only gonna break your heart)\nNobody loves no one	https://www.youtube.com/embed/dlJew-Dw87I	https://upload.wikimedia.org/wikipedia/en/7/7c/Wicked_Game_-_Chris_Isaak.jpg	20	2021-12-18 12:40:24.36+01	2021-12-18 12:40:24.36+01
6	Before I Forget	Slipknot	Vol. 3 - The Subliminal Verses	Alternative metal	2004	Drop B\n \n[Intro] x3\n19th fret harmonic(whole note)\nC#|------------------------------|       |----------------------|\nG#|------------------------------|       |----------------------|\nE |------------------------------| X6    |----------------------|\nB |-0h2--0h2h3p2--0h2--2h3p2-----|       |-5-5-5-0-5-5-5-0------|\nF#|-0h2--0h2h3p2--0h2--2h3p2-----|       |-5-5-5-0-5-5-5-0------|\nB |-0h2--0h2h3p2--0h2--2h3p2-----|       |-5-5-5-0-5-5-5-0------|\n \nGO!!!\n \n[Verse] x4\nC#|------------------------------|       |----------------------|\nG#|------------------------------|       |----------------------|\nE |------------------------------| X6    |----------------------|\nB |-0h2--0h2h3p2--0h2--2h3p2-----|       |-5-5-5-0--------------|\nF#|-0h2--0h2h3p2--0h2--2h3p2-----|       |-5-5-5-0--------------|\nB |-0h2--0h2h3p2--0h2--2h3p2-----|       |-5-5-5-0--------------|\n \nC#|--------------------------------------------------------------|\nG#|--------------------------------------------------------------|\nE |--------------------------------------------------------------|\nB |--2-2-2-2h3p2--2-2-2h3p2---5-5-5-0----------------------------|\nF#|--2-2-2-2h3p2--2-2-2h3p2---5-5-5-0----------------------------|\nB |--2-2-2-2h3p2--2-2-2h3p2---5-5-5-0----------------------------|\n \n[Pre-Chorus]\nC#|--------------------|\nG#|--------------------|\nE |--------------------|\nB |--2-2-2-------------|\nF#|--2-2-2-------------|\nB |--2-2-2-------------|\n     * * *\n \n[Guitar 2]\nC#|-----15/16~~-----9/10~~--16/16~~-------|\nG#|---------------------------------------|\nE |---------------------------------------|\nB |---------------------------------------|\nF#|---------------------------------------|\nB |---------------------------------------|\n \n[Chorus]\nC#|-----------------------|       |------------------------------|\nG#|-----------------------|       |------------------------------|\nE |-----------------------| X3    |------------------------------|\nB |-2-0h2-5-0h2-5-0-8p7---|       |-7-7-7h9p7-10-5-5-7/8---------|\nF#|-2-0h2-5-0h2-5-0-8p7---|       |-7-7-7h8p7-10-5-5-7/8---------|\nB |-2-0h2-5-0h2-5-0-8p7---|       |-7-7-7h8p7-10-5-5-7/8---------|\n \nC#|-----------------------------------------------------------------------------|\nG#|-----------------------------------------------------------------------------|\nE |---------------------------7-5-4-----5-4-2-0---------------------------------|\nB |---5555555-4-5555555----------7--------------4-5555555-4-5555555-------------|\nF#|-----------------------------------------------------------------------------|\nB |-----------------------------------------------------------------------------|\n \n[Guitar 1]\nMy End, It Justifies My means...\nC#|-----------------------------------------------------------------------|\nG#|-----------------------------------------------------------------------|\nE |-----------------------------------------------------------------------|\nB |-----------------------------------------------------------------------|\nF#|-2222222-5555555-00000000----------------------------------------------|\nB |-2222222-5555555-00000000----------------------------------------------|\n \n  (Guitar 2)\nC#|----------------------|\nG#|----------------------|\nE |----------------------|\nB |----------------------|\nF#|-0-2-0-2-3p2-0h2------|\nB |----------------------|\n \n[Verse] x3\nC#|------------------------------|       |----------------------|\nG#|------------------------------|       |----------------------|\nE |------------------------------| X6    |----------------------|\nB |-0h2--0h2h3p2--0h2--2h3p2-----|       |-5-5-5-0--------------|\nF#|-0h2--0h2h3p2--0h2--2h3p2-----|       |-5-5-5-0--------------|\nB |-0h2--0h2h3p2--0h2--2h3p2-----|       |-5-5-5-0--------------|\n \nC#|--------------------------------------------------------------|\nG#|--------------------------------------------------------------|\nE |--------------------------------------------------------------|\nB |--2-2-2-2h3p2--2-2-2h3p2---5-5-5-0----------------------------|\nF#|--2-2-2-2h3p2--2-2-2h3p2---5-5-5-0----------------------------|\nB |--2-2-2-2h3p2--2-2-2h3p2---5-5-5-0----------------------------|\n \n[Pre-Chorus]\nC#|--------------------|\nG#|--------------------|\nE |--------------------|\nB |--2-2-2-------------|\nF#|--2-2-2-------------|\nB |--2-2-2-------------|\n     * * *\n \n[Guitar 2]\nC#|-----15/16~~-----9/10~~--16/16~~-------|\nG#|---------------------------------------|\nE |---------------------------------------|\nB |---------------------------------------|\nF#|---------------------------------------|\nB |---------------------------------------|\n \n[Chorus]\nC#|-----------------------|       |------------------------------|\nG#|-----------------------|       |------------------------------|\nE |-----------------------| X3    |------------------------------|\nB |-2-0h2-5-0h2-5-0-8p7---|       |-7-7-7h9p7-10-5-5-7/8---------|\nF#|-2-0h2-5-0h2-5-0-8p7---|       |-7-7-7h8p7-10-5-5-7/8---------|\nB |-2-0h2-5-0h2-5-0-8p7---|       |-7-7-7h8p7-10-5-5-7/8---------|\n \nC#|-----------------------------------------------------------------------------|\nG#|-----------------------------------------------------------------------------|\nE |---------------------------7-5-4-----5-4-2-0---------------------------------|\nB |---5555555-4-5555555----------7--------------4-5555555-4-5555555-------------|\nF#|-----------------------------------------------------------------------------|\nB |-----------------------------------------------------------------------------|\n \n[Guitar 1]\nMy End, It Justifies My means...\nC#|-----------------------------------------------------------------------|\nG#|-----------------------------------------------------------------------|\nE |-----------------------------------------------------------------------|\nB |-----------------------------------------------------------------------|\nF#|-2222222-5555555-00000000----------------------------------------------|\nB |-2222222-5555555-00000000----------------------------------------------|\n \n  (Guitar 2)\nC#|----------------------|\nG#|----------------------|\nE |----------------------|\nB |----------------------|\nF#|-0-2-0-2-3p2-0h2------|\nB |----------------------|\n \n[Chorus]\nC#|-----------------------|       |------------------------------|\nG#|-----------------------|       |------------------------------|\nE |-----------------------| X3    |------------------------------|\nB |-2-0h2-5-0h2-5-0-8p7---|       |-7-7-7h9p7-10-5-5-7/8---------|\nF#|-2-0h2-5-0h2-5-0-8p7---|       |-7-7-7h8p7-10-5-5-7/8---------|\nB |-2-0h2-5-0h2-5-0-8p7---|       |-7-7-7h8p7-10-5-5-7/8---------|\n \nC#|-----------------------------------------------------------------------------|\nG#|-----------------------------------------------------------------------------|\nE |---------------------------7-5-4-----5-4-2-0---------------------------------|\nB |---5555555-4-5555555----------7--------------4-5555555-4-5555555-------------|\nF#|-----------------------------------------------------------------------------|\nB |-----------------------------------------------------------------------------|\n \n[Guitar 1]\nMy End, It Justifies My means...\nC#|-----------------------------------------------------------------------|\nG#|-----------------------------------------------------------------------|\nE |-----------------------------------------------------------------------|\nB |-----------------------------------------------------------------------|\nF#|-2222222-5555555-00000000----------------------------------------------|\nB |-2222222-5555555-00000000----------------------------------------------|\n \n  (Guitar 2)\nC#|----------------------|\nG#|----------------------|\nE |----------------------|\nB |----------------------|\nF#|-0-2-0-2-3p2-0h2------|\nB |----------------------|	Go!\nStapled shut, inside an outside world and I'm\nSealed in tight, bizarre but right at home\nClaustrophobic, closing in and I'm\nCatastrophic, not again\nI'm smeared across the page, and doused in gasoline\nI wear you like a stain, yet I'm the one who's obscene\nCatch me upon all your sordid little insurrections\nI've got no time to lose, and I'm just caught up in all the cattle\nFray the strings\nThrow the shapes\nHold your breath\nAnd listen\nI am a world before I am a man\nI was a creature before I could stand\nI will remember before I forget\nBefore I forget that\nI am a world before I am a man\nI was a creature before I could stand\nI will remember before I forget\nBefore I forget that\nI'm ripped across the ditch, and settled in the dirt and I'm\nI wear you like a stitch, yet I'm the one who's hurt\nPay attention to your twisted little indiscretions\nI've got no right to win, I'm just caught up all the battles\nLocked in clutch\nPushed in place\nHold your breath\nAnd listen\nI am a world before I am a man\nI was a creature before I could stand\nI will remember before I forget\nBefore I forget that\nI am a world before I am a man\nI was a creature before I could stand\nI will remember before I forget\nBefore I forget that\nMy end\nIt justifies my means\nAll I have to do is delay\nI'm given time to evade\nThe end of the road is my end\nIt justifies my means\nAll I have to do is delay\nI haven't time to evade\nThe end of the road!\nI am a world before I am a man\nI was a creature before I could stand\nI will remember before I forget\nBefore I forget that\nI am a world before I am a man\nI was a creature before I could stand\nI will remember before I forget\nBefore I forget that\nI am a world before I am a man\nI was a creature before I could stand\nI will remember before I forget\nBefore I forget that\nYeah, yeah, yeah, yeah\nYeah, yeah, yeah, oh!	https://www.youtube.com/embed/qw2LU1yS7aw	https://a10.gaanacdn.com/images/albums/46/198146/crop_480x480_198146.jpg	25	2021-12-18 12:40:24.361+01	2021-12-18 12:40:24.361+01
3	Lenny	Stevie Ray Vaughan	Texas Flood	Blues	1983	      w/bar     w/bar       w/bar                                   w/bar\n    Emaj7add6   E6     (E)   N.H       S     S      H  P   H      Emaj7add6\nD#|-----9------------|-------12----|----------------------------|-----9------\nA#|-----9-------12---|-------12----|---------------9------------|-----9------\nF#|-----8-------13---|-------------|---------------9-11-9---9---|-----8------\nC#|-----9-------11---|-------------|-------------9--------9-11--|-----9------\nG#|-----7------------|-------------|------7-9/11----------------|-----7------\nD#|-------------12---|--0----------|--7/9-----------------------|-0----------\n \n             w/bar\n      H                w/bar   S     S     H      H    H           Emaj7add6\nD#|-7---------------------------------------------------------|-------9------\nA#|--7-9---7----------5---(5)-----------------9---------------|-------9------\nF#|----------9--------6---(6)---------------9-11-9---9----9---|-------8------\nC#|-------------------4---(4)--------------9-------9-11-9-11--|-------9------\nG#|-------------------------------7-9/11----------------------|-------7------\nD#|-------------5---5-5-------5/9-----------------------------|--0-----------\n \n       S                 w/bar     S      S     H  P\nD#|-7------------|------------------------------------------------||\nA#|---7/9---7----|---------5---X-----------------9----------------||\nF#|-----------9--|---------6---X---------------9-11-9-------------||\nC#|--------------|---------4---X-------------9--------11-9----9---||\nG#|--------------|--------------------9-9/11-------------9-11-----||\nD#|--------------|--5---5--5------7/9-----------------------------||\n \n      w/bar\n     Emaj7add6        H                w/bar      S     S         H  P\nD#|------9---------7-----------|-------------------------------------------|\nA#|------9-----------7-9--7----|-------5----5------------------------------|\nF#|------8------------------9--|-------6----6--------------------9-11-9----|\nC#|------9---------------------|-------4----4---------------9-11--------11-|\nG#|------7---------------------|---------------------7-9/11----------------|\nD#|-0--------------------------|-5---5-5-------5-7/9-----------------------|\n \n           w/bar                         w/bar\n          Emaj7add6     H                 S              S          S    w/bar\nD#|----12-----9------7------------|------------------------------||---------\nA#|----12-----9--------7-9---7----|-------5\\---4------5-----6----||------7--\nF#|-----------8----------------9--|-------6\\---5--------6/7----7-||-/8---8--\nC#|-----------9-------------------|-------4\\---3----4------------||----6----\nG#|-----------7-------------------|------------------------------||---------\nD#|-0------0----------------------|-5---5-5-------5--------------||---------\n \n        w/bar          S       w/bar         w/bar      S   let ring........\nD#|------------------|------------------------------------|-----------------\nA#|---7-------X------|---------10-----10----------10------|----------3------\nF#|------8------8----|---------11------------11-------11\\-|-----------------\nC#|---------------6--|------9-----------------------------|----2------------\nG#|------------------|------------------------------------|-----------------\nD#|------------------|-/10---------X------X---------------|-3-----3-----3---\n \n                                        w/bar\n   let ring...............................              H   P          H\nD#|-----------------------------|------------------------------------------|\nA#|--------7----7---------------|---------10-----10-10-10--------10--------|\nF#|------8----8----8----8-------|-------X-11-----9--11--9-11-9---9--------7|\nC#|----6------------------6--6--|-----9------------------------12--12-7-9--|\nG#|-----------------------------|-------------0----------------------------|\nD#|-7---------------------------|-10---------------------------------------|\n \n         w/bar                                    w/bar\n   let ring........................................     S      H S\nD#|-----------------------------|------------------------------------------|\nA#|-------3----4-------3--------|---------6-------(5)----------------------|\nF#|-------4------4-------4------|------------7-----6-----------------------|\nC#|------------------------2----|----5-------------4-----------------------|\nG#|-----------------------------|---------------------------7-7-9\\---------|\nD#|-3---3----3------------------|-6-----6------6---5---5/8-----------------|\n \n        w/bar\n        N.H                 S     H P           S      H      H\nD#|-----12-----|-------------------------|--------------------------12-9----\nA#|-----12-----|--------5----------------|-------------------------------12-\nF#|------------|------6------------------|-----------------9-9-11-9---------\nC#|------------|----4--------------------|----------9-9-11------------------\nG#|------------|---------------7-7-9-7---|-7-9-9/11-------------------------\nD#|--0---------|--5--------5/9---------9-|----------------------------------\n \n             H  P                 H  P               H P        S     H\nD#|----------------------------|--------------------------------------------|\nA#|-9------------------9-------|--------------------------------------------|\nF#|---12-11-9-11-9-----9-------|--------------------------------------------|\nC#|----------------11----11-9--|-9-11-9-------------------------------------|\nG#|----------------------------|--------11-9-11-7-9----------------7-7-9-7--|\nD#|----------------------------|--------------------7-9-7-5--5-7/9----------|\n \n                                                               w/bar\n          H          S         H        H P            S       H    H      S\nD#|--------12-12---12/14--12----7---7--7--------|-7----------------------17\\|\nA#|-----12-14-12---12/14--12--7-9---9--7-9-7----|-7-9-----------10---10-----|\nF#|------------------------------------------9--|---------9-11--9----9------|\nC#|---------------------------------------------|-----9/11----9-11-9-11-----|\nG#|---------------------------------------------|---------------------------|\nD#|-0-------------------------------------------|---------------------------|\n \n          three-quarter\n             B       S            B\nD#|----15--------------15-17-19-15------------------------------12----------|\nA#|-17----17----17--17---------------17----------------------12-------------|\nF#|-------------------------------------16\\14--12----14-(16)----------------|\nC#|-----------------------------------------------14------------------------|\nG#|-------------------------------------------------------------------------|\nD#|-------------------------------------------------------------------------|\n \n        three-quarter\n         B   P             B                   B                     P\nD#|----------------------------------------------------12-------------------\nA#|-15----15-------12-14-14(15)-12--14----12--------12----15-12-------------\nF#|----14----12----12-14-14(16)-12--14----12-14(16)-------------15-14-12----\nC#|-------------14---------------------14-----------------------------------\nG#|-------------------------------------------------------------------------\nD#|-------------------------------------------------------------------------\n \n              w/bar\n     P      S  P              S        S  P      S        S\nD#|---------------------------|---------------------------------------------|\nA#|---------------------------|---------------------------------------------|\nF#|----12---------------------|---------------------------------------------|\nC#|-14----14-12---------------|----------12---------------------------------|\nG#|-------------14\\12-10------|-10-12/14----14\\12-10--10/11-12-10/11-12-----|\nD#|----------------------(12)-|---------------------12------------------0---|\n \n   switch to neck\n   and middle pickups                          w/bar       w/bar\n         S          N.H  N.H  N.H  N.H  N.H                      S\nD#|--------------------|------------------------12-|-------------------------\nA#|-------5------------|---------------------------|--------5------5---------\nF#|---------6----------|------------------12-------|--------6------6---------\nC#|--------------------|---------12----------------|--4-----4------4---------\nG#|-----------------7--|---------------------------|--X----------------------\nD#|-5----------7/9-----|-0--12-------12------------|--5----------------5/7---\n          Emaj 6\n    Emaj 7/6\nD#|:9-----|-----|---!12!------------------------------------------|\nA#|:9-----|-12--|---!12!------------------------------------------|\nF#|:8-----|-13--|-------------------------9-H11P9-----------------|\nC#|:9-----|-11--|-------------------------9--------11--9-----9----|\nG#|:7-----|-----|-----------------7--9/11--------------9-H11-9-H11|\nD#|:------|-12--|0-------7--7-H9----------------------------------|\n \n     Emaj 7/6             Amaj 6\nD#|:-9-7--------------|------------------------------------------------|\nA#|:-9----(7)-H9--7---|------5-----------------------------------------|\nF#|:-8---------------9|------6---------------------9H11H9---9-----9----|\nC#|:-9----------------|------4-------------------9-------11-9-H11-9-H11|\nG#|:-7----------------|-----------------7-(9)/11-----------------------|\nD#|:0-----------------|--5-5-5--5-(7)/9--------------------------------|\n \n      E maj 7/6           Amaj 6               Bbmaj 6\nD#|:----9-7------------|--------------------------------|\nA#|:----9----(7)H9--7--|-----5--------5-----------6-----|\nF#|:----8-------------9|-----6-----------6-----------7--|\nC#|:----9--------------|-----4-----4-----------5--------|\nG#|:----7--------------|--------------------------------|\nD#|:-0-----------------|-5-5-5--5-----------6-----------|\n \n     Bmaj 6                    D maj 6\nD#|:------------------------|--------------------------------|\nA#|:--------7-----7---------|-------------10-----10----------|\nF#|:-----------8-----8--8---|-----------------11----11--7---7|\nC#|:-----6------------------|----------9----------------7H9--|\nG#|:------------------------|--------------------------------|\nD#|:--7--------------------7|--(7)/10------------------------|\n \n     G maj 6                     Bb maj 6           Amaj 6\nD#|:-------------------------|---------------------------------------|\nA#|:-------3-----3-----------|----------------6----5-----------------|\nF#|:----------4-----4--4-----|-------------7-------6-----------------|\nC#|:----2--------------------|----------5----------4-----------------|\nG#|:-------------------------|----------------------------------7--9-|\nD#|:-3--------------------3--|(3)/6--6-----------6-5--5--(7)/9-------|\n \n    Emaj 7/6\nD#|:----9-----|\nA#|:----9-----|\nF#|:----8-----|\nC#|:----9-----|\nG#|:----7-----|\nD#|:-0--------|	*instrumental*	https://www.youtube.com/embed/HEuKbE4MXPE	https://townsquare.media/site/295/files/2018/05/Stevie-Ray-Vaughan-Texas-Flood-Epic.jpg?w=980&q=75	11	2021-12-18 12:40:24.36+01	2021-12-18 12:43:26.953+01
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: ultimatetab
--

COPY public."Users" (id, email, username, password, "createdAt", "updatedAt", "UserId") FROM stdin;
1	abramovicaleksa@gmail.com	aleksa123	$2b$08$5lnRJ343ALu96BmR5ycHseSkD06lvQDQiUvc1tZfXrZYxxyVA7oT6	2021-12-18 12:40:24.351+01	2021-12-18 12:40:24.351+01	\N
\.


--
-- Name: Bookmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public."Bookmarks_id_seq"', 1, true);


--
-- Name: Histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public."Histories_id_seq"', 2, true);


--
-- Name: Ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public."Ratings_id_seq"', 4, true);


--
-- Name: Songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public."Songs_id_seq"', 6, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public."Users_id_seq"', 1, true);


--
-- Name: bookmarked_tab_sequence; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public.bookmarked_tab_sequence', 1, false);


--
-- Name: bookmarkssequence; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public.bookmarkssequence', 1, true);


--
-- Name: collection_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public.collection_id_sequence', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public.hibernate_sequence', 11, true);


--
-- Name: tab_collection_sequence; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public.tab_collection_sequence', 1, false);


--
-- Name: tab_comment_sequence; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public.tab_comment_sequence', 1, false);


--
-- Name: tab_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public.tab_id_sequence', 1, false);


--
-- Name: tab_rating_sequence; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public.tab_rating_sequence', 1, false);


--
-- Name: tab_user_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public.tab_user_id_sequence', 1, true);


--
-- Name: tabsequence; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public.tabsequence', 1, true);


--
-- Name: tabusersequence; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public.tabusersequence', 1, false);


--
-- Name: user_tab_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: ultimatetab
--

SELECT pg_catalog.setval('public.user_tab_id_sequence', 1, false);


--
-- Name: Bookmarks Bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Bookmarks"
    ADD CONSTRAINT "Bookmarks_pkey" PRIMARY KEY (id);


--
-- Name: Histories Histories_pkey; Type: CONSTRAINT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Histories"
    ADD CONSTRAINT "Histories_pkey" PRIMARY KEY (id);


--
-- Name: Ratings Ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Ratings"
    ADD CONSTRAINT "Ratings_pkey" PRIMARY KEY (id);


--
-- Name: Songs Songs_pkey; Type: CONSTRAINT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Songs"
    ADD CONSTRAINT "Songs_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_username_key; Type: CONSTRAINT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key" UNIQUE (username);


--
-- Name: Bookmarks Bookmarks_SongId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Bookmarks"
    ADD CONSTRAINT "Bookmarks_SongId_fkey" FOREIGN KEY ("SongId") REFERENCES public."Songs"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Bookmarks Bookmarks_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Bookmarks"
    ADD CONSTRAINT "Bookmarks_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Histories Histories_SongId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Histories"
    ADD CONSTRAINT "Histories_SongId_fkey" FOREIGN KEY ("SongId") REFERENCES public."Songs"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Histories Histories_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Histories"
    ADD CONSTRAINT "Histories_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Ratings Ratings_SongId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Ratings"
    ADD CONSTRAINT "Ratings_SongId_fkey" FOREIGN KEY ("SongId") REFERENCES public."Songs"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Users Users_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ultimatetab
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."Ratings"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

