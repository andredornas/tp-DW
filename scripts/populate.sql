use DW_IGN
go

select count(*) from vgsales
go

select count(*) from ign
go

select count(*) from vgsales v
INNER JOIN ign i ON v.Name = i.title and i.platform = v.Platform
go

select * from vgsales v
INNER JOIN ign i ON v.Name = i.title and i.platform = v.Platform
go

/*DimGame*/
insert into DimGame
select distinct v.Name, v.Year, v.Publisher from vgsales v
INNER JOIN ign i ON v.Name = i.title and i.platform = v.Platform
go

select * from DimGame
go

/*DimGenre*/
insert into DimGenre
select distinct v.Genre from vgsales v
INNER JOIN ign i ON v.Name = i.title and i.platform = v.Platform
go

select * from DimGenre
go

/*DimLocation*/
insert into DimLocation (Country) VALUES 
	('North America'),
	('Europe'),
	('Japan'),
	('Other')
go

select * from DimLocation
go

/*DimPlatform*/
insert into DimPlatform
select distinct v.Platform from vgsales v
INNER JOIN ign i ON v.Name = i.title and i.platform = v.Platform
go

select * from DimPlatform
go

/*DimFato*/
/* North America */
insert into Fato
select distinct dg.IdGame, dl.IdLocation, dp.IdPlatform, dge.IdGenre, i.score, v.NA_Sales from vgsales v
INNER JOIN ign i ON v.Name = i.title and i.platform = v.Platform
JOIN DimGame dg ON dg.Name = v.Name and dg.Publisher = v.Publisher and dg.Year = v.Year
JOIN DimGenre dge ON dge.Genre = v.Genre
JOIN DimPlatform dp ON dp.Name = v.Platform
JOIN DimLocation dl ON dl.Country = 'North America'
go

/* Europe */
insert into Fato
select distinct dg.IdGame, dl.IdLocation, dp.IdPlatform, dge.IdGenre, i.score, v.EU_Sales from vgsales v
INNER JOIN ign i ON v.Name = i.title and i.platform = v.Platform
JOIN DimGame dg ON dg.Name = v.Name and dg.Publisher = v.Publisher and dg.Year = v.Year
JOIN DimGenre dge ON dge.Genre = v.Genre
JOIN DimPlatform dp ON dp.Name = v.Platform
JOIN DimLocation dl ON dl.Country = 'Europe'
go

/* Japan */
insert into Fato
select distinct dg.IdGame, dl.IdLocation, dp.IdPlatform, dge.IdGenre, i.score, v.JP_Sales from vgsales v
INNER JOIN ign i ON v.Name = i.title and i.platform = v.Platform
JOIN DimGame dg ON dg.Name = v.Name and dg.Publisher = v.Publisher and dg.Year = v.Year
JOIN DimGenre dge ON dge.Genre = v.Genre
JOIN DimPlatform dp ON dp.Name = v.Platform
JOIN DimLocation dl ON dl.Country = 'Japan'
go

/* Other */
insert into Fato
select distinct dg.IdGame, dl.IdLocation, dp.IdPlatform, dge.IdGenre, i.score, v.Other_Sales from vgsales v
INNER JOIN ign i ON v.Name = i.title and i.platform = v.Platform
JOIN DimGame dg ON dg.Name = v.Name and dg.Publisher = v.Publisher and dg.Year = v.Year
JOIN DimGenre dge ON dge.Genre = v.Genre
JOIN DimPlatform dp ON dp.Name = v.Platform
JOIN DimLocation dl ON dl.Country = 'Other'
go

select * from Fato
go