import database as _database, models as _models, schemas as _schemas
import sqlalchemy.orm as _orm
import passlib.hash as _hash
import jwt as _jwt
import fastapi as _fastapi
import fastapi.security as _security
from datetime import datetime, timedelta

from apscheduler.schedulers.blocking import BlockingScheduler

_JWT_SECRET = "thisisnotverysafe"
oauth2schema = _security.OAuth2PasswordBearer("/borrower/token/")

def create_database():
    return _database.Base.metadata.create_all(bind=_database.engine)


def get_db():
    db = _database.SessionLocal()
    try:
        yield db
    finally:
        db.close()


def get_user(db: _orm.Session, user_id: int):
    return db.query(_models.User).filter(_models.User.id == user_id).first()


def get_user_by_email(db: _orm.Session, email: str):
    return db.query(_models.User).filter(_models.User.email == email).first()

def get_user_by_email_pass(db: _orm.Session, email: str, password: str):
    return db.query(_models.User).filter(_models.User.email == email & _models.User.hashed_password == password).first()


def get_users(db: _orm.Session, skip: int = 0, limit: int = 100):
    return db.query(_models.User).offset(skip).limit(limit).all()


def create_user(db: _orm.Session, user: _schemas.UserCreate, isInvestor:bool):
    fake_hashed_password = user.password
    db_user = _models.User(**user.dict(),isInvestor=isInvestor)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user


def create_token(user: _models.User):
    user_schema_obj = _schemas.User.from_orm(user)
    user_dict = user_schema_obj.dict()

    expires = datetime.utcnow() + timedelta(
        minutes=60
    )  # Example: Token expires in 1 hour
    user_dict["exp"] = expires

    token = _jwt.encode(user_dict, _JWT_SECRET)
    return dict(access_token=token, token_type="bearer")

# ============================== UMKM ==================================
def get_umkms(db: _orm.Session, skip: int = 0, limit: int = 10):
    return db.query(_models.Umkm).offset(skip).limit(limit).all()


def create_umkm(db: _orm.Session, umkm: _schemas.UmkmCreate, user_id: int):
    umkm = _models.Umkm(**umkm.dict(), id_user=user_id)
    db.add(umkm)
    db.commit()
    db.refresh(umkm)
    return umkm

def get_umkm_by_user_id(db: _orm.Session, user_id:int):
    return db.query(_models.Umkm    ).filter(_models.Umkm.id_user == user_id).first()

def get_umkm(db: _orm.Session, umkm_id: int):
    return db.query(_models.Umkm).filter(_models.Umkm.id == umkm_id).first()


def delete_umkm(db: _orm.Session, umkm_id: int):
    db.query(_models.Umkm).filter(_models.Umkm.id == umkm_id).delete()
    db.commit()


def update_umkm(db: _orm.Session, umkm_id: int, umkm: _schemas.UmkmCreate):
    db_umkm = get_umkm(db=db, umkm_id=umkm_id)
    db_umkm.name = umkm.name
    db_umkm.deskripsi = umkm.deskripsi
    db_umkm.alamat = umkm.alamat
    db_umkm.tahun_berdiri = umkm.tahun_berdiri
    db.commit()
    db.refresh(db_umkm)
    return db_umkm

def update_saldo_umkm(db: _orm.Session, umkm_id: int, umkm: _schemas.UmkmCreate):
    db_umkm = get_umkm(db=db, umkm_id=umkm_id)
    db_umkm.saldo = umkm.saldo + db_umkm.saldo
    db.commit()
    db.refresh(db_umkm)
    return db_umkm

# ============================== Investor ==================================
def get_investors(db: _orm.Session, skip: int = 0, limit: int = 10):
    return db.query(_models.Investor).offset(skip).limit(limit).all()


def create_investor(db: _orm.Session, investor: _schemas.InvestorCreate, user_id: int):
    investor = _models.Investor(**investor.dict(), id_user=user_id)
    db.add(investor)
    db.commit()
    db.refresh(investor)
    return investor

def get_investor_by_user_id(db: _orm.Session, user_id:int):
    return db.query(_models.Investor    ).filter(_models.Investor.id_user == user_id).first()

def get_investor(db: _orm.Session, investor_id: int):
    return db.query(_models.Investor).filter(_models.Investor.id == investor_id).first()


def delete_investor(db: _orm.Session, investor_id: int):
    db.query(_models.Investor).filter(_models.Investor.id == investor_id).delete()
    db.commit()


def update_investor(db: _orm.Session, investor_id: int, investor: _schemas.InvestorCreate):
    db_investor = get_investor(db=db, investor_id=investor_id)
    db_investor.name = investor.name
    db_investor.deskripsi = investor.deskripsi
    db_investor.alamat = investor.alamat
    db_investor.tahun_berdiri = investor.tahun_berdiri
    db.commit()
    db.refresh(db_investor)
    return db_investor

def update_saldo_investor(db: _orm.Session, investor_id: int, investor: _schemas.InvestorCreate):
    db_investor = get_investor(db=db, investor_id=investor_id)
    db_investor.saldo = investor.saldo + db_investor.saldo
    db.commit()
    db.refresh(db_investor)
    return db_investor

# ========================== Event ======================
def update_event(db: _orm.Session, event_id: int, terkumpul: _schemas.EventTerkumpul):
    event = db.query(_models.Event).filter(
        _models.Event.id == event_id,
    ).first()
    if event is None:
        return None
    event.terkumpul = terkumpul.terkumpul
    db.commit()
    db.refresh(event)
    return event
def update_event_status(db: _orm.Session, event_id: int, event: _schemas.EventStatus):
    db_event = get_event_by_id(db=db, id=event_id)
    db_event.status = event.status
    db.commit()
    db.refresh(db_event)
    return db_event
def get_ongoing_events(db: _orm.Session, id_umkm: int, event_id: int, status: str):
    return db.query(_models.Event).filter(
        _models.Event.status == status,
        _models.Event.id_umkm == id_umkm,
        _models.Event.id == event_id
    ).first()
def get_events_by_status(db: _orm.Session, umkm_id: int, status: str):
    return db.query(_models.Event).filter(_models.Event.id_umkm == umkm_id, _models.Event.status == status).all()

def get_event_details_by_id_umkm_and_status(db: _orm.Session, id_umkm: int, status: str):
    event = db.query(_models.Event).filter(_models.Event.id_umkm == id_umkm, _models.Event.status == status).first()
    if event:
        return {
            "id": event.id,
            "name": event.name,
            "target": event.target,
            "terkumpul": event.terkumpul,
            "desc": event.desc,
            "date_created": event.date_created,
            "date_last_updated": event.date_last_updated
        }
    else:
        return None

# Event
def get_all_events(db: _orm.Session, skip: int = 0, limit: int = 1000):
    return db.query(_models.Event).offset(skip).limit(limit).all()
 
def get_event_by_id(db: _orm.Session, id: int):
    return db.query(_models.Event).filter(_models.Event.id == id).first()
 
def get_event_by_id_umkm(db: _orm.Session, id_umkm: int):
    return db.query(_models.Event).filter(_models.Event.id_umkm == id_umkm).first()
 
def create_event(db: _orm.Session, event: _schemas.EventCreate, id_umkm: int):
    event = _models.Event(**event.dict(), id_umkm=id_umkm)
    db.add(event)
    db.commit()
    db.refresh(event)
    return event

def get_event_details_by_id_umkm(db: _orm.Session, id_umkm: int):
    event = db.query(_models.Event).filter(
        _models.Event.id_umkm == id_umkm).first()
    if event:
        return {
            "id": event.id,
            "name": event.name,
            "target": event.target,
            "terkumpul": event.terkumpul,
            "desc": event.desc,
            "date_created": event.date_created,
            "date_last_updated": event.date_last_updated
        }
    else:
        return None


#=============================INVESTMENT====================================
def get_investments(db: _orm.Session, skip: int = 0, limit: int = 100):
    return db.query(_models.Investment).offset(skip).limit(limit).all()


def get_investment(db: _orm.Session, investment_id: int):
    return db.query(_models.Investment).filter(_models.Investment.id == investment_id).first()


def create_investment(db: _orm.Session, investment: _schemas.InvestmentCreate, id_event: int, id_investor: int):
    investment = _models.Investment(**investment.dict(), id_event=id_event, id_investor=id_investor)
    db.add(investment)
    db.commit()
    db.refresh(investment)
    return investment


def update_investment(db: _orm.Session, investment_id: int, investment: _schemas.InvestmentCreate):
    db_investment = get_investment(db=db, investment_id=investment_id)
    db_investment.jumlah_investasi = investment.jumlah_investasi
    db_investment.tanggal_investasi = investment.tanggal_investasi
    db.commit()
    db.refresh(db_investment)
    return db_investment


#riwayat_cicilan
def get_riwayat_cicilans(db: _orm.Session, skip: int = 0, limit: int = 100):
    return db.query(_models.Riwayat_cicilan).offset(skip).limit(limit).all()


def get_riwayat_cicilan(db: _orm.Session, riwayat_cicilan_id: int):
    return db.query(_models.Riwayat_cicilan).filter(_models.Riwayat_cicilan.id == riwayat_cicilan_id).first()


def create_riwayat_cicilan(db: _orm.Session, riwayat_cicilan: _schemas.RiwayatCicilanCreate, id_investment: int):
    riwayat_cicilan = _models.Riwayat_cicilan(**riwayat_cicilan.dict(), id_investment=id_investment)
    db.add(riwayat_cicilan)
    db.commit()
    db.refresh(riwayat_cicilan)
    return riwayat_cicilan


def update_riwayat_cicilan(db: _orm.Session, riwayat_cicilan_id: int, riwayat_cicilan: _schemas.RiwayatCicilanCreate):
    db_riwayat_cicilan = get_riwayat_cicilan(db=db, riwayat_cicilan_id=riwayat_cicilan_id)
    db_riwayat_cicilan.saldo_cicilan = riwayat_cicilan.saldo_cicilan
    db_riwayat_cicilan.jatuh_tempo = riwayat_cicilan.jatuh_tempo
    db.commit()
    db.refresh(db_riwayat_cicilan)
    return db_riwayat_cicilan


#riwayat_saldo

def get_riwayat_saldos(db: _orm.Session, skip: int = 0, limit: int = 100):
    return db.query(_models.Riwayat_saldo).offset(skip).limit(limit).all()

def get_riwayat_saldo(db: _orm.Session, riwayat_saldo_id: int):
    return db.query(_models.Riwayat_saldo).filter(_models.Riwayat_saldo.id == riwayat_saldo_id).first()

def create_riwayat_saldo(db: _orm.Session, riwayat_saldo: _schemas.RiwayatSaldoCreate, user_id: int):
    riwayat_saldo = _models.Riwayat_saldo(**riwayat_saldo.dict(), id_user=user_id)
    db.add(riwayat_saldo)
    db.commit()
    db.refresh(riwayat_saldo)
    return riwayat_saldo

def update_riwayat_saldo(db: _orm.Session, riwayat_saldo_id: int, riwayat_saldo: _schemas.RiwayatSaldoCreate):
    db_riwayat_saldo = get_riwayat_saldo(db=db, riwayat_saldo_id=riwayat_saldo_id)
    db_riwayat_saldo.nominal = riwayat_saldo.nominal
    db_riwayat_saldo.status = riwayat_saldo.status
    db_riwayat_saldo.deskripsi = riwayat_saldo.deskripsi
    db.commit()
    db.refresh(db_riwayat_saldo)
    return db_riwayat_saldo


def get_riwayat_saldos_by_user_id(db: _orm.Session, user_id: int):
    return db.query(_models.Riwayat_saldo).filter(_models.Riwayat_saldo.id_user == user_id).all()



    
# services.py

# ...



def get_total_monthly_installment_for_umkm(db: _orm.Session, umkm_id: int):
    one_month_ago = datetime.now() - timedelta(days=0)
    completed_events = db.query(_models.Event).filter(_models.Event.status == "selesai", _models.Event.date_last_updated < one_month_ago, _models.Event.id_umkm == umkm_id).all()
    total_monthly_installment = 0
    for event in completed_events:
        cicilan_per_bulan = (event.terkumpul / event.tenor) * 1.05
        total_monthly_installment += cicilan_per_bulan
    return total_monthly_installment

# services.py

# ...

def update_event_by_id(db: _orm.Session, event_id: int, event_data: dict):
    event = db.query(_models.Event).filter(_models.Event.id == event_id).first()
    if event is None:
        return None
    # for key, value in event_data.items():
    #     setattr(event, key, value)
    event.target = event_data.target
    event.terkumpul = event_data.terkumpul
    db.commit()
    db.refresh(event)
    return event


def distribute_event_profits(db: _orm.Session, umkm_id: int):
    # Get all events for this UMKM
    events = db.query(_models.Event).filter(_models.Event.id_umkm == umkm_id).all()

    # For each event
    for event in events:
        # Calculate the monthly installment and profit for this event
        monthly_installment = event.terkumpul / event.tenor
        profit = monthly_installment * 0.05

        # Get all investments for this event
        investments = db.query(_models.Investment).filter(_models.Investment.id_event == event.id).all()

        # Calculate the total investment amount for this event
        total_investment_amount = sum(investment.jumlah_investasi for investment in investments)

        # Distribute the profit to each investor based on their investment amount
        for investment in investments:
            investor_share = (investment.jumlah_investasi / total_investment_amount) * profit
            investor = get_investor(db=db, investor_id=investment.id_investor)
            investor.saldo += investor_share
            db.commit()

        # Decrement the tenor of the event
        event.tenor -= 1

        # Check if this is the last installment of the event
        if event.tenor == 0:
            # Return the initial investment amount to each investor
            for investment in investments:
                investor = get_investor(db=db, investor_id=investment.id_investor)
                investor.saldo += investment.jumlah_investasi
                db.commit()

            # Update the event status to "selesai"
            event.status = "selesai"
            db.commit()