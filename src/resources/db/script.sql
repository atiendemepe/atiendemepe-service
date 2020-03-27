create table products (
    id varchar(36) not null,
    name varchar(100) not null,
    type varchar(10) not null, -- REGULAR: Producto regular, PACKAGE: Paquete que incluye otros productos
    description varchar(255) not null,
    notes varchar(255),
    primary key (id)
);

create table product_presentations (
    id varchar(36) not null,
    product_id varchar(36) not null,
    name varchar(50) not null,
    description varchar(255) not null,
    price numeric(4) not null,
    currency char(3) not null,
    primary key (id),
    foreign key (product_id) references products(id)
);

create table product_by_package (
    package_product_id varchar(36) not null,
    product_presentation_id varchar(36) not null,
    primary key (package_product_id, product_presentation_id),
    foreign key (package_product_id) references products(id),
    foreign key (product_presentation_id) references product_presentations(id)
);

insert into products (id, name, type, description, notes) values ('06024039-24df-4de6-9be6-683960987d1e', 'Hamburguesa Bembos Clásica', 'REGULAR', 'Hamburguesa a la parrilla, lechuga, tomate y mayonesa', 'Promoción válida solo para Delivery Web y App Bembos.');
insert into products (id, name, type, description, notes) values ('6d043337-d1d5-4784-984c-62745314e993', 'Promo Bembos Clásica', 'PACKAGE', 'Clásica Mediana + 1 Papa Mediana + 1 Gaseosa personal.', 'Promoción válida solo para Delivery Web y App Bembos.');
insert into products (id, name, type, description) values ('77e78849-a7ac-4ca6-af3f-fba4dee624ad', 'Gaseosa 450ml ', 'EXTRA', 'Gaseosa 450ml');

insert into product_presentations (id, product_id, name, description, price, currency) values ('c8e2c355-6fe0-4cab-98dc-8d12bd4f5524', '06024039-24df-4de6-9be6-683960987d1e', 'Mediana', 'Hamburguesa Bembos Clásica Mediana', 10.9, 'PEN');
insert into product_presentations (id, product_id, name, description, price, currency) values ('e7a9fab6-f5eb-41ae-9521-2338ba0f2291', '06024039-24df-4de6-9be6-683960987d1e', 'Grande', 'Hamburguesa Bembos Clásica Grande', 13.9, 'PEN');
insert into product_presentations (id, product_id, name, description, price, currency) values ('b84bb53d-175e-47be-becc-a838e2c1b636', '77e78849-a7ac-4ca6-af3f-fba4dee624ad', 'Inca Kola 450 ml', 'Inca Kola 450 ml', 3.9, 'PEN');

insert into product_presentations (id, product_id, name, description, price, currency) values ('6cbf394e-d682-4995-aa31-21c884ad4957', '6d043337-d1d5-4784-984c-62745314e993', 'Promo Bembos Clásica', 'Promo Bembos Clásica', 13.9, 'PEN');

insert into product_by_package (package_product_id, product_presentation_id) values ('6d043337-d1d5-4784-984c-62745314e993', 'c8e2c355-6fe0-4cab-98dc-8d12bd4f5524');
insert into product_by_package (package_product_id, product_presentation_id) values ('6d043337-d1d5-4784-984c-62745314e993', 'b84bb53d-175e-47be-becc-a838e2c1b636');