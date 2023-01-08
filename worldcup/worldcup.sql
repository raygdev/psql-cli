--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (129, 2018, 'Final', 776, 777, 4, 2);
INSERT INTO public.games VALUES (130, 2018, 'Third Place', 778, 779, 2, 0);
INSERT INTO public.games VALUES (131, 2018, 'Semi-Final', 777, 779, 2, 1);
INSERT INTO public.games VALUES (132, 2018, 'Semi-Final', 776, 778, 1, 0);
INSERT INTO public.games VALUES (133, 2018, 'Quarter-Final', 777, 780, 3, 2);
INSERT INTO public.games VALUES (134, 2018, 'Quarter-Final', 779, 781, 2, 0);
INSERT INTO public.games VALUES (135, 2018, 'Quarter-Final', 778, 782, 2, 1);
INSERT INTO public.games VALUES (136, 2018, 'Quarter-Final', 776, 783, 2, 0);
INSERT INTO public.games VALUES (137, 2018, 'Eighth-Final', 779, 784, 2, 1);
INSERT INTO public.games VALUES (138, 2018, 'Eighth-Final', 781, 785, 1, 0);
INSERT INTO public.games VALUES (139, 2018, 'Eighth-Final', 778, 786, 3, 2);
INSERT INTO public.games VALUES (140, 2018, 'Eighth-Final', 782, 787, 2, 0);
INSERT INTO public.games VALUES (141, 2018, 'Eighth-Final', 777, 788, 2, 1);
INSERT INTO public.games VALUES (142, 2018, 'Eighth-Final', 780, 789, 2, 1);
INSERT INTO public.games VALUES (143, 2018, 'Eighth-Final', 783, 790, 2, 1);
INSERT INTO public.games VALUES (144, 2018, 'Eighth-Final', 776, 791, 4, 3);
INSERT INTO public.games VALUES (145, 2014, 'Final', 792, 791, 1, 0);
INSERT INTO public.games VALUES (146, 2014, 'Third Place', 793, 782, 3, 0);
INSERT INTO public.games VALUES (147, 2014, 'Semi-Final', 791, 793, 1, 0);
INSERT INTO public.games VALUES (148, 2014, 'Semi-Final', 792, 782, 7, 1);
INSERT INTO public.games VALUES (149, 2014, 'Quarter-Final', 793, 794, 1, 0);
INSERT INTO public.games VALUES (150, 2014, 'Quarter-Final', 791, 778, 1, 0);
INSERT INTO public.games VALUES (151, 2014, 'Quarter-Final', 782, 784, 2, 1);
INSERT INTO public.games VALUES (152, 2014, 'Quarter-Final', 792, 776, 1, 0);
INSERT INTO public.games VALUES (153, 2014, 'Eighth-Final', 782, 795, 2, 1);
INSERT INTO public.games VALUES (154, 2014, 'Eighth-Final', 784, 783, 2, 0);
INSERT INTO public.games VALUES (155, 2014, 'Eighth-Final', 776, 796, 2, 0);
INSERT INTO public.games VALUES (156, 2014, 'Eighth-Final', 792, 797, 2, 1);
INSERT INTO public.games VALUES (157, 2014, 'Eighth-Final', 793, 787, 2, 1);
INSERT INTO public.games VALUES (158, 2014, 'Eighth-Final', 794, 798, 2, 1);
INSERT INTO public.games VALUES (159, 2014, 'Eighth-Final', 791, 785, 1, 0);
INSERT INTO public.games VALUES (160, 2014, 'Eighth-Final', 778, 799, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (776, 'France');
INSERT INTO public.teams VALUES (777, 'Croatia');
INSERT INTO public.teams VALUES (778, 'Belgium');
INSERT INTO public.teams VALUES (779, 'England');
INSERT INTO public.teams VALUES (780, 'Russia');
INSERT INTO public.teams VALUES (781, 'Sweden');
INSERT INTO public.teams VALUES (782, 'Brazil');
INSERT INTO public.teams VALUES (783, 'Uruguay');
INSERT INTO public.teams VALUES (784, 'Colombia');
INSERT INTO public.teams VALUES (785, 'Switzerland');
INSERT INTO public.teams VALUES (786, 'Japan');
INSERT INTO public.teams VALUES (787, 'Mexico');
INSERT INTO public.teams VALUES (788, 'Denmark');
INSERT INTO public.teams VALUES (789, 'Spain');
INSERT INTO public.teams VALUES (790, 'Portugal');
INSERT INTO public.teams VALUES (791, 'Argentina');
INSERT INTO public.teams VALUES (792, 'Germany');
INSERT INTO public.teams VALUES (793, 'Netherlands');
INSERT INTO public.teams VALUES (794, 'Costa Rica');
INSERT INTO public.teams VALUES (795, 'Chile');
INSERT INTO public.teams VALUES (796, 'Nigeria');
INSERT INTO public.teams VALUES (797, 'Algeria');
INSERT INTO public.teams VALUES (798, 'Greece');
INSERT INTO public.teams VALUES (799, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 160, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 799, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey1 FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

