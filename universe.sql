--
-- PostgreSQL database dump
--DATA stored are random and not accurate don't use in real projects

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
-- Name: celestial_boject; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_boject (
    celestial_boject_id numeric NOT NULL,
    moon_id integer,
    planet_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.celestial_boject OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    description text,
    age_in_millions_of_year double precision,
    num_stars integer
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
    name character varying(30),
    description text,
    is_spherical boolean,
    age_in_millions_of_year double precision,
    planet_id integer NOT NULL,
    distance integer
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
    name character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_type character varying(60),
    star_id integer NOT NULL,
    distance integer
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
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    has_planet boolean,
    age_in_millions_of_year double precision,
    luminosity double precision,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_stars_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_stars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_stars_id_seq OWNER TO freecodecamp;

--
-- Name: stars_stars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_stars_id_seq OWNED BY public.star.star_id;


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

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_stars_id_seq'::regclass);


--
-- Data for Name: celestial_boject; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_boject VALUES (1, 1, 1, NULL);
INSERT INTO public.celestial_boject VALUES (2, 2, 1, NULL);
INSERT INTO public.celestial_boject VALUES (3, 2, 1, NULL);
INSERT INTO public.celestial_boject VALUES (4, 3, 4, NULL);
INSERT INTO public.celestial_boject VALUES (5, 5, 4, NULL);
INSERT INTO public.celestial_boject VALUES (6, 6, 5, NULL);
INSERT INTO public.celestial_boject VALUES (7, 7, 5, NULL);
INSERT INTO public.celestial_boject VALUES (8, 8, 5, NULL);
INSERT INTO public.celestial_boject VALUES (9, 9, 6, NULL);
INSERT INTO public.celestial_boject VALUES (10, 10, 6, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our home Galaxy', 13600, 200000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Spiral', 'Closest major Galaxy to Milky Way', 10000, 10000000);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 'Spiral', 'A grand design spiral galaxy', 400, 1000000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'Lenticular', 'A galaxy with dust lane', 13000, 10000000);
INSERT INTO public.galaxy VALUES (5, 'Carina Dwarf', 'Dwarf', 'A dwarf spheroidal galaxy in the local group', 13000, 100000);
INSERT INTO public.galaxy VALUES (6, 'Sculptor Dwarf', 'Dwarf', 'A dwarf elliptical galaxy of local group', 13000, 200000);
INSERT INTO public.galaxy VALUES (7, 'Pinwheel Galaxy', 'Spiral', 'A face-on spiral galaxy', 100, 100000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'The only natural satellite of Earth', true, 4530, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and closer if the two moons of Mars', false, 4500, 2, NULL);
INSERT INTO public.moon VALUES (3, 'Ganymede', 'The largest and massive moon in the solar system', true, 4500, 3, NULL);
INSERT INTO public.moon VALUES (4, 'Titan', 'The largest moon of Saturn', true, 4500, 4, NULL);
INSERT INTO public.moon VALUES (5, 'Enceladous', 'a small icy moon of Saturn', true, 4500, 3, NULL);
INSERT INTO public.moon VALUES (6, 'Calisto', 'Jupitor''s second largest moon', true, 4500, 3, NULL);
INSERT INTO public.moon VALUES (7, 'Io', 'Jupitor''s volcanically active moon', false, 4500, 3, NULL);
INSERT INTO public.moon VALUES (8, 'Europa', 'Jupitor''s Icy moon', true, 4500, 3, NULL);
INSERT INTO public.moon VALUES (9, 'Enceladous', 'Saturn''s Icy moon', true, 3500, 4, NULL);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Saturn''s smallest roundest moon', true, 1500, 4, NULL);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Saturn''s second largest moon', true, 4500, 4, NULL);
INSERT INTO public.moon VALUES (12, 'Dione', 'Saturn''s fourth largest moon', true, 3500, 4, NULL);
INSERT INTO public.moon VALUES (13, 'Iapetus', 'Saturn''s two tonned moon', true, 4500, 4, NULL);
INSERT INTO public.moon VALUES (14, 'Phoebe', 'Saturn''s irregular retrogated moon', false, 2500, 4, NULL);
INSERT INTO public.moon VALUES (15, 'Callisto', 'Jupitor''s second largest moon', false, 4500, 3, NULL);
INSERT INTO public.moon VALUES (16, 'Hyperion', 'Saturn''s spongy irregular moon', false, 1500, 4, NULL);
INSERT INTO public.moon VALUES (18, 'Charon', 'Pluto''s largest moon', true, 4500, 8, NULL);
INSERT INTO public.moon VALUES (19, 'Nix', 'Pluto''s small irregular shaped moon', false, 2300, 8, NULL);
INSERT INTO public.moon VALUES (20, 'Hydra', 'Pluto''s farthest moon', true, 3500, 8, NULL);
INSERT INTO public.moon VALUES (17, 'Triton', 'Neptune''s largest moon', true, 4500, 13, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (5, 'Kepler-16b', 'An exoplanet orbiting the binary system', false, true, 'Exoplanet', 5, NULL);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Sixth planet from the Sun, known for its ring.', false, true, 'Terrestrial', 4, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'The largest planet', false, true, 'Gas Giant', 3, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 'The Red planet', false, true, 'Terrestrial', 2, NULL);
INSERT INTO public.planet VALUES (1, 'Earth', 'Our mother planet', true, true, 'Terrestrial', 1, NULL);
INSERT INTO public.planet VALUES (6, 'Uranus', 'The seventh planet in the solar system', false, true, 'Ice Giant', 1, NULL);
INSERT INTO public.planet VALUES (7, 'Eris', 'A dwarf planet in the disk region of Solar System', false, true, 'Dwarf Planet', 5, NULL);
INSERT INTO public.planet VALUES (8, 'Pluto', 'A dwarf planet in the Kuiper-Belt', false, true, 'Dwarf Planet', 2, NULL);
INSERT INTO public.planet VALUES (9, 'Mercury', 'The smallest planet in the Solar System', false, true, 'Terrestrial', 4, NULL);
INSERT INTO public.planet VALUES (10, 'MakeMake', 'A dwarf planet in the Kuiper-Belt, lasrgest one', false, true, 'Dwarf Planet', 1, NULL);
INSERT INTO public.planet VALUES (11, 'Haumea', 'A dwarf planet in the Kuiper_belt, elongated shaped', false, true, 'Dwarf Planet', 1, NULL);
INSERT INTO public.planet VALUES (12, 'Sedna', 'A trans-Neptunian object', false, true, 'Trans-Neptunian object', 3, NULL);
INSERT INTO public.planet VALUES (13, 'Neptune', 'Neptune is the 8th planet and most distant from Sun in the solar system', false, true, 'Terrestrial', 5, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centuari', 'The closest star to Sun', true, 4600, 0.0017, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'A red supergiant starin Orion', false, 10, 14000, 2);
INSERT INTO public.star VALUES (3, 'Serius', 'The brightest star in night sky', true, 230, 25, 3);
INSERT INTO public.star VALUES (4, 'Vega', 'A sequence star in constilation Lyra', true, 455, 40, 4);
INSERT INTO public.star VALUES (5, 'Polaris', 'The North Star', true, 70, 2000, 5);
INSERT INTO public.star VALUES (7, 'Deneb', 'A blue-white supergiant star in Cygnus', false, 7, 19600, 6);
INSERT INTO public.star VALUES (8, 'Fomalhaut', 'A main-sequence A-type star', true, 440, 17, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: stars_stars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_stars_id_seq', 8, true);


--
-- Name: celestial_boject celestial_boject_object_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_boject
    ADD CONSTRAINT celestial_boject_object_id_key UNIQUE (celestial_boject_id);


--
-- Name: celestial_boject celestial_boject_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_boject
    ADD CONSTRAINT celestial_boject_pkey PRIMARY KEY (celestial_boject_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: celestial_boject celestial_boject_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_boject
    ADD CONSTRAINT celestial_boject_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: celestial_boject celestial_boject_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_boject
    ADD CONSTRAINT celestial_boject_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_stars_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_stars_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star stars_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

