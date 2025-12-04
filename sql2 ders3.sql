/*
tam sayýlar:
bigint
int
smallint
tinyint

Kesirli sayýlar:
float

Diðer biçimler:
decimal
numeric
bit
money
smallmoney

date
datetime
smalldate

yazýtipleri:
char(n)
varchar(n)
text(n)

Tip dönüþümü iki þekilde yapýlabilir.

cast (degisken_adi as veri_tipi(uzunluk))

convert(veri_tipi,degisken_adi,stil)
*/

/*
select convert(varchar,getdate(),101)
select convert(varchar,getdate(),103)
select convert(varchar,getdate(),120)
select convert(varchar,getdate(),114)

select convert(varchar,cast(12345.6789 as money),0)
select convert(varchar,cast(12345.6789 as money),1)
select convert(varchar,cast(12345.6789 as money),2)

select getdate() as orijinaltarih, convert(varchar,GETDATE(),101) as [101]
select getdate() as orijinaltarih, convert(varchar,GETDATE(),102) as [102]
select getdate() as orijinaltarih, convert(varchar,GETDATE(),103) as [103]
*/

/*
declare @vizenotu tinyint,@final tinyint,@adisoyadi nvarchar(20),@tur nvarchar(10),@yeni int
set @adisoyadi = 'ahmet'
set @vizenotu = 45 set @final = 50;
print cast('123'as int)+44
set @yeni = cast ('123'as int)+44
print 'sonuc' + cast (@vizenotu as varchar(10))
print @adisoyadi+',Ortalamanýz..:'+cast ((@vizenotu+@final)/2as nvarchar(10))
print @@servername
*/

/*
create table pers(
pers_id int primary key identity(1,1),
ad nvarchar(50),
soyad nvarchar(50),
bolno int,
maas money
)
*/

/*
select ad,soyad,
case
when bolno = 1 then 'elektrik'
when bolno = 2 then 'bilisim'
else 'baska bolum'
end as bolumdurumu
from pers


--maaþý 50000-80000 arasý olanlar yüksek maaþ,
--50000 altýnda olanlar düþük maaþ bunlara dahil deðilse baþka maaþ diye listelensin, ad soyad ile birlikte.
select ad,soyad,
case
when maas <50000 then 'düþük maaþ'
when maas between 50000 and 80000 then 'yüksek maas'
else 'baþka maaþ'
end as Maasmiktari
from pers
*/


/*
----------------
declare @vize as tinyint
declare @vizedurumu as nvarchar(10)
set @vize = 55;
set @vizedurumu = case
when @vize<50 then 'kaldý'
when @vize>=50 then 'geçti'
else 'sýnava girmedi'
end
print @vizedurumu

----------------
--bir deðiþken tanýmlayýn, bu deðiþkene personel tablosunda
--bulunan ilk kaydýn bölüm kodunu deðer olarak atayýn ve ekrana yazdýrýn.
declare @bolumkod as tinyint
select top 1 @bolumkod=bolno from pers
print @bolumkod

----------------
--bir deðiþken tanýmlayýn, bu deðiþkene personel tablosunda
--bölüm kodlarýnýn tamamýný bu deðiþkene atayýn ve ekrana yazdýrýn
declare @tablo table (bolno tinyint)
insert into @tablo select bolno from pers
select * from @tablo
*/

/*
--if else yapýsý diðer programlama dillerindeki kullaným þekline benzer
if(koþul)
	begin
	--eðer koþulumuz doðru ise bu alandaki ifade çalýþýr
	end
else
	begin
	--eðer koþulumuz yanlýþ ise bu alandaki ifade çalýþýr
	end
*/

/*
declare @sayi int
select @sayi = count(*) from pers
if (@sayi>5)
begin
	print'5 den fazla kayýt var.'
end
else begin
	print'5 den az kayýt var.'
end
*/

/*
if (month(getdate()) in (10))
begin
	print 'aylardan ekim'
	if (year(getdate())%2 =0)
	begin
		print 'çift bir yýldayýz.'
	end
	else 
	begin
		print'tek bir yýldayýz.'
	end
end
else begin
	if (year(getdate())%2 =0)
	begin
		print 'çift bir yýldayýz.'
	end
	else 
	begin
		print'tek bir yýldayýz.'
	end
end
*/

/*
if exists(select bolno from pers where maas<50000)
begin select ad,
case 
when bolno = 1 then 'elektrik'
when bolno = 2 then 'biliþim'
else 'bölümsüz'
end as bolum_bilgisi
from pers
end
*/

/*
declare @sayac int = 1
while @sayac <10
begin
	print @sayac
	set @sayac+=1
end
*/

/*
declare @sayac int = 0
while exists(select bolno from pers where maas >50000)
begin
	set @sayac = @sayac+1
	update pers set maas = maas*0.9
end
print 'toplam' + cast (@sayac as nvarchar(10))
*/

/*
--tamsayý bir deðiþken tanýmla ve ona bir deðer ata,
--bu deðerin karakter türünden bir türe çevir ve ekrana yazdýr.
declare @x int = 22
print @x
print convert(varchar(5),@x) + 'selam'
*/

/*
--belli bi sayý aralýðýnda çift sayýlarý bulan ve ekrana yazdýran kod
declare @say int
set @say=1
while @say<100
begin
	if (@say%2 = 0)
	begin
		print cast (@say as nvarchar(10)) + ' : çifttir'
	end
	else
	begin
		print convert (varchar(10),@say) + ' : tektir'
	end
	set @say=@say+1
end
*/

/*
--bir deðiþken tanýmla ve bu deðiþkene personel tablosundaki maaþ ve bölüm numarasýný deðerlerini deðer olarak atave ekrana yazdýr
declare @maastablo table (maas money,p_no int)
insert into @maastablo select maas,bolno from pers
select * from @maastablo
*/