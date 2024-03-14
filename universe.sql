-- universe.sql

-- psql —username=freecodecamp —dbname=universe

DROP DATABASE IF EXISTS universe;
create database universe;

\c universe;

CREATE TABLE galaxy (
galaxy_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE,
type VARCHAR(50) NOT NULL,
magnitude NUMERIC,
constellation VARCHAR(50));

INSERT INTO galaxy (name, type, magnitude, constellation)
VALUES('Milky Way', 'Spiral', -20.9, 'Sagittarius'),
('Large Magellanic Cloud', 'Irregular', 0.9, 'Dorado'),
('Small Magellanic Cloud', 'Irregular', 2.7, 'Tucana'),
('Andromeda Galaxy', 'Spiral', 3.44, 'Andromeda'),
('Messier 31', 'Spiral', 3.44, 'Andromeda'),
('Triangulum Galaxy', 'Spiral', 5.72, 'Triangulum'),
('Messier 33', 'Spiral', 5.72, 'Triangulum'),
('Messier 81', 'Spiral', 6.94, 'Ursa Major'),
('Galaxy 9', 'Irregular', 4.75, 'Ursa Minor');

CREATE TABLE star (
star_id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE,
size_in_miles NUMERIC,
type VARCHAR(15) NOT NULL,
galaxy_id INTEGER REFERENCES galaxy(galaxy_id)
);

INSERT INTO star (name, size_in_miles, type, galaxy_id)
VALUES
('Sun', 864340, 'G-type', 1),
('Alpha Centauri A', 1252580000, 'G-type', 1),
('Betelgeuse', 7000000000, 'M-type', 1),
('Sirius', 1075437400, 'A-type', 1),
('Proxima Centauri', 96560264, 'M-type', 1),
('Arcturus', 25899776000, 'K-type', 1),
('Rigel', 57070752000, 'B-type', 1),
('Andromeda Sun', 864340, 'G-type', 2),
('M31-Red Giant', 9000000000, 'K-type', 2),
('Triangulum Star 1', 1252580000, 'G-type', 3),
('LMC Star 1', 7000000000, 'M-type', 4),
('SMC Star 1', 1252580000, 'F-type', 5),
('Orion Star', 864340, 'B-type', 6),
('Centaurus A Star', 1252580000, 'K-type', 7),
('Virgo Star', 7000000000, 'G-type', 8);

CREATE TABLE planet (
planet_id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE,
mass_in_kg NUMERIC,
radius_km INT,
no_of_moons INT NOT NULL,
type VARCHAR(30),
is_habitable BOOLEAN,
galaxy_id INT REFERENCES galaxy(galaxy_id),
star_id INT REFERENCES star(star_id)
);

INSERT INTO planet (name, mass_in_kg, radius_km, no_of_moons, type, is_habitable, galaxy_id, star_id)
VALUES
-- Planets from the Milky Way galaxy
('Mercury', 3.285e23, 2439, 0, 'Terrestrial', FALSE, 1, 1),
('Venus', 4.867e24, 6052, 0, 'Terrestrial', FALSE, 1, 1),
('Earth', 5.972e24, 6371, 1, 'Terrestrial', TRUE, 1, 1),
('Mars', 6.39e23, 3390, 2, 'Terrestrial', FALSE, 1, 1),
('Jupiter', 1.898e27, 69911, 79, 'Gas Giant', FALSE, 1, 1),
('Saturn', 5.683e26, 58232, 82, 'Gas Giant', FALSE, 1, 1),
('Uranus', 8.681e25, 25362, 27, 'Ice Giant', FALSE, 1, 1),
('Neptune', 1.024e26, 24622, 14, 'Ice Giant', FALSE, 1, 1),
-- Planets associated with stars in the star table and other galaxies
('Proxima Centauri b', 1.3e25, 7738, 0, 'Terrestrial', TRUE, 2, 5),
('Kepler-22b', 6.4e24, 12349, 0, 'Super-Earth', TRUE, 3, 10),
('TRAPPIST-1e', 2.9e24, 5748, 0, 'Terrestrial', TRUE, 4, 7),
('HD 209458 b', 1.485e27, 94500, 0, 'Gas Giant', FALSE, 5, 11),
('OGLE-2016-BLG-1190Lb', 3.2e25, 14000, 0, 'Super-Earth', TRUE, 6, 13),
('Gliese 581c', 5.35e24, 11827, 0, 'Terrestrial', TRUE, 7, 8),
('PSR B1257+12 b', 2.4e24, 7338, 0, 'Terrestrial', FALSE, 8, 2),
('WASP-12b', 1.4e29, 250000, 0, 'Hot Jupiter', FALSE, 9, 4),
('OGLE-2005-BLG-390Lb', 1.4e25, 22000, 0, 'Super-Earth', TRUE, 1, 9),
('PSR J1719-1438 b', 1.4e27, 152000, 0, 'Exotic', FALSE, 1, 6),
('51 Pegasi b', 4.5e26, 78700, 0, 'Hot Jupiter', FALSE, 2, 3),
('KELT-9b', 1.8e28, 300000, 0, 'Hot Jupiter', FALSE, 3, 15),
('KELT-16b', 1.3e29, 350000, 0, 'Hot Jupiter', FALSE, 4, 12),
('Kepler-16b', 3.7e26, 86500, 0, 'Circumbinary', FALSE, 5, 11),
('Gliese 436 b', 1.5e26, 66760, 0, 'Warm Neptune', FALSE, 6, 6),
('Kepler-10b', 3.3e26, 120000, 0, 'Hot Earth', FALSE, 7, 7),
('HD 189733 b', 1.1e27, 106000, 0, 'Hot Jupiter', FALSE, 8, 1),
('KOI-1843.03', 8.1e25, 19400, 0, 'Super-Earth', TRUE, 2, 4),
('WASP-18b', 3.4e29, 360000, 0, 'Hot Jupiter', FALSE, 3, 10),
('Kepler-78b', 2.7e27, 9400, 0, 'Terrestrial', FALSE, 5, 5),
('55 Cancri e', 8.63e26, 78650, 0, 'Super-Earth', FALSE, 6, 9),
('Gliese 581d', 2.2e26, 20220, 0, 'Super-Earth', TRUE, 7, 11),
('OGLE-2013-BLG-0341LBb', 3.8e25, 12450, 0, 'Super-Earth', TRUE, 8, 13),
('Gliese 876 d', 1.9e26, 21380, 0, 'Super-Earth', TRUE, 9, 8);

CREATE TABLE moon(
moon_id SERIAL PRIMARY KEY,
name VARCHAR NOT NULL UNIQUE,
orbit_period_days INT NOT NULL,
mean_distance_from_planet_km BIGINT,
has_atmosphere BOOLEAN,
planet_id INT REFERENCES planet(planet_id));

INSERT INTO moon (name, orbit_period_days, mean_distance_from_planet_km, has_atmosphere, planet_id)
VALUES
('Moon', 27.3, 384400, TRUE, 3),
('Phobos', 0.3, 9378, FALSE, 4),
('Deimos', 1.3, 23460, FALSE, 4),
('Metis', 0.3, 128000, FALSE, 5),
('Adrastea', 0.3, 129000, FALSE, 5),
('Amalthea', 0.5, 181400, FALSE, 5),
('Thebe', 0.7, 221900, FALSE, 5),
('Io', 1.8, 421700, TRUE, 5),
('Europa', 3.6, 671100, TRUE, 5),
('Ganymede', 7.2, 1070400, TRUE, 5),
('Callisto', 16.7, 1882700, TRUE, 5),
('Themisto', 130, 74993000, FALSE, 5),
('Leda', 238, 11193000, FALSE, 5),
('Himalia', 250, 11461000, FALSE, 5),
('Lysithea', 259, 11720000, FALSE, 5),
('Elara', 259, 11741000, FALSE, 5),
('Dia', 277, 12404000, FALSE, 5),
('Carpo', 458, 17083000, FALSE, 5),
('S/2003 J 12', 498, 17900000, FALSE, 5),
('Valetudo', 670, 23504000, FALSE, 5),
('Euporie', 580, 19602000, FALSE, 5),
('S/2003 J 3', 552, 20086000, FALSE, 5),
('S/2003 J 18', 551, 20071000, FALSE, 5),
('S/2003 J 16', 628, 21983000, FALSE, 5),
('S/2003 J 19', 744, 23967000, FALSE, 5),
('S/2003 J 15', 732, 23732000, FALSE, 5),
('S/2010 J 1', 618, 21673000, FALSE, 5),
('S/2003 J 10', 724, 23596000, FALSE, 5),
('S/2003 J 23', 739, 24069000, FALSE, 5),
('S/2017 J 1', 538, 19673000, FALSE, 5),
('S/2011 J 2', 628, 21773000, FALSE, 5),
('S/2003 J 4', 682, 22814000, FALSE, 5),
('S/2003 J 9', 629, 21743000, FALSE, 5),
('S/2003 J 2', 704, 23269000, FALSE, 5),
('S/2003 J 5', 631, 21793000, FALSE, 5),
('S/2003 J 7', 634, 21913000, FALSE, 5),
('S/2003 J 6', 659, 22372000, FALSE, 5),
('S/2017 J 8', 622, 21524000, FALSE, 5),
('S/2010 J 2', 652, 22214000, FALSE, 5),
('S/2003 J 1', 700, 23169000, FALSE, 5),
('Pan', 0.6, 133584, FALSE, 6),
('Atlas', 0.6, 137670, FALSE, 6),
('Prometheus', 0.6, 139350, FALSE, 6),
('Pandora', 0.6, 141700, FALSE, 6),
('Epimetheus', 0.7, 151422, FALSE, 6),
('Janus', 0.7, 151472, FALSE, 6),
('Mimas', 0.9, 185539, FALSE, 6),
('Enceladus', 1.4, 238037, TRUE, 6),
('Tethys', 1.9, 294672, FALSE, 6),
('Telesto', 1.9, 294672, FALSE, 6),
('Calypso', 1.9, 294672, FALSE, 6),
('Dione', 2.7, 377415, FALSE, 6),
('Helene', 2.7, 377417, FALSE, 6),
('Rhea', 4.5, 527108, FALSE, 6),
('Titan', 15.9, 1221848, TRUE, 6),
('Hyperion', 21.3, 1481010, FALSE, 6),
('Iapetus', 79.3, 3560820, FALSE, 6),
('Phoebe', 550.5, 12947500, FALSE, 6),
('Aegaeon', 0.3, 167500, FALSE, 6),
('Cordelia', 0.34, 49800, FALSE, 7);


CREATE TABLE organization(
  organization_id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  country TEXT NOT NULL,
  is_public BOOLEAN);

INSERT INTO organization(name, country, is_public)
VALUES
('NASA', 'United States', TRUE),
('European Space Agency (ESA)', 'Europe', TRUE),
('Roscosmos', 'Russia', TRUE),
('Indian Space Research Organisation (ISRO)', 'India', TRUE),
('China National Space Administration (CNSA)', 'China', TRUE),
('SpaceX', 'USA', FALSE);
