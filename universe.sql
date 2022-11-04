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
    diameter integer,
    mass_in_kg numeric,
    description text,
    has_life boolean,
    constellation character varying(100),
    universe_id integer NOT NULL,
    name character varying(100) NOT NULL
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
    name character varying(100) NOT NULL,
    diameter integer,
    mass_in_kg numeric,
    description text,
    has_life boolean,
    name_unique character varying(100) NOT NULL,
    planet_id integer
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
    name character varying(100) NOT NULL,
    diameter integer,
    mass_in_kg numeric,
    description text,
    has_life boolean,
    name_unique character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    diameter integer,
    mass_in_kg numeric,
    description text,
    is_unique_in_galaxy boolean,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer
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
-- Name: universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe (
    universe_id integer NOT NULL,
    name character varying(100) NOT NULL,
    info text
);


ALTER TABLE public.universe OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_universe_id_seq OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_universe_id_seq OWNED BY public.universe.universe_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: universe universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe ALTER COLUMN universe_id SET DEFAULT nextval('public.universe_universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 1000, 10000, 'Andromeda, wich is shortened from "Andromeda Galaxy", gets its name from the area of the sky in wich it appears, the constellation of Andromeda.', false, 'Andromeda', 1, 'Andromeda Galaxy');
INSERT INTO public.galaxy VALUES (2, 2000, 20000, 'Appearance is similar to an insects antennae.', false, 'Corvus', 1, 'Antennae Galaxies');
INSERT INTO public.galaxy VALUES (3, 3000, 30000, 'It appears to rotate backwards, as the tips of sipral arms point in the direction of rotation.', false, 'Centaurus', 1, 'Backward Galaxy');
INSERT INTO public.galaxy VALUES (4, 3000, 30000, 'It has a spectacular dark band of absorbing dust in front of the galaxys bright nucleus, giving rise to its nicknames of the Black Eye or Evil Eye Galaxy.', false, 'Coma Berenices', 1, 'Black Eye Galaxy');
INSERT INTO public.galaxy VALUES (5, 4000, 40000, 'Looks are similar to a butterfly.', false, 'Virgo', 1, 'Butterfly Galaxies');
INSERT INTO public.galaxy VALUES (6, 4000, 40000, 'Its visual appearence is similar to that of a spoked cartwheel.', false, 'Sculptor', 1, 'Cartwheel Galaxy');
INSERT INTO public.galaxy VALUES (7, 5000, 50000, 'This is our galaxy', true, 'Solar', 1, 'Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 10, 100, 'Our own an unique Moon', false, 'Moon', 3);
INSERT INTO public.moon VALUES (2, 'The Moon 0', 10, 100, 'Moon 0', false, 'Moon 0', 1);
INSERT INTO public.moon VALUES (3, 'The Moon 1', 10, 100, 'Moon 1', false, 'Moon 1', 2);
INSERT INTO public.moon VALUES (4, 'The Moon 2', 10, 100, 'Moon 2', false, 'Moon 2', 4);
INSERT INTO public.moon VALUES (5, 'The Moon 3', 10, 100, 'Moon 3', false, 'Moon 3', 5);
INSERT INTO public.moon VALUES (6, 'The Moon 4', 10, 100, 'Moon 4', false, 'Moon 4', 5);
INSERT INTO public.moon VALUES (7, 'The Moon 5', 10, 100, 'Moon 5', false, 'Moon 5', 6);
INSERT INTO public.moon VALUES (8, 'The Moon 6', 10, 100, 'Moon 6', false, 'Moon 6', 7);
INSERT INTO public.moon VALUES (9, 'The Moon 7', 10, 100, 'Moon 7', false, 'Moon 7', 7);
INSERT INTO public.moon VALUES (10, 'The Moon 8', 10, 100, 'Moon 8', false, 'Moon 8', 8);
INSERT INTO public.moon VALUES (11, 'The Moon 9', 10, 100, 'Moon 9', false, 'Moon 9', 9);
INSERT INTO public.moon VALUES (12, 'The Moon 10', 10, 100, 'Moon 10', false, 'Moon 10', 9);
INSERT INTO public.moon VALUES (13, 'The Moon 11', 10, 100, 'Moon 11', false, 'Moon 11', 9);
INSERT INTO public.moon VALUES (14, 'The Moon 12', 10, 100, 'Moon 12', false, 'Moon 12', 6);
INSERT INTO public.moon VALUES (15, 'The Moon 13', 10, 100, 'Moon 13', false, 'Moon 13', 5);
INSERT INTO public.moon VALUES (16, 'The Moon 14', 10, 100, 'Moon 14', false, 'Moon 14', 6);
INSERT INTO public.moon VALUES (17, 'The Moon 15', 10, 100, 'Moon 15', false, 'Moon 15', 10);
INSERT INTO public.moon VALUES (18, 'The Moon 16', 10, 100, 'Moon 16', false, 'Moon 16', 8);
INSERT INTO public.moon VALUES (19, 'The Moon 17', 10, 100, 'Moon 17', false, 'Moon 17', 8);
INSERT INTO public.moon VALUES (20, 'The Moon 18', 10, 100, 'Moon 18', false, 'Moon 18', 8);
INSERT INTO public.moon VALUES (21, 'The Moon 19', 10, 100, 'Moon 19', false, 'Moon 19', 8);
INSERT INTO public.moon VALUES (22, 'The Moon 20', 10, 100, 'Moon 20', false, 'Moon 20', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 100, 1000, 'Planeta Mercurio', false, 'Mercurio', 7, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 200, 2000, 'Planeta Venus', false, 'Venus', 7, 1);
INSERT INTO public.planet VALUES (4, 'Marte', 400, 4000, 'Planeta Marte', false, 'Marte', 7, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 400, 4000, 'Planeta Jupiter', false, 'Jupiter', 7, 1);
INSERT INTO public.planet VALUES (6, 'Saturno', 400, 4000, 'Planeta Saturno', false, 'Saturno', 7, 1);
INSERT INTO public.planet VALUES (7, 'Urano', 400, 4000, 'Planeta Urano', false, 'Urano', 7, 1);
INSERT INTO public.planet VALUES (8, 'Neptuno', 400, 4000, 'Planeta Neptuno', false, 'Neptuno', 7, 1);
INSERT INTO public.planet VALUES (9, 'Plutão', 400, 4000, 'Planeta Plutão', false, 'Plutão', 7, 1);
INSERT INTO public.planet VALUES (3, 'Terra', 300, 3000, 'Planeta Terra', true, 'Terra', 7, 1);
INSERT INTO public.planet VALUES (10, 'RP-N1', 400, 4000, 'Planeta RP-N1', false, 'RP-N2', 6, 2);
INSERT INTO public.planet VALUES (11, 'RP-N2D', 400, 4000, 'Planeta RP-N2D', false, 'RP-N2D', 6, 2);
INSERT INTO public.planet VALUES (12, 'RP-N3D', 400, 4000, 'Planeta RP-N3D', false, 'RP-N3D', 6, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (100, 50000000, 'The Massive Sun', true, 'Sun', 1, 7);
INSERT INTO public.star VALUES (100, 50000000, 'The Andromeda Sun', true, 'Andromeda Sun', 2, 1);
INSERT INTO public.star VALUES (100, 50000000, 'The Corvus Sun', true, 'Corvus Sun', 3, 2);
INSERT INTO public.star VALUES (100, 50000000, 'The Centaurus Sun', true, 'Centaurus Sun', 4, 3);
INSERT INTO public.star VALUES (100, 50000000, 'The Coma Berenices Sun', true, 'CB Sun', 5, 4);
INSERT INTO public.star VALUES (100, 50000000, 'The Virgo Sun', true, 'Virgo Sun', 6, 5);
INSERT INTO public.star VALUES (100, 50000000, 'The Sculptor Sun', true, 'Sculptor Sun', 7, 6);


--
-- Data for Name: universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe VALUES (1, 'The Universe', NULL);
INSERT INTO public.universe VALUES (2, 'The MetaVerse', NULL);
INSERT INTO public.universe VALUES (3, 'The MekaVerse', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: universe_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_universe_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique_key UNIQUE (name_unique);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique_key UNIQUE (name_unique);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: universe universe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_name_key UNIQUE (name);


--
-- Name: universe universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_pkey PRIMARY KEY (universe_id);


--
-- Name: galaxy galaxy_universe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_universe_id_fkey FOREIGN KEY (universe_id) REFERENCES public.universe(universe_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

