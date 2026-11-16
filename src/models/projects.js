import db from './db.js';

const getAllProjects = async () => {
    const query = `
        SELECT
            project.project_id,
            project.title,
            project.description,
            project.location,
            project.project_date,
            organization.organization_id,
            organization.name AS organization_name
        FROM public.project
        INNER JOIN public.organization
            ON project.organization_id = organization.organization_id
        ORDER BY project.project_date ASC;
    `;

    const result = await db.query(query);

    return result.rows;
};

export { getAllProjects };
