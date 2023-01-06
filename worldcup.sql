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
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    year integer NOT NULL,
    round character varying(100) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
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
    name character varying(100) NOT NULL
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

INSERT INTO public.games VALUES (161, 4, 2, 2018, 'Final', 176, 177);
INSERT INTO public.games VALUES (162, 2, 0, 2018, 'Third Place', 178, 179);
INSERT INTO public.games VALUES (163, 2, 1, 2018, 'Semi-Final', 177, 179);
INSERT INTO public.games VALUES (164, 1, 0, 2018, 'Semi-Final', 176, 178);
INSERT INTO public.games VALUES (165, 3, 2, 2018, 'Quarter-Final', 177, 180);
INSERT INTO public.games VALUES (166, 2, 0, 2018, 'Quarter-Final', 179, 181);
INSERT INTO public.games VALUES (167, 2, 1, 2018, 'Quarter-Final', 178, 182);
INSERT INTO public.games VALUES (168, 2, 0, 2018, 'Quarter-Final', 176, 183);
INSERT INTO public.games VALUES (169, 2, 1, 2018, 'Eighth-Final', 179, 184);
INSERT INTO public.games VALUES (170, 1, 0, 2018, 'Eighth-Final', 181, 185);
INSERT INTO public.games VALUES (171, 3, 2, 2018, 'Eighth-Final', 178, 186);
INSERT INTO public.games VALUES (172, 2, 0, 2018, 'Eighth-Final', 182, 187);
INSERT INTO public.games VALUES (173, 2, 1, 2018, 'Eighth-Final', 177, 188);
INSERT INTO public.games VALUES (174, 2, 1, 2018, 'Eighth-Final', 180, 189);
INSERT INTO public.games VALUES (175, 2, 1, 2018, 'Eighth-Final', 183, 190);
INSERT INTO public.games VALUES (176, 4, 3, 2018, 'Eighth-Final', 176, 191);
INSERT INTO public.games VALUES (177, 1, 0, 2014, 'Final', 192, 191);
INSERT INTO public.games VALUES (178, 3, 0, 2014, 'Third Place', 193, 182);
INSERT INTO public.games VALUES (179, 1, 0, 2014, 'Semi-Final', 191, 193);
INSERT INTO public.games VALUES (180, 7, 1, 2014, 'Semi-Final', 192, 182);
INSERT INTO public.games VALUES (181, 1, 0, 2014, 'Quarter-Final', 193, 194);
INSERT INTO public.games VALUES (182, 1, 0, 2014, 'Quarter-Final', 191, 178);
INSERT INTO public.games VALUES (183, 2, 1, 2014, 'Quarter-Final', 182, 184);
INSERT INTO public.games VALUES (184, 1, 0, 2014, 'Quarter-Final', 192, 176);
INSERT INTO public.games VALUES (185, 2, 1, 2014, 'Eighth-Final', 182, 195);
INSERT INTO public.games VALUES (186, 2, 0, 2014, 'Eighth-Final', 184, 183);
INSERT INTO public.games VALUES (187, 2, 0, 2014, 'Eighth-Final', 176, 196);
INSERT INTO public.games VALUES (188, 2, 1, 2014, 'Eighth-Final', 192, 197);
INSERT INTO public.games VALUES (189, 2, 1, 2014, 'Eighth-Final', 193, 187);
INSERT INTO public.games VALUES (190, 2, 1, 2014, 'Eighth-Final', 194, 198);
INSERT INTO public.games VALUES (191, 1, 0, 2014, 'Eighth-Final', 191, 185);
INSERT INTO public.games VALUES (192, 2, 1, 2014, 'Eighth-Final', 178, 199);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (176, 'France');
INSERT INTO public.teams VALUES (177, 'Croatia');
INSERT INTO public.teams VALUES (178, 'Belgium');
INSERT INTO public.teams VALUES (179, 'England');
INSERT INTO public.teams VALUES (180, 'Russia');
INSERT INTO public.teams VALUES (181, 'Sweden');
INSERT INTO public.teams VALUES (182, 'Brazil');
INSERT INTO public.teams VALUES (183, 'Uruguay');
INSERT INTO public.teams VALUES (184, 'Colombia');
INSERT INTO public.teams VALUES (185, 'Switzerland');
INSERT INTO public.teams VALUES (186, 'Japan');
INSERT INTO public.teams VALUES (187, 'Mexico');
INSERT INTO public.teams VALUES (188, 'Denmark');
INSERT INTO public.teams VALUES (189, 'Spain');
INSERT INTO public.teams VALUES (190, 'Portugal');
INSERT INTO public.teams VALUES (191, 'Argentina');
INSERT INTO public.teams VALUES (192, 'Germany');
INSERT INTO public.teams VALUES (193, 'Netherlands');
INSERT INTO public.teams VALUES (194, 'Costa Rica');
INSERT INTO public.teams VALUES (195, 'Chile');
INSERT INTO public.teams VALUES (196, 'Nigeria');
INSERT INTO public.teams VALUES (197, 'Algeria');
INSERT INTO public.teams VALUES (198, 'Greece');
INSERT INTO public.teams VALUES (199, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 192, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 199, true);


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
-- PostgreSQL database dump complete
--

