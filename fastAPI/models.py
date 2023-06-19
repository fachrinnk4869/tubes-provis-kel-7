import datetime as _dt
import sqlalchemy as _sql
import sqlalchemy.orm as _orm

import database as _database


class User(_database.Base):
    __tablename__ = "users"
    id = _sql.Column(_sql.Integer, primary_key=True, index=True)
    email = _sql.Column(_sql.String, unique=True, index=True)
    password = _sql.Column(_sql.String)
    name = _sql.Column(_sql.String)
    contact = _sql.Column(_sql.String)
    isInvestor = _sql.Column(_sql.Boolean)

    umkms = _orm.relationship("Umkm", back_populates="owner")
    investors = _orm.relationship("Investor", back_populates="owner")
    riwayat_saldo = _orm.relationship("Riwayat_saldo", back_populates="user")


class Umkm(_database.Base):
    __tablename__ = "umkms"
    id = _sql.Column(_sql.Integer, primary_key=True, index=True)
    name = _sql.Column(_sql.String, index=True, default='')
    rekening = _sql.Column(_sql.String, index=True, default='')
    deskripsi = _sql.Column(_sql.String, index=True, default='')
    jenis = _sql.Column(_sql.String, index=True, default='')
    alamat = _sql.Column(_sql.String, index=True, default='')
    saldo = _sql.Column(_sql.Integer, index=True, default=0)
    tahun_berdiri = _sql.Column(_sql.String, index=True, default='')
    date_created = _sql.Column(_sql.DateTime, default=_dt.datetime.utcnow)
    date_last_updated = _sql.Column(_sql.DateTime, default=_dt.datetime.utcnow)
    id_user = _sql.Column(_sql.Integer, _sql.ForeignKey("users.id"))

    owner = _orm.relationship("User", back_populates="umkms")
    event = _orm.relationship("Event", back_populates="umkms")
    
class Investor(_database.Base):
    __tablename__ = "investors"
    id = _sql.Column(_sql.Integer, primary_key=True, index=True)
    ktp = _sql.Column(_sql.String, index=True)
    alamat = _sql.Column(_sql.String, index=True)
    saldo = _sql.Column(_sql.Integer, index=True)
    date_created = _sql.Column(_sql.DateTime, default=_dt.datetime.utcnow)
    date_last_updated = _sql.Column(_sql.DateTime, default=_dt.datetime.utcnow)
    id_user = _sql.Column(_sql.Integer, _sql.ForeignKey("users.id"))

    owner = _orm.relationship("User", back_populates="investors")
    investment = _orm.relationship("Investment", back_populates="investors")
    

class Event(_database.Base):
    __tablename__ = "events"
    id = _sql.Column(_sql.Integer, primary_key=True, index=True) #-> id event
    name = _sql.Column(_sql.String, index=True, default='') #-> nama event
    desc = _sql.Column(_sql.String, index=True, default='') #-> nama event
    target = _sql.Column(_sql.Integer, index=True, default=0) #-> target event
    terkumpul = _sql.Column(_sql.Integer, index=True, default=0)
    keuntungan = _sql.Column(_sql.Integer, index=True, default=0)
    tenor = _sql.Column(_sql.Integer, index=True, default=0)
    status = _sql.Column(_sql.String, index=True, default='ongoing')
    id_umkm = _sql.Column(_sql.Integer, _sql.ForeignKey("umkms.id"))
    date_created = _sql.Column(_sql.DateTime, default=_dt.datetime.utcnow)
    date_last_updated = _sql.Column(_sql.DateTime, default=_dt.datetime.utcnow)
    
    umkms = _orm.relationship("Umkm", back_populates="event")
    investment = _orm.relationship("Investment", back_populates="event")
class Investment(_database.Base):
    __tablename__ = "investments"
    id = _sql.Column(_sql.Integer, primary_key=True, index=True) #-> id investment
    jumlah_investasi = _sql.Column(_sql.Integer, index=True) #-> jumlah investasi
    tanggal_investasi = _sql.Column(_sql.DateTime, index=True, default=_dt.datetime.utcnow) #-> date investasi
    id_event = _sql.Column(_sql.Integer, _sql.ForeignKey("events.id")) #-> foreignkey ke event
    id_investor = _sql.Column(_sql.Integer, _sql.ForeignKey("investors.id")) #-> foreignkey ke event

    riwayat_cicilan = _orm.relationship("Riwayat_cicilan", back_populates="investment")
    event = _orm.relationship("Event", back_populates="investment")
    investors = _orm.relationship("Investor", back_populates="investment")
    
class Riwayat_cicilan(_database.Base):
    __tablename__ = "riwayat_cicilan"
    id = _sql.Column(_sql.Integer, primary_key=True, index=True)
    saldo_cicilan = _sql.Column(_sql.Integer, index=True)
    jatuh_tempo = _sql.Column(_sql.DateTime, index=True)
    id_investment = _sql.Column(_sql.Integer, _sql.ForeignKey("investments.id"))

    investment = _orm.relationship("Investment", back_populates="riwayat_cicilan")
    
class Riwayat_saldo(_database.Base):
    __tablename__ = "riwayat_saldo"
    id = _sql.Column(_sql.Integer, primary_key=True, index=True)
    nominal = _sql.Column(_sql.Integer, index=True)
    status = _sql.Column(_sql.String, index=True)
    deskripsi = _sql.Column(_sql.String, index=True)
    id_user = _sql.Column(_sql.Integer, _sql.ForeignKey("users.id"))

    user =  _orm.relationship("User", back_populates="riwayat_saldo")