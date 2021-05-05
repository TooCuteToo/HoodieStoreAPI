use Master

create database Shopping

use Shopping

create table Customer (
   customerId int identity(1, 1),
   fullName nvarchar(100),
   email varchar(100),
   userName varchar(30),
   pass varchar(10),

   constraint PK_CustomerId primary key (customerId)
)

create table ProductsType (
    typeId varchar(4),
    typeName nvarchar(30),

    constraint PK_TypeID primary key (typeID)
)

create table Products (
    Id int identity(1, 1),
    typeId varchar(4),
    name nvarchar(30),
    description nvarchar(300),
    material nvarchar(300),
    price decimal,
    img nvarchar(20),

    constraint PK_ID primary key (Id),
    constraint FK_TypeID foreign key (typeId) references ProductsType (typeId)
)

create table ProductOrder (
    orderId int identity(1, 1),
    customerId int,
    totalMoney float,

    constraint PK_OrderId primary key (orderId),
    constraint FK_Customer foreign key (customerId) references Customer(customerId)
)

drop table ProductOrder
drop table OrderDetail

insert into ProductOrder(customerId, totalMoney)
values(1, 390)

insert into ProductOrder(customerId, totalMoney)
values(1, 200)

insert into ProductOrder(customerId, totalMoney)
values(2, 3200)

create table OrderDetail (
    orderId int,
    Id int,
    typeId varchar(4),
    quantity int,
    money float

    constraint PK_orderId_Id primary key (orderId, Id),
    constraint FK_orderId foreign key (orderId) references ProductOrder(orderId),
    constraint FK_ProductId foreign key (Id) references Products(Id)
)

insert into OrderDetail
values(1, 3, 'TP01', 1, 270),
(1, 4, 'TP01', 1, 120)

create table ProductFavorite (
   favoriteId int identity(1, 1),
   customerId int,
   Id int,

   constraint PK_favoriteId primary key (favoriteId),
   constraint FK_customerId foreign key (customerId) references Customer(customerId),
   constraint FK_ID foreign key (Id) references Products(Id)
)

insert into ProductsType
values('TP01', 'HOODIE'),
('TP02', 'TSHIRT'),
('TP03', 'SKIRT'),
('TP04', 'PANTS')

insert into Products(typeId, name, description, material, price, img)
values('TP01', 'GUCCI HOODIE', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 564, 'product_1.png'),

('TP01', 'LUCCY HOODIE', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 354, 'product_2.png'),

('TP01', 'FUCCY HOODIE', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 270, 'product_3.png'),

('TP01', 'PACCY HOODIE', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 120, 'product_1.png'),

('TP01', 'TUCCY HOODIE', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 320, 'product_2.png'),

('TP01', 'HACCY HOODIE', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 435, 'product_3.png')

insert into Customer(fullName, email, userName, pass) 
values('Nguyen Chanh Bao', 'bao@gmail.com', 'bao', '123456')


drop table ProductsType
drop table Products
drop table Customer
drop table ProductFavorite

use master
drop database Shopping

select * from Products
select * from Customer
select * from ProductsType
select * from ProductFavorite

select pr.Id, typeId, name, description, material, price, img
        from ProductFavorite pf join Products pr
        on pf.Id = pr.Id
        where customerId = 1


select MAX(OrderId) as Max
from ProductOrder

select * from OrderDetail
