--- Drop tables in dependency order (junction first, then dependents)
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS organization;

--- Create Table: organization
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

--- Insert data into organization table
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES (
    'BrightFuture Builders',
    'A nonprofit focused on improving community infrastructure through sustainable construction projects.',
    'info@brightfuturebuilders.org',
    'brightfuture-logo.png'
);

INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES (
    'GreenHarvest Growers',
    'An urban farming collective promoting food sustainability and education in local neighborhoods.',
    'contact@greenharvest.org',
    'greenharvest-logo.png'
);

INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES (
    'UnityServe Volunteers',
    'A volunteer coordination group supporting local charities and service initiatives.',
    'hello@unityserve.org',
    'unityserve-logo.png'
);

--- Create Table: project
CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    project_date DATE NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES organization (organization_id)
);

--- Insert data into project table
--- Projects for BrightFuture Builders (organization_id = 1)
INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (1, 'Community Center Renovation', 'Help restore and modernize the downtown community center so it can serve more families each week.', 'Downtown Community Center, Main St.', '2026-12-05');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (1, 'Affordable Housing Build', 'Join a volunteer construction crew to frame walls and install siding on a new affordable housing unit.', 'Maple Street Housing Site', '2026-12-19');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (1, 'Senior Home Accessibility Upgrade', 'Install ramps, grab bars, and other accessibility improvements in the homes of senior residents.', 'Riverside Senior Neighborhood', '2026-04-19');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (1, 'Public Park Bench Installation', 'Build and install new benches along the walking trails in the city park.', 'Evergreen City Park', '2026-05-10');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (1, 'Playground Equipment Repair', 'Sand, paint, and repair playground equipment at three elementary schools.', 'Lincoln, Jefferson, and Monroe Elementary', '2026-05-30');

--- Projects for GreenHarvest Growers (organization_id = 2)
INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (2, 'Rooftop Garden Installation', 'Help assemble raised beds and plant vegetables on the rooftop of a community-owned building.', '5th Avenue Co-op Rooftop', '2026-12-12');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (2, 'School Vegetable Garden', 'Plant and maintain a vegetable garden at a local elementary school as part of nutrition education.', 'Hillside Elementary School', '2027-01-09');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (2, 'Community Composting Workshop', 'Teach neighbors how to compost at home and distribute starter bins.', 'Oak Grove Neighborhood Hall', '2026-04-25');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (2, 'Urban Farm Harvest Festival', 'Volunteer at the fall harvest festival sharing produce and recipes with the community.', 'GreenHarvest Urban Farm', '2026-05-16');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (2, 'Seed Library Launch', 'Help catalog donated seeds and set up the first public seed library in the district.', 'Central Public Library', '2026-06-06');

--- Projects for UnityServe Volunteers (organization_id = 3)
INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (3, 'Food Bank Volunteer Drive', 'Sort, pack, and distribute food donations at the regional food bank.', 'Regional Food Bank Warehouse', '2027-01-16');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (3, 'Homeless Shelter Meal Service', 'Prepare and serve a warm dinner for guests at the downtown homeless shelter.', 'Hope House Shelter', '2026-04-18');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (3, 'Winter Coat Drive', 'Collect, clean, and distribute winter coats to families in need.', 'UnityServe Community Center', '2026-05-02');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (3, 'Senior Companion Program', 'Spend an afternoon visiting and reading with seniors at a local assisted living facility.', 'Pine Haven Assisted Living', '2026-05-23');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (3, 'Youth Tutoring Initiative', 'Mentor middle school students in reading and math after school.', 'Westside Community Library', '2026-06-13');

--- Create Table: category
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

--- Insert data into category table
INSERT INTO category (name) VALUES ('Construction & Infrastructure');
INSERT INTO category (name) VALUES ('Environment & Sustainability');
INSERT INTO category (name) VALUES ('Food & Nutrition');
INSERT INTO category (name) VALUES ('Youth & Education');
INSERT INTO category (name) VALUES ('Community Support');

--- Create Junction Table: project_category (N:M between project and category)
CREATE TABLE project_category (
    project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (project_id, category_id),
    FOREIGN KEY (project_id) REFERENCES project (project_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id)
);

--- Associate each project with at least one category
--- Category IDs: 1=Construction, 2=Environment, 3=Food, 4=Youth, 5=Community

--- BrightFuture Builders projects (1-5)
INSERT INTO project_category (project_id, category_id) VALUES (1, 1), (1, 5);
INSERT INTO project_category (project_id, category_id) VALUES (2, 1), (2, 5);
INSERT INTO project_category (project_id, category_id) VALUES (3, 1), (3, 5);
INSERT INTO project_category (project_id, category_id) VALUES (4, 1), (4, 2);
INSERT INTO project_category (project_id, category_id) VALUES (5, 1), (5, 4);

--- GreenHarvest Growers projects (6-10)
INSERT INTO project_category (project_id, category_id) VALUES (6, 2), (6, 3);
INSERT INTO project_category (project_id, category_id) VALUES (7, 3), (7, 4);
INSERT INTO project_category (project_id, category_id) VALUES (8, 2);
INSERT INTO project_category (project_id, category_id) VALUES (9, 3), (9, 5);
INSERT INTO project_category (project_id, category_id) VALUES (10, 2), (10, 5);

--- UnityServe Volunteers projects (11-15)
INSERT INTO project_category (project_id, category_id) VALUES (11, 3), (11, 5);
INSERT INTO project_category (project_id, category_id) VALUES (12, 3), (12, 5);
INSERT INTO project_category (project_id, category_id) VALUES (13, 5);
INSERT INTO project_category (project_id, category_id) VALUES (14, 5);
INSERT INTO project_category (project_id, category_id) VALUES (15, 4);
