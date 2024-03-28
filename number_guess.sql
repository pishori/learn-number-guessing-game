--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_guesses integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: guessing_game_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.guessing_game_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guessing_game_player_id_seq OWNER TO freecodecamp;

--
-- Name: guessing_game_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.guessing_game_player_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.guessing_game_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 10, 1);
INSERT INTO public.games VALUES (2, 11, 1);
INSERT INTO public.games VALUES (3, 775, 2);
INSERT INTO public.games VALUES (4, 465, 2);
INSERT INTO public.games VALUES (5, 682, 3);
INSERT INTO public.games VALUES (6, 653, 3);
INSERT INTO public.games VALUES (7, 256, 2);
INSERT INTO public.games VALUES (8, 175, 2);
INSERT INTO public.games VALUES (9, 507, 2);
INSERT INTO public.games VALUES (10, 742, 4);
INSERT INTO public.games VALUES (11, 375, 4);
INSERT INTO public.games VALUES (12, 62, 5);
INSERT INTO public.games VALUES (13, 534, 5);
INSERT INTO public.games VALUES (14, 563, 4);
INSERT INTO public.games VALUES (15, 618, 4);
INSERT INTO public.games VALUES (16, 595, 4);
INSERT INTO public.games VALUES (17, 424, 6);
INSERT INTO public.games VALUES (18, 60, 6);
INSERT INTO public.games VALUES (19, 774, 7);
INSERT INTO public.games VALUES (20, 860, 7);
INSERT INTO public.games VALUES (21, 962, 6);
INSERT INTO public.games VALUES (22, 8, 6);
INSERT INTO public.games VALUES (23, 364, 6);
INSERT INTO public.games VALUES (24, 12, 1);
INSERT INTO public.games VALUES (25, 938, 8);
INSERT INTO public.games VALUES (26, 657, 8);
INSERT INTO public.games VALUES (27, 579, 9);
INSERT INTO public.games VALUES (28, 398, 9);
INSERT INTO public.games VALUES (29, 673, 8);
INSERT INTO public.games VALUES (30, 19, 8);
INSERT INTO public.games VALUES (31, 150, 8);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Alvin');
INSERT INTO public.users VALUES (2, 'user_1711583325846');
INSERT INTO public.users VALUES (3, 'user_1711583325845');
INSERT INTO public.users VALUES (4, 'user_1711583377861');
INSERT INTO public.users VALUES (5, 'user_1711583377860');
INSERT INTO public.users VALUES (6, 'user_1711583405960');
INSERT INTO public.users VALUES (7, 'user_1711583405959');
INSERT INTO public.users VALUES (8, 'user_1711583505351');
INSERT INTO public.users VALUES (9, 'user_1711583505350');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 31, true);


--
-- Name: guessing_game_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.guessing_game_player_id_seq', 9, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users guessing_game_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT guessing_game_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

