
use master
go
create database nuochoa
go
use nuochoa
go


create table [User](
	id int identity,
	email varchar(50),
	username varchar(50) unique not null,
	[password] varchar(36) not null,
	avatar varchar(50),
	role_id int,
	primary key(id)
)
create table UserDetails(
	id int identity,
	user_id int unique not null,
	full_name nvarchar(50),
	[address] nvarchar(255),
	tel nvarchar(20),
	FOREIGN KEY (user_id) REFERENCES [User](id)
)
create table Category(
	cate_id int identity primary key,
	cate_name nvarchar(255) not null,
	sex nvarchar(15) not null,

)

create table Product(
	id int identity primary key,
	[name] nvarchar(255) not null,
	price float ,
	cate_id int ,
	des nvarchar(2000),
	image varchar(50),
	FOREIGN KEY (cate_id) REFERENCES Category(cate_id)
)


create table [Order](
	id varchar(50) primary key,
	u_id int references [User](id),
	timeOrder date,
	[status] int
)

create table OrderDetails(
	order_id varchar(50),
	pro_id int,
	quantity int,
	unitPrice float,
	primary key(order_id,pro_id),
	FOREIGN KEY (order_id) REFERENCES [Order](id),
	FOREIGN KEY (pro_id) REFERENCES Product(id)
)



insert into [User] (email,username,[password], avatar,role_id) values ('16521571@gm.uit.edu.vn','dat1fit','123','','2');
insert into [User] (email,username,[password], avatar,role_id) values ('16520297@gm.uit.edu.vn','admin','123','','1');




insert into UserDetails (user_id,full_name,[address],tel) values (1, 'Trần Văn Đạt', 'ktx khu B, ĐHQG TpHCM', '0334054114')
insert into UserDetails (user_id,full_name,[address],tel) values (2, 'Trần Đức Duy', 'ktx khu B, ĐHQG TpHCM', '0123456879')
insert into UserDetails (user_id,full_name,[address],tel) values (3, 'Nguyễn Ngoch Duy', 'ktx khu B, ĐHQG TpHCM', '0987654321')
insert into UserDetails (user_id,full_name,[address],tel) values (4, 'User thông thường', 'ktx khu B, ĐHQG TpHCM', '0334054114')




insert into Category(Sex,Cate_name) values ('Nam','BVLGARI');
insert into Category(Sex,Cate_name) values ('Nam','BURBERRY');
insert into Category(Sex,Cate_name) values ('Nam','CAVINKLEIN');
insert into Category(Sex,Cate_name) values ('Nam','CAROLINA');
insert into Category(Sex,Cate_name) values (N'Nữ','BURBERRY');
insert into Category(Sex,Cate_name) values ('Nam','CALVINKLEIN');
insert into Category(Sex,Cate_name) values ('Nam','CHANEL');
insert into Category(Sex,Cate_name) values (N'Nữ','CHANEL');
insert into Category(Sex,Cate_name) values ('Nam','GUCCI');
insert into Category(Sex,Cate_name) values ('Nam','DIOR');
insert into Category(Sex,Cate_name) values (N'Nữ','VERSACE');
insert into Category(Sex,Cate_name) values (N'Nữ','GUCCI');
insert into Category(Sex,Cate_name) values (N'Nữ','LANCOME');
insert into Category(Sex,Cate_name) values (N'Nữ','KILIAN');
insert into Category(Sex,Cate_name) values (N'Nữ','DIOR');


insert into Product([name],image,des,Price,Cate_id) values ('BVLGARI AQVA POUR HOMME EAU DE TOILETTE FOR MEN', 'boy1.jpg', N'Nước hoa Aqva Pour Homme của Bvlgari là một mẫu nước hoa thuộc nhóm hương thơm biển',1590000, 1);
insert into Product([name],image,des,Price,Cate_id) values ('BURBERRY LONDON EAU DE TOILETTE FOR MEN', 'boy2.jpg', '',1690000, 2);
insert into Product([name],image,des,Price,Cate_id) values ('BVLGARI MAN IN BLACK EAU DE PARFUM FOR MEN', 'boy3.jpg', '',1790000, 1);
insert into Product([name],image,des,Price,Cate_id) values ('BVLGARI AQVA POUR HOMME MARINE EAU DE TOILETTE FOR MEN', 'boy4.jpg', '',1590000, 1);
insert into Product([name],image,des,Price,Cate_id) values ('CALVIN KLEIN CK FREE EAU DE TOILETTE FOR MEN', 'boy5.jpg', '',1590000, 3);
insert into Product([name],image,des,Price,Cate_id) values ('CALVIN KLEIN CK ONE EAU DE TOILETTE FOR WOMEN AND MEN', 'boy6.jpg', '',1590000, 3);
insert into Product([name],image,des,Price,Cate_id) values ('CAROLINA HERRERA 212 MEN EAU DE TOILETTE FOR MEN', 'boy7.jpg', '',1790000, 4);
insert into Product([name],image,des,Price,Cate_id) values ('BURBERRY MY BURBERRY EAU DE PARFUM FOR WOMEN', 'nu1.jpg', '',2590000, 5);
insert into Product([name],image,des,Price,Cate_id) values ('CAROLINA HERRERA 212 VIP MEN EAU DE TOILETTE FOR MEN', 'boy9.jpg', '',2090000, 4);
insert into Product([name],image,des,Price,Cate_id) values ('CALVIN KLEIN CK BE DEODORANT STICK FOR MEN', 'khac1.jpg', '',5900000, 6);
insert into Product([name],image,des,Price,Cate_id) values ('CHANEL ALLURE HOMME SPORT DEODORANT STICK FOR MEN', 'khac2.jpg', '',1190000, 7);
insert into Product([name],image,des,Price,Cate_id) values ('CHANEL BLEU DE CHANEL DEODORANT STICK FOR MEN', 'khac3.jpg', '',1190000, 7);
insert into Product([name],image,des,Price,Cate_id) values ('CHANEL CHANCE EAU FRAICHE FOAMING SHOWER GEL FOR WOMEN', 'khac4.jpg', '',1790000, 8);
insert into Product([name],image,des,Price,Cate_id) values ('CHANEL CHANCE EAU TENDRE FOAMING SHOWER GEL FOR WOMEN', 'khac5.jpg', '',1790000, 8);
insert into Product([name],image,des,Price,Cate_id) values ('GUCCI GUILTY BLACK POUR HOMME EAU DE TOILETTE FOR MEN', 'nuochoahot1.jpg', '',2090000, 9);
insert into Product([name],image,des,Price,Cate_id) values ('DIOR HOMME SPORT EAU DE TOILETTE FOR MEN', 'nuochoahot2.jpg', '',2090000, 10);
insert into Product([name],image,des,Price,Cate_id) values ('VERSACE YELLOW DIAMOND EAU DE TOILETTE FOR WOMEN', 'nuochoahot3.jpg', '',2090000, 11);
insert into Product([name],image,des,Price,Cate_id) values ('GUCCI BY GUCCI EAU DE PARFUM FOR WOMEN', 'nuochoahot4.jpg', '',2090000, 12);
insert into Product([name],image,des,Price,Cate_id) values ('CHANEL CHANCE EAU VIVE EAU DE TOILETTE FOR WOMEN', 'nuochoamoi1.jpg', '',2090000, 8);
insert into Product([name],image,des,Price,Cate_id) values ('LANCOME LA NUIT TRESOR EAU DE PARFUM FOR WOMEN', 'nuochoamoi2.jpg', '',3090000, 13);
insert into Product([name],image,des,Price,Cate_id) values ('KILIAN IMPERIAL TEA BY KILIAN DE PARFUM FOR WOMEN', 'nuochoamoi3.jpg', '',4080000, 14);
insert into Product([name],image,des,Price,Cate_id) values ('DIOR POISON EAU DE TOILETTE FOR WOMEN', 'nuochoamoi4.jpg', '',3060000, 15);
insert into Product([name],image,des,Price,Cate_id) values ('MISS DIOR EAU DE TOILETTE FOR WOMEN', 'nuochoakhac1.jpg', '',3060000, 15);
insert into Product([name],image,des,Price,Cate_id) values ('CHANEL ALLURE EAU DE TOILETTE FOR WOMEN', 'nuochoakhac2.jpg', '',2290000, 8);
insert into Product([name],image,des,Price,Cate_id) values ('CHANEL CHANCE EAU FRAICHE FOR WOMEN', 'nuochoakhac3.jpg', '',3600000, 8);
insert into Product([name],image,des,Price,Cate_id) values ('CHANEL CHANCE EAU DE PARFUM FOR WOMEN', 'nuochoakhac4.jpg', '',2960000, 8);


