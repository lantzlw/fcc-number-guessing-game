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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: game_data_username_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_data_username_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_data_username_id_seq OWNER TO freecodecamp;

--
-- Name: game_data_username_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_data_username_id_seq OWNED BY public.users.username_id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    username_id integer NOT NULL,
    secret_number integer NOT NULL,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users username_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN username_id SET DEFAULT nextval('public.game_data_username_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (10, 926, 927);
INSERT INTO public.games VALUES (10, 600, 601);
INSERT INTO public.games VALUES (11, 532, 533);
INSERT INTO public.games VALUES (11, 140, 141);
INSERT INTO public.games VALUES (10, 969, 972);
INSERT INTO public.games VALUES (10, 366, 368);
INSERT INTO public.games VALUES (10, 274, 275);
INSERT INTO public.games VALUES (12, 565, 566);
INSERT INTO public.games VALUES (12, 382, 383);
INSERT INTO public.games VALUES (13, 940, 941);
INSERT INTO public.games VALUES (13, 256, 257);
INSERT INTO public.games VALUES (12, 46, 49);
INSERT INTO public.games VALUES (12, 726, 728);
INSERT INTO public.games VALUES (12, 448, 449);
INSERT INTO public.games VALUES (14, 413, 3);
INSERT INTO public.games VALUES (15, 713, 714);
INSERT INTO public.games VALUES (15, 769, 770);
INSERT INTO public.games VALUES (16, 571, 572);
INSERT INTO public.games VALUES (16, 839, 840);
INSERT INTO public.games VALUES (15, 862, 865);
INSERT INTO public.games VALUES (15, 730, 732);
INSERT INTO public.games VALUES (15, 454, 455);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (10, 'user_1737474397398');
INSERT INTO public.users VALUES (11, 'user_1737474397397');
INSERT INTO public.users VALUES (12, 'user_1737474430094');
INSERT INTO public.users VALUES (13, 'user_1737474430093');
INSERT INTO public.users VALUES (14, '1');
INSERT INTO public.users VALUES (15, 'user_1737474488269');
INSERT INTO public.users VALUES (16, 'user_1737474488268');


--
-- Name: game_data_username_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_data_username_id_seq', 16, true);


--
-- Name: users game_data_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT game_data_pkey PRIMARY KEY (username_id);


--
-- Name: games games_username_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_username_id_fkey FOREIGN KEY (username_id) REFERENCES public.users(username_id);


--
-- PostgreSQL database dump complete
--

