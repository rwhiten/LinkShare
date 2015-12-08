USE [master]
GO
/****** Object:  Database [LinkShare]    Script Date: 12-07-2015 14:59:07 ******/
CREATE DATABASE [LinkShare]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LinkShare', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\LinkShare.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LinkShare_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\LinkShare_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LinkShare] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LinkShare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LinkShare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LinkShare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LinkShare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LinkShare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LinkShare] SET ARITHABORT OFF 
GO
ALTER DATABASE [LinkShare] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LinkShare] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LinkShare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LinkShare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LinkShare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LinkShare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LinkShare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LinkShare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LinkShare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LinkShare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LinkShare] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LinkShare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LinkShare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LinkShare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LinkShare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LinkShare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LinkShare] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LinkShare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LinkShare] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LinkShare] SET  MULTI_USER 
GO
ALTER DATABASE [LinkShare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LinkShare] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LinkShare] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LinkShare] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [LinkShare]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12-07-2015 14:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1000,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[CategoryDesc] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Url]    Script Date: 12-07-2015 14:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Url](
	[UrlId] [int] IDENTITY(1,1) NOT NULL,
	[UrlTitle] [varchar](50) NOT NULL,
	[Url] [varchar](50) NOT NULL,
	[UrlDesc] [varchar](max) NOT NULL,
	[CategoryId] [int] NULL,
	[AppUserId] [int] NULL,
	[IsApproved] [varchar](1) NULL,
 CONSTRAINT [PK_Url] PRIMARY KEY CLUSTERED 
(
	[UrlId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AppUser]    Script Date: 12-07-2015 14:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppUser](
	[AppUserId] [int] IDENTITY(1,1) NOT NULL,
	[AppUserEmail] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_AppUser] PRIMARY KEY CLUSTERED 
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Url] ADD  CONSTRAINT [DF_Url_IsApproved]  DEFAULT ('N') FOR [IsApproved]
GO
ALTER TABLE [dbo].[AppUser] ADD  CONSTRAINT [DF_AppUser_Role]  DEFAULT ('U') FOR [Role]
GO
ALTER TABLE [dbo].[Url]  WITH CHECK ADD  CONSTRAINT [FK_Url_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Url] CHECK CONSTRAINT [FK_Url_Category]
GO
ALTER TABLE [dbo].[Url]  WITH CHECK ADD  CONSTRAINT [FK_Url_AppUser] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUser] ([AppUserId])
GO
ALTER TABLE [dbo].[Url] CHECK CONSTRAINT [FK_Url_AppUser]
GO
USE [master]
GO
ALTER DATABASE [LinkShare] SET  READ_WRITE 
GO

use [LinkShare]

--Dummy Data for Category
insert into [dbo].[Category] values('Technology','')
insert into [dbo].Category values('Math and Science ','')
insert into [dbo].Category values('Crafts and Hobbies	','')
insert into [dbo].Category values('Business','')
insert into [dbo].Category values('Education','')
insert into [dbo].Category values('Sports','')
insert into [dbo].Category values('Design	','')
insert into [dbo].Category values('Languages','')
insert into [dbo].Category values('Games','')
insert into [dbo].Category values('Arts and Photography','')
insert into [dbo].Category values('Humanities	','')
insert into [dbo].Category values('Other','')
insert into [dbo].Category values('Health and Fitness','')
insert into [dbo].Category values('Social Sciences','')
--Dummy Data for AppUser
INSERT INTO [dbo].AppUser VALUES ('testadmin@test.com','testa1@3','A');
INSERT INTO [dbo].AppUser VALUES ('testuser@test.com','testu@3','U');
INSERT INTO [dbo].AppUser VALUES ('Jescie@hymenaeos.org','Nam','U');
INSERT INTO [dbo].AppUser VALUES ('Macey@consectetuer.com','orci','U');
INSERT INTO [dbo].AppUser VALUES ('Ulysses@conubia.us','luctus','U');
INSERT INTO [dbo].AppUser VALUES ('Harper@Vivamus.com','augue','U');
INSERT INTO [dbo].AppUser VALUES ('Derek@Suspendisse.com','primis','U');
INSERT INTO [dbo].AppUser VALUES ('Lois@erat.net','In','U');
INSERT INTO [dbo].AppUser VALUES ('Whilemina@Vestibulum.com','metus','U');
INSERT INTO [dbo].AppUser VALUES ('Joelle@ad.us','Cras','U');
INSERT INTO [dbo].AppUser VALUES ('Drake@feugiat.edu','suscipit','U');
INSERT INTO [dbo].AppUser VALUES ('Kevin@libero.com','dis','U');
--Dummy Data for Url
INSERT INTO Url VALUES ('Proin','http://www.wooster.edu/','feugiat enim rhoncus Duis magnis dapibus id sagittis leo consectetuer',1008,3,'P');
INSERT INTO Url VALUES ('varius','http://www.molloy.edu/','Lorem Phasellus nostra Suspendisse Fusce pretium Duis odio sagittis Mauris',1004,11,'R');
INSERT INTO Url VALUES ('fermentum','http://www.mscfs.edu/','hendrerit velit sem commodo mattis vel nascetur egestas Lorem ac',1003,5,'R');
INSERT INTO Url VALUES ('Quisque','http://www.naz.edu/','Pellentesque nibh montes justo metus senectus justo Cras metus Curabitur',1003,4,'A');
INSERT INTO Url VALUES ('lorem','http://www.fairmont.wvnet.edu:80/','ante iaculis Mauris lectus elit torquent Vivamus nec tellus turpis',1006,10,'A');
INSERT INTO Url VALUES ('vehicula','http://www.nwmissouri.edu/','Proin magnis lacus dis congue tristique ligula laoreet laoreet egestas',1010,8,'A');
INSERT INTO Url VALUES ('eleifend','http://www.milligan.milligan-college.tn.us/','rhoncus id ullamcorper Praesent consectetuer nascetur ac massa Nunc nibh',1004,5,'P');
INSERT INTO Url VALUES ('quam','http://www.mcneese.edu/','Phasellus varius interdum venenatis ultrices auctor Nulla Ut nec magnis',1001,7,'R');
INSERT INTO Url VALUES ('Mauris','http://www.ipfw.indiana.edu/','consectetuer aliquet in orci penatibus In commodo dolor Quisque pharetra',1007,4,'A');
INSERT INTO Url VALUES ('Nulla','http://www.dwc.edu/','id rutrum ac rutrum fermentum Aliquam nascetur Morbi nunc placerat',1003,3,'A');
INSERT INTO Url VALUES ('neque','http://www.fhsu.edu/','tellus Maecenas Vestibulum et risus nec volutpat fermentum dis tempor',1008,9,'P');
INSERT INTO Url VALUES ('ipsum','http://www.dwu.edu/','purus mi amet eget nisl et eros conubia molestie amet',1003,5,'R');
INSERT INTO Url VALUES ('Ut','http://www.metro.msus.edu/','pharetra ac cubilia ridiculus Lorem metus nunc vel dignissim hymenaeos',1002,5,'R');
INSERT INTO Url VALUES ('et','http://www.pbac.edu/','Maecenas tempus libero montes Curabitur laoreet Donec lorem vestibulum id',1001,10,'A');
INSERT INTO Url VALUES ('lectus','http://www.goshen.edu/','fames ultricies torquent convallis magna Maecenas in elementum nisi Lorem',1000,11,'P');
INSERT INTO Url VALUES ('lobortis','http://www.csc.edu/','felis ultrices nec pharetra lorem egestas vestibulum tristique porta dui',1009,12,'A');
INSERT INTO Url VALUES ('mauris','http://www.moravian.edu/','volutpat Vivamus Vivamus massa a arcu suscipit vitae volutpat posuere',1009,10,'R');
INSERT INTO Url VALUES ('imperdiet','http://www.central.edu/','Pellentesque viverra facilisis nisi dis natoque ipsum massa lectus facilisi',1003,11,'R');
INSERT INTO Url VALUES ('pulvinar','http://unix1.sncc.lsu.edu/','In Praesent vestibulum pede Morbi nibh augue neque metus velit',1006,8,'A');
INSERT INTO Url VALUES ('venenatis','http://www.msstate.edu/','non Pellentesque Nunc Cras Morbi ligula suscipit laoreet lectus auctor',1006,7,'A');
INSERT INTO Url VALUES ('accumsan','http://www.cts.edu/','faucibus Proin lectus hymenaeos vel tellus sollicitudin nascetur ut natoque',1005,4,'R');
INSERT INTO Url VALUES ('tempor','http://www.csbsju.edu/','sociosqu vel metus elit turpis Morbi dapibus Cras elementum neque',1009,6,'A');
INSERT INTO Url VALUES ('Donec','http://www.gac.edu/','euismod dignissim egestas condimentum Integer montes quam pede sit pede',1008,9,'A');
INSERT INTO Url VALUES ('aptent','http://www.lfc.edu/','viverra ad pretium elit Quisque nascetur gravida lacinia risus odio',1002,8,'P');
INSERT INTO Url VALUES ('ullamcorper','http://www.colostate.edu/','nisi litora mauris eget ipsum dignissim porta dui convallis sollicitudin',1009,9,'P');
INSERT INTO Url VALUES ('natoque','http://www.fsufay.edu/','sodales luctus euismod pharetra Mauris Morbi nostra id a Nullam',1002,10,'R');
INSERT INTO Url VALUES ('tortor','http://www.jones.edu/','torquent nostra Morbi nibh Fusce diam litora nonummy amet lobortis',1001,6,'A');
INSERT INTO Url VALUES ('metus','http://www.graceland.edu/','tristique erat odio ullamcorper dolor Ut nisl posuere hymenaeos commodo',1003,10,'R');
INSERT INTO Url VALUES ('vehicula','http://www.lemoyne.edu/','habitant nostra posuere ipsum natoque penatibus In torquent Aenean sociosqu',1010,2,'R');
INSERT INTO Url VALUES ('iaculis','http://www.fresno.edu/','id eleifend egestas vitae conubia pede Pellentesque felis sit amet',1000,12,'R');
INSERT INTO Url VALUES ('consectetuer','http://www.hood.edu/','turpis erat sem laoreet nonummy porttitor suscipit congue sed accumsan',1008,12,'P');
INSERT INTO Url VALUES ('tempor','http://www.fsc.edu/','Nunc tempor risus eu tristique varius pellentesque Class mus interdum',1000,5,'R');
INSERT INTO Url VALUES ('montes','http://www.css.edu/','suscipit Suspendisse In metus pede sit diam sapien id sociis',1010,10,'A');
INSERT INTO Url VALUES ('Aenean','http://www.colum.edu/','enim dapibus commodo rhoncus gravida Vivamus Nam sed Donec viverra',1004,2,'R');
INSERT INTO Url VALUES ('Nam','http://www.fit.edu/','consequat cubilia sollicitudin enim nibh at Duis Nunc pulvinar consectetuer',1010,2,'P');
INSERT INTO Url VALUES ('nunc','http://www.campbellsvil.edu/','leo felis Suspendisse hendrerit nisi consectetuer gravida nonummy Nullam Phasellus',1004,8,'P');
INSERT INTO Url VALUES ('dictum','http://www.huntcol.edu/','sollicitudin amet aptent pellentesque sociis suscipit rhoncus Class leo Vestibulum',1005,10,'A');
INSERT INTO Url VALUES ('lorem','http://www.prysm.com/~lsuscba/','neque tempus mauris Morbi inceptos ullamcorper rhoncus eu commodo fames',1009,6,'R');
INSERT INTO Url VALUES ('Integer','http://hws3.hws.edu/','sit blandit habitant a Pellentesque adipiscing conubia Nulla velit quis',1003,7,'A');
INSERT INTO Url VALUES ('gravida','http://www.nwciowa.edu/','ut faucibus sociosqu per ornare Suspendisse mollis mattis Sed Phasellus',1004,12,'R');
INSERT INTO Url VALUES ('suscipit','http://www.molloy.edu/','lobortis augue vitae scelerisque taciti convallis et congue Maecenas tincidunt',1007,6,'P');
INSERT INTO Url VALUES ('amet','http://www.fit.edu/','fermentum lobortis luctus mollis et molestie tincidunt dui penatibus eget',1000,4,'A');
INSERT INTO Url VALUES ('dis','http://www.efn.org/~mscenter/guten','natoque eros habitant viverra consequat sodales tortor dis Pellentesque nulla',1000,11,'P');
INSERT INTO Url VALUES ('habitant','http://www.davidson.edu/','varius sociosqu molestie Donec leo accumsan Aliquam dapibus nostra lorem',1005,3,'R');
INSERT INTO Url VALUES ('nulla','http://www.dowling.edu/','accumsan consectetuer ligula Class ultricies erat ultricies dui nonummy metus',1001,9,'R');
INSERT INTO Url VALUES ('sollicitudin','http://www.olivet.edu/','Pellentesque malesuada suscipit ante accumsan bibendum ridiculus quam viverra Suspendisse',1009,7,'R');
INSERT INTO Url VALUES ('libero','http://www.lfc.edu/','per Aenean luctus congue vitae imperdiet eget inceptos facilisi ac',1004,8,'R');
INSERT INTO Url VALUES ('inceptos','http://www.lyon.edu/','id lectus habitant nec est consectetuer netus Quisque parturient lacus',1003,4,'A');
INSERT INTO Url VALUES ('bibendum','http://www.mercer.peachnet.edu/','vitae elit lacus in neque egestas ridiculus euismod Curabitur nisl',1006,5,'R');
INSERT INTO Url VALUES ('porta','http://www.coa.edu/','mus Nunc Proin elementum placerat lobortis laoreet Donec malesuada ornare',1000,11,'R');
INSERT INTO Url VALUES ('tellus','http://www.msmc.edu/','gravida libero viverra ut Aliquam sodales Ut lacinia magnis fames',1009,12,'R');
INSERT INTO Url VALUES ('mollis','http://www.lacollege.edu/','penatibus porttitor placerat blandit pretium dui arcu pharetra per Nam',1000,3,'A');
INSERT INTO Url VALUES ('arcu','http://marauder.millersv.edu/','montes Phasellus lorem nisl blandit fames velit augue purus bibendum',1001,11,'A');
INSERT INTO Url VALUES ('condimentum','http://www.indtech.edu/','tempor sodales malesuada egestas faucibus consectetuer Morbi Mauris morbi Morbi',1000,10,'P');
INSERT INTO Url VALUES ('urna','http://www.njit.edu/','leo nec pellentesque taciti Morbi tincidunt libero interdum imperdiet dictum',1004,9,'R');
INSERT INTO Url VALUES ('dui','http://www.furman.edu/','imperdiet Cras commodo urna per nibh ultricies parturient iaculis Nam',1002,10,'A');
INSERT INTO Url VALUES ('tellus','http://www.hastings.edu/','dignissim vestibulum feugiat auctor Duis Vestibulum facilisi lectus Cras metus',1008,11,'R');
INSERT INTO Url VALUES ('iaculis','http://www.cs.cofc.edu/','convallis ultricies egestas vehicula Vestibulum sed vestibulum habitant dapibus Curabitur',1005,10,'A');
INSERT INTO Url VALUES ('Cras','http://www.ibc.edu/','porttitor lorem sociosqu augue nisi erat fermentum Etiam arcu odio',1004,12,'A');
INSERT INTO Url VALUES ('lectus','http://www.friends.edu/','Praesent taciti aptent habitant volutpat metus tellus egestas sapien facilisi',1000,4,'P');
INSERT INTO Url VALUES ('varius','http://www.ncwc.edu/','Quisque sapien Class nisl Donec sapien Nulla nisl sociosqu feugiat',1004,5,'R');
INSERT INTO Url VALUES ('Praesent','http://www.wooster.edu/','bibendum semper Maecenas nulla porta conubia varius sodales turpis eu',1008,7,'A');
INSERT INTO Url VALUES ('diam','http://www.jbc.edu/','purus parturient erat sociis Duis Suspendisse leo elementum tellus Ut',1005,9,'R');
INSERT INTO Url VALUES ('arcu','http://www.lemoyne.edu/','amet libero Mauris consectetuer lobortis consectetuer fringilla Donec non penatibus',1007,3,'A');
INSERT INTO Url VALUES ('eleifend','http://esoptron.umd.edu/FUSFOLDER/','sollicitudin vulputate sed enim felis inceptos netus hymenaeos facilisis leo',1009,10,'A');
INSERT INTO Url VALUES ('ligula','http://www.hiram.edu/','tincidunt sapien conubia amet rutrum et risus Cras Cras Duis',1000,12,'P');
INSERT INTO Url VALUES ('nunc','http://www.luthersem.edu/','augue Class sodales volutpat condimentum Nunc tincidunt orci Lorem Curabitur',1008,9,'A');
INSERT INTO Url VALUES ('Ut','http://www.ohsu.edu/','pharetra Mauris mauris mauris suscipit felis leo pretium cursus pulvinar',1001,3,'P');
INSERT INTO Url VALUES ('felis','http://www.earlham.edu/','sed Curae tristique amet In Integer per consequat tempor Phasellus',1001,9,'A');
INSERT INTO Url VALUES ('leo','http://www.dsc.edu/','Duis turpis mauris Cras convallis risus orci iaculis ac netus',1010,3,'R');
INSERT INTO Url VALUES ('volutpat','http://www.meredith.edu/meredith/','libero Etiam vestibulum Ut sed semper justo conubia Praesent hendrerit',1002,5,'P');
INSERT INTO Url VALUES ('purus','http://www.Peace.edu/','fringilla tortor varius euismod porttitor ligula ipsum nibh odio morbi',1008,3,'A');
INSERT INTO Url VALUES ('diam','http://www.famu.edu/','montes at nisi feugiat metus consequat tempus cubilia molestie morbi',1006,5,'A');
INSERT INTO Url VALUES ('lobortis','http://www.hunter.cuny.edu/','sollicitudin Nam id montes aliquet Aenean tortor accumsan commodo Nam',1002,2,'A');
INSERT INTO Url VALUES ('malesuada','http://www.nku.edu/','nec tristique natoque bibendum penatibus ultricies mus massa lorem amet',1005,7,'A');
INSERT INTO Url VALUES ('facilisis','http://www.cwru.edu/','consequat per placerat sem ante cursus imperdiet senectus hymenaeos dictum',1008,5,'A');
INSERT INTO Url VALUES ('vehicula','http://www.dsc.edu/','metus lacus mollis rhoncus Etiam Sed Suspendisse tellus mollis In',1002,3,'R');
INSERT INTO Url VALUES ('augue','http://www.gac.peachnet.edu/','fames ultrices Lorem blandit quam interdum a metus aliquet ultricies',1000,6,'R');
INSERT INTO Url VALUES ('urna','http://www.prysm.com/~lsuscba/','eu Nullam et cubilia litora enim diam Etiam velit venenatis',1007,11,'A');
INSERT INTO Url VALUES ('quis','http://www.mbc.edu/','laoreet eleifend purus sem magna tortor justo lacus Integer cursus',1009,11,'A');
INSERT INTO Url VALUES ('sed','http://www.nyit.edu/','suscipit massa litora tempus posuere pellentesque lacinia ad a at',1002,8,'A');
INSERT INTO Url VALUES ('molestie','http://www.mc.edu/','vulputate nisl sapien libero lacus dui in neque inceptos mauris',1000,3,'A');
INSERT INTO Url VALUES ('fermentum','http://www.state.me.us/maritime/mma.htm','purus per non natoque sem arcu auctor tempor facilisis ridiculus',1003,4,'P');
INSERT INTO Url VALUES ('eleifend','http://www.metro.msus.edu/','sollicitudin quam luctus rutrum Curabitur gravida Aliquam at Proin cursus',1007,2,'P');
INSERT INTO Url VALUES ('Cum','http://home.judson.edu/','leo dui rutrum sapien mus tortor hendrerit litora sociosqu egestas',1004,3,'A');
INSERT INTO Url VALUES ('Aliquam','http://www.msu.edu/','id purus consectetuer Sed torquent urna pulvinar Ut euismod condimentum',1006,11,'R');
INSERT INTO Url VALUES ('mauris','http://www.champlain.edu/','natoque Nunc urna habitant habitant euismod massa penatibus Suspendisse sed',1008,5,'P');
INSERT INTO Url VALUES ('consequat','http://www.plu.edu/','ac malesuada Etiam aptent nibh porta sed laoreet Cras sed',1004,4,'R');
INSERT INTO Url VALUES ('diam','http://www.csc.peachnet.edu/','sociosqu posuere Fusce dignissim purus Etiam fringilla vulputate at Nulla',1008,11,'P');
INSERT INTO Url VALUES ('diam','http://www.milligan.milligan-college.tn.us/','est dolor facilisis imperdiet fames pede volutpat In quis mi',1001,10,'R');
INSERT INTO Url VALUES ('ante','http://www.esu.edu/','rhoncus nonummy eu ridiculus Nunc nunc faucibus Maecenas venenatis Lorem',1007,3,'R');
INSERT INTO Url VALUES ('nibh','http://www.eosc.osshe.edu/','feugiat laoreet vel ultrices ridiculus molestie erat Curabitur porta natoque',1004,5,'P');
INSERT INTO Url VALUES ('pretium','http://www.curry.edu:8080/','ac nascetur tempor et sed nunc Curabitur dis lacinia a',1005,11,'P');
INSERT INTO Url VALUES ('iaculis','http://www.jhu.edu/','sagittis elementum magnis Aliquam placerat suscipit Etiam Mauris dis odio',1004,4,'R');
INSERT INTO Url VALUES ('mauris','http://www.chapman.edu/','dapibus ultrices dolor nascetur commodo fames convallis varius Phasellus elementum',1007,12,'P');
INSERT INTO Url VALUES ('urna','http://www.ius.indiana.edu/','congue tristique ac interdum Morbi et facilisi imperdiet Curabitur erat',1001,4,'P');
INSERT INTO Url VALUES ('egestas','http://www.ogi.edu/welcome.html','consectetuer interdum egestas ad neque interdum sollicitudin pede Proin purus',1005,10,'P');
INSERT INTO Url VALUES ('Integer','http://www.iup.edu/','iaculis porta neque nisl elementum congue posuere aptent sociis habitant',1001,12,'P');
INSERT INTO Url VALUES ('quis','http://www.dwu.edu/','sit auctor Suspendisse diam lectus lacinia posuere rutrum sed enim',1004,4,'P');
INSERT INTO Url VALUES ('gravida','http://www.nwciowa.edu/','sollicitudin Curabitur bibendum interdum accumsan cursus mus lobortis tortor sociosqu',1008,5,'R');


select * from Category
select * from AppUser
select * from Url
