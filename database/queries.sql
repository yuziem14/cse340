-- Query 1
insert into public.account (
        account_firstname,
        account_lastname,
        account_email,
        account_password
    )
VALUES (
        'Tony',
        'Stark',
        'tony@starkent.com',
        'Iam1ronM@n'
    );
-- Query 2
update public.account
set account_type = 'Admin'
where account_firstname ilike 'Tony'
    and account_lastname ilike 'Stark';
-- Query 3
delete from public.account
where account_firstname ilike 'Tony'
    and account_lastname ilike 'Stark';
-- Query 4
update public.inventory
set inv_description = replace(
        inv_description,
        'small interiors',
        'a huge interior'
    )
where inv_make ilike 'GM'
    and inv_model ilike 'Hummer';
-- Query 5
select i.inv_make,
    i.inv_model,
    c.classification_name
from public.inventory as i
    inner join public.classification as c on i.classification_id = c.classification_id
where c.classification_name ilike 'sport';
-- Query 6
update public.inventory
set inv_image = replace(inv_image, '/images/', '/images/vehicles/'),
    inv_thumbnail = replace(inv_thumbnail, '/images/', '/images/vehicles/');