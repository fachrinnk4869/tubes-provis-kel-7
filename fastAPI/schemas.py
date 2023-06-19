from typing import List
import datetime as _dt
import pydantic as _pydantic


class _UmkmSaldo(_pydantic.BaseModel):
    saldo: int
class _UmkmBase(_UmkmSaldo):
    name: str
    rekening: str
    deskripsi: str
    jenis: str
    alamat: str
    tahun_berdiri:str



class UmkmCreate(_UmkmBase):
    pass


class Umkm(_UmkmBase):
    id: int
    id_user: int
    date_created: _dt.datetime
    date_last_updated: _dt.datetime

    class Config:
        orm_mode = True
        
class _InvestorSaldo(_pydantic.BaseModel):
    saldo: int
    
class _InvestorBase(_InvestorSaldo):
    ktp: str
    alamat: str


class InvestorCreate(_InvestorBase):
    pass


class Investor(_InvestorBase):
    id: int
    id_user: int
    date_created: _dt.datetime
    date_last_updated: _dt.datetime

    class Config:
        orm_mode = True


class _UserBase(_pydantic.BaseModel):
    email: str
    name:str
    contact:str


class UserCreate(_UserBase):
    password: str
    
class UserLogin(_pydantic.BaseModel):
    email: str
    password: str


class User(_UserBase):
    id: int
    umkms: List[Umkm] = []
    investors: List[Investor] = []
    isInvestor:bool

    class Config:
        orm_mode = True
        
class EventTerkumpul(_pydantic.BaseModel):
    terkumpul: int
class EventStatus(EventTerkumpul):
    status: str
class _EventBase(EventTerkumpul):
    name: str
    desc: str
    tenor: int
    # jatuh_tempo: _dt.datetime
    target: int
    keuntungan: int
    # rab: str
    # ppb: str
    
    

class Event(_EventBase):
    id: int
    # tanggal_dibuat: _dt.datetime
    # tanggal_selesai: _dt.datetime
    
    
    # tenor: int
    id_umkm: int
    status: str
    
    date_created: _dt.datetime
    date_last_updated: _dt.datetime
    
    class Config:
        orm_mode = True
        
class EventCreate(_EventBase):
    pass
    


# investment
class InvestmentBase(_pydantic.BaseModel):
    jumlah_investasi: int
    
    

class InvestmentCreate(InvestmentBase):
    pass


class Investment(InvestmentBase):
    id: int
    id_event: int
    id_investor: int
    tanggal_investasi: _dt.datetime

    class Config:
        orm_mode = True


#riwayat_cicilan

class RiwayatCicilanBase(_pydantic.BaseModel):
    saldo_cicilan: int
    jatuh_tempo: _dt.datetime



class RiwayatCicilanCreate(RiwayatCicilanBase):
    pass


class RiwayatCicilan(RiwayatCicilanBase):
    id: int
    id_investment: int

    class Config:
        orm_mode = True

#riwayat_saldo
class RiwayatSaldoBase(_pydantic.BaseModel):
    nominal: int
    status: str
    deskripsi: str

class RiwayatSaldoCreate(RiwayatSaldoBase):
    pass

class RiwayatSaldo(RiwayatSaldoBase):
    id: int
    id_user: int

    class Config:
        orm_mode = True

        