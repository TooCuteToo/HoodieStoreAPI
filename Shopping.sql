use Master

create database Shopping

use Shopping

create table Customer (
   customerId int identity(1, 1),
   fullName nvarchar(100),
   email varchar(100) unique,
   userName varchar(30) unique,
   pass varchar(10),

   constraint PK_CustomerId primary key (customerId)
)

create table ProductsType (
    typeId varchar(4),
    typeName nvarchar(30),
    image varchar(30),

    constraint PK_TypeID primary key (typeID)
)

create table Products (
    Id int identity(1, 1),
    typeId varchar(4),
    name nvarchar(30),
    description nvarchar(300),
    material nvarchar(300),
    price float,
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
values('TP01', 'HOODIE', 'category_2.png'),
('TP02', 'TSHIRT', 'category_1.png'),
('TP03', 'SKIRT', 'category_3.png'),
('TP04', 'PANTS', 'category_4.png')

insert into Products(typeId, name, description, material, price, img)
values('TP01', 'SLY HOODIE', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 264.99, 'product_1.png'),

('TP01', 'BLACK HOODIE', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 154.99, 'product_2.png'),

('TP01', 'BLACKBLUE HOODIE', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 270.99, 'product_3.png'),

('TP01', 'WHITE HOODIE', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 120.99, 'product_4.png'),

('TP01', 'WHITEBLUE HOODIE', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 320.99, 'product_5.png'),

('TP01', 'BLACKGREEN HOODIE', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 220.99, 'product_6.png'),

('TP02', 'BLACK TSHIRT', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 35.99, 'product_7.png'),

('TP02', 'ORANGE TSHIRT', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 40.99, 'product_8.png'),

('TP02', 'BLACK2 TSHIRT', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 55.99, 'product_9.png'),

('TP02', 'WHITE TSHIRT', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 28.99, 'product_10.png'),

('TP02', 'BLACKWHITE TSHIRT', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 39.99, 'product_11.png'),

('TP03', 'TRANS SKIRT', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 130.99, 'product_12.png'),

('TP03', 'RAINBOW SKIRT', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 90.99, 'product_13.png'),

('TP03', 'WHITE2 TSHIRT', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 35.99, 'product_14.png'),

('TP03', 'BROWN TSHIRT', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 100.99, 'product_15.png'),

('TP04', 'GRAY PANT', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 55.99, 'product_16.png'),

('TP04', 'BLACKGRAY PANT', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 88.99, 'product_17.png'),

('TP04', 'GRAY2 PANT', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 64.99, 'product_18.png'),

('TP04', 'ARMOR PANT', 'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.', 'All products are made with carefully selected materials. Please handle with care for longer product life.
- Protect from direct light, heat and rain. Should it 
   become wet, dry it immediately with a soft cloth
- Store in the provided flannel bag or box
- Clean with a soft, dry cloth', 83.99, 'product_19.png'),

insert into Customer(fullName, email, userName, pass) 
values('Nguyen Chanh Bao', 'bao@gmail.com', 'bao', '123456')


drop table ProductsType
drop table Products
drop table Customer
drop table ProductFavorite
drop table ProductOrder
drop table OrderDetail

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
select * from ProductOrder


select pr.*
from Products pr join ProductsType pt 
on pr.typeId = pt.typeId
where pr.typeId = 'TP02'
