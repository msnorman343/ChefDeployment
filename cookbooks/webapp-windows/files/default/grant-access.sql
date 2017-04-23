
use master;
go
use learnchef;
go

create login [IIS APPPOOL\Products] from WINDOWS
go

create user [IIS APPPOOL\Products]
go

grant select on customers to  [IIS APPPOOL\Products]
