--- Drop tables in dependency order (project depends on organization)
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
VALUES (1, 'Community Center Renovation', 'Help restore and modernize the downtown community center so it can serve more families each week.', 'Downtown Community Center, Main St.', '2026-03-14');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (1, 'Affordable Housing Build', 'Join a volunteer construction crew to frame walls and install siding on a new affordable housing unit.', 'Maple Street Housing Site', '2026-04-05');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (1, 'Senior Home Accessibility Upgrade', 'Install ramps, grab bars, and other accessibility improvements in the homes of senior residents.', 'Riverside Senior Neighborhood', '2026-04-19');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (1, 'Public Park Bench Installation', 'Build and install new benches along the walking trails in the city park.', 'Evergreen City Park', '2026-05-10');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (1, 'Playground Equipment Repair', 'Sand, paint, and repair playground equipment at three elementary schools.', 'Lincoln, Jefferson, and Monroe Elementary', '2026-05-30');

--- Projects for GreenHarvest Growers (organization_id = 2)
INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (2, 'Rooftop Garden Installation', 'Help assemble raised beds and plant vegetables on the rooftop of a community-owned building.', '5th Avenue Co-op Rooftop', '2026-03-21');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (2, 'School Vegetable Garden', 'Plant and maintain a vegetable garden at a local elementary school as part of nutrition education.', 'Hillside Elementary School', '2026-04-11');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (2, 'Community Composting Workshop', 'Teach neighbors how to compost at home and distribute starter bins.', 'Oak Grove Neighborhood Hall', '2026-04-25');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (2, 'Urban Farm Harvest Festival', 'Volunteer at the fall harvest festival sharing produce and recipes with the community.', 'GreenHarvest Urban Farm', '2026-05-16');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (2, 'Seed Library Launch', 'Help catalog donated seeds and set up the first public seed library in the district.', 'Central Public Library', '2026-06-06');

--- Projects for UnityServe Volunteers (organization_id = 3)
INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (3, 'Food Bank Volunteer Drive', 'Sort, pack, and distribute food donations at the regional food bank.', 'Regional Food Bank Warehouse', '2026-03-28');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (3, 'Homeless Shelter Meal Service', 'Prepare and serve a warm dinner for guests at the downtown homeless shelter.', 'Hope House Shelter', '2026-04-18');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (3, 'Winter Coat Drive', 'Collect, clean, and distribute winter coats to families in need.', 'UnityServe Community Center', '2026-05-02');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (3, 'Senior Companion Program', 'Spend an afternoon visiting and reading with seniors at a local assisted living facility.', 'Pine Haven Assisted Living', '2026-05-23');

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES (3, 'Youth Tutoring Initiative', 'Mentor middle school students in reading and math after school.', 'Westside Community Library', '2026-06-13');
