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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_id integer,
    galaxy_types character varying(20),
    description text,
    age_in_millions_of_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20),
    planet_id integer NOT NULL,
    galaxy_id integer,
    moon_type character varying(20)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    star_id integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth_in_mm numeric(4,1)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    galaxy_id integer NOT NULL,
    star_type character varying(20),
    has_planets boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', NULL, NULL, 'Also known as M31 is the nearest large galaxy to the Milky Way', NULL);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, NULL, 'Our home galaxy', NULL);
INSERT INTO public.galaxy VALUES (3, 'Cignus A.', NULL, NULL, 'A radio galaxy with the strongest radio signal in the sky', NULL);
INSERT INTO public.galaxy VALUES (4, 'Magellanic Clouds', NULL, NULL, 'Two irregular dwarf galaxies', NULL);
INSERT INTO public.galaxy VALUES (5, 'Messier 98', NULL, NULL, 'An intermediate spiral galaxy millions of lightyears away', NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 99', NULL, NULL, 'A grand design spiral galaxy in the northern constellation Coma Berenices', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Natural Satellite', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Europa', 5, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Ganymede', 5, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Amalthea', 5, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Adrastea', 5, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Valetudo', 5, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Thebe', 5, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Triton', 8, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Thalassa', 8, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Hippocamp', 8, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Nereid', 8, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Galatea', 8, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Despina', 8, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Phobos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Deimos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Titan', 6, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Enceladus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Mimas', 6, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Dione', 6, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Our home planet', true, true, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'This planet is also hot', false, false, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'This planet is dusty', false, false, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gassy planet', false, false, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Named after a butt', false, false, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Getting pretty cold', false, false, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 'Once was a planet, but now its not', false, false, NULL);
INSERT INTO public.planet VALUES (5, 'Jupter', 1, 'Pretty cool I guess', false, false, NULL);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 'Hot Planet', false, true, NULL);
INSERT INTO public.planet VALUES (10, 'Rainbow Planet', 2, 'A planet literally made of rainbows', false, false, NULL);
INSERT INTO public.planet VALUES (11, 'Gas Giant', 2, 'Made of gas', false, false, NULL);
INSERT INTO public.planet VALUES (12, 'Treasure World', 2, 'Made of treasures I guess?', false, false, NULL);
INSERT INTO public.planet VALUES (13, 'Auric World', 2, 'Must have some pretty good vibes', false, false, NULL);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 5, 5, NULL);
INSERT INTO public.solar_system VALUES (2, 5, 4, NULL);
INSERT INTO public.solar_system VALUES (3, 4, 16, NULL);
INSERT INTO public.solar_system VALUES (4, 8, 10, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Alpha Andromedae', 2, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Beta Andromedae', 2, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Upsilon Andromedae', 2, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Delta Andromedae', 2, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Mu Andromedae', 2, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id UNIQUE (planet_id);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: solar_system solar_system_solar_system_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_solar_system_id UNIQUE (solar_system_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id UNIQUE (star_id);


--
-- Name: galaxy galaxy_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

