from typing import List
import fastapi as _fastapi
import sqlalchemy.orm as _orm
import services as _services, schemas as _schemas
from fastapi.middleware.cors import CORSMiddleware

from apscheduler.schedulers.blocking import BlockingScheduler
from apscheduler.triggers.cron import CronTrigger
import database as _database

app = _fastapi.FastAPI()
app.add_middleware(
	CORSMiddleware,
	allow_origins=["*"],
	allow_credentials=True,
	allow_methods=["*"],
	allow_headers=["*"],
)
_services.create_database()

@app.get("/users/", response_model=List[_schemas.User])
def read_users(
    skip: int = 0,
    limit: int = 10,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    umkms = _services.get_users(db=db, skip=skip, limit=limit)
    return umkms
@app.post("/users/{isInvestor}", response_model=_schemas.User)
def create_user(
    user: _schemas.UserCreate, isInvestor:bool, db: _orm.Session = _fastapi.Depends(_services.get_db)
):
    db_user = _services.get_user_by_email(db=db, email=user.email)
    if db_user:
        raise _fastapi.HTTPException(
            status_code=400, detail="woops the email is in use"
        )
    return _services.create_user(db=db, user=user, isInvestor=isInvestor)

@app.post("/login-user/", response_model=_schemas.User)
def login_user(user: _schemas.UserLogin, db: _orm.Session = _fastapi.Depends(_services.get_db)):
    db_user = _services.get_user_by_email(db=db, email=user.email)
    if db_user is not None:
        if db_user.password != user.password:
            raise _fastapi.HTTPException(status_code=400, detail="Incorrect password")
    else:
        raise _fastapi.HTTPException(status_code=404, detail="User not found")
    return db_user
# ============================= UMKM ==============================
@app.get("/umkms/", response_model=List[_schemas.Umkm])
def read_umkms(
    skip: int = 0,
    limit: int = 10,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    umkms = _services.get_umkms(db=db, skip=skip, limit=limit)
    return umkms


@app.get("/users/{user_id}/umkm", response_model=_schemas.Umkm)
def read_umkm_by_user_id(user_id: int, db: _orm.Session = _fastapi.Depends(_services.get_db)):
    umkm = _services.get_umkm_by_user_id(db=db, user_id=user_id)
    if umkm is None:
        raise _fastapi.HTTPException(
            status_code=404, detail="sorry this umkm does not exist"
        )

    return umkm


@app.get("/umkms/{umkm_id}", response_model=_schemas.Umkm)
def read_umkm(umkm_id: int, db: _orm.Session = _fastapi.Depends(_services.get_db)):
    umkm = _services.get_umkm(db=db, umkm_id=umkm_id)
    if umkm is None:
        raise _fastapi.HTTPException(
            status_code=404, detail="sorry this umkm does not exist"
        )

    return umkm

@app.post("/users/{user_id}/umkm", response_model=_schemas.Umkm)
def login_umkm(umkm: _schemas.UmkmCreate, user_id:int, db: _orm.Session = _fastapi.Depends(_services.get_db)):
    return _services.create_umkm(db=db, umkm=umkm, user_id=user_id)

@app.put("/umkms/{umkm_id}", response_model=_schemas.Umkm)
def update_umkm(
    umkm_id: int,
    umkm: _schemas.UmkmCreate,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    return _services.update_umkm(db=db, umkm=umkm, umkm_id=umkm_id)

@app.put("/umkms/{umkm_id}/saldo", response_model=_schemas.Umkm)
def update_umkm_saldo(
    umkm_id: int,
    umkm: _schemas._UmkmSaldo,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    return _services.update_saldo_umkm(db=db, umkm=umkm, umkm_id=umkm_id)

# ============================= Investor ==============================
@app.get("/investors/", response_model=List[_schemas.Investor])
def read_investors(
    skip: int = 0,
    limit: int = 10,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    investors = _services.get_investors(db=db, skip=skip, limit=limit)
    return investors


@app.get("/users/{user_id}/investor", response_model=_schemas.Investor)
def read_investor_by_user_id(user_id: int, db: _orm.Session = _fastapi.Depends(_services.get_db)):
    investor = _services.get_investor_by_user_id(db=db, user_id=user_id)
    if investor is None:
        raise _fastapi.HTTPException(
            status_code=404, detail="sorry this investor does not exist"
        )

    return investor


@app.get("/investors/{investor_id}", response_model=_schemas.Investor)
def read_investor(investor_id: int, db: _orm.Session = _fastapi.Depends(_services.get_db)):
    investor = _services.get_investor(db=db, investor_id=investor_id)
    if investor is None:
        raise _fastapi.HTTPException(
            status_code=404, detail="sorry this investor does not exist"
        )

    return investor

@app.post("/users/{user_id}/investor", response_model=_schemas.Investor)
def login_investor(investor: _schemas.InvestorCreate, user_id:int, db: _orm.Session = _fastapi.Depends(_services.get_db)):
    return _services.create_investor(db=db, investor=investor, user_id=user_id)

@app.put("/investors/{investor_id}", response_model=_schemas.Investor)
def update_investor(
    investor_id: int,
    investor: _schemas.InvestorCreate,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    return _services.update_investor(db=db, investor=investor, investor_id=investor_id)

@app.put("/investors/{investor_id}/saldo", response_model=_schemas.Investor)
def update_investor_saldo(
    investor_id: int,
    investor: _schemas._InvestorSaldo,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    return _services.update_saldo_investor(db=db, investor=investor, investor_id=investor_id)

# ======================== Events ========================

@app.get("/events/", response_model= List[_schemas.Event] )
def read_events(
    skip: int = 0,
    limit: int = 1000,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    events = _services.get_all_events(db=db, skip=skip, limit=limit)
    return events

@app.get("/events/{event_id}/event", response_model=_schemas.Event)
def read_event_by_event_id(event_id: int, db: _orm.Session = _fastapi.Depends(_services.get_db)):
    event = _services.get_event_by_id(db=db, id=event_id)
    if event is None:
        raise _fastapi.HTTPException(
            status_code=404, detail="sorry this events does not exist"
        )
    return event

@app.get("/events/{id_umkm}", response_model=_schemas.Event)
def read_event_by_id_umkm(id_umkm: int, db: _orm.Session = _fastapi.Depends(_services.get_db)):
    events = _services.get_event_by_id_umkm(db=db, id_umkm=id_umkm)
    if events is None:
        raise _fastapi.HTTPException(
            status_code=404, detail="sorry this events does not exist"
        )
    return events

@app.get("/events/{id_umkm}/{status}/details")
def read_event_details(id_umkm: int, status: str, db: _orm.Session = _fastapi.Depends(_services.get_db)):
    event_details = _services.get_event_details_by_id_umkm_and_status(db=db, id_umkm=id_umkm, status=status)
    if event_details is None:
        raise _fastapi.HTTPException(
            status_code=404, detail="Event not found"
        )
    return event_details

@app.get("/events/{id_umkm}/{event_id}/{status}")
def read_ongoing_events(
    id_umkm: int, event_id: int, status: str, db: _orm.Session = _fastapi.Depends(_services.get_db)
):
    event = _services.get_ongoing_events(db=db, id_umkm=id_umkm, event_id=event_id, status=status)
    if event is None:
        raise _fastapi.HTTPException(
            status_code=404, detail="Event not found"
        )
    return event

@app.put("/events/{event_id}/terkumpul")
def update_event_terkumpul(
    event_id: int, event: _schemas.EventTerkumpul, db: _orm.Session = _fastapi.Depends(_services.get_db)
):
    updated_event = _services.update_event(db=db, terkumpul=event, event_id=event_id)
    if updated_event is None:
        raise _fastapi.HTTPException(
            status_code=404, detail="Event not found"
        )
    return updated_event

@app.put("/events/{event_id}/status", response_model=_schemas.Event)
def update_event_status(
    event_id: int, event: _schemas.EventStatus,db: _orm.Session = _fastapi.Depends(_services.get_db)
):
    updated_event = _services.update_event_status(db=db, event=event, event_id=event_id)
    if updated_event is None:
        raise _fastapi.HTTPException(
            status_code=404, detail="Event not found"
        )
    return updated_event

#  penddanaa berlangsung
@app.get("/events/{id_umkm}/details")
def read_event_details(id_umkm: int, db: _orm.Session = _fastapi.Depends(_services.get_db)):
    event_details = _services.get_event_details_by_id_umkm(
        db=db, id_umkm=id_umkm)
    if event_details is None:
        raise _fastapi.HTTPException(
            status_code=404, detail="Event not found"
        )
    return event_details

@app.post("/events/{id_umkm}", response_model=_schemas.Event)
def create_event(
    event: _schemas.EventCreate, id_umkm:int, db: _orm.Session = _fastapi.Depends(_services.get_db)
):
    return _services.create_event(db=db, event=event, id_umkm=id_umkm)


# investment
@app.post("/investments/{id_event}/{id_investor}", response_model=_schemas.Investment)
def create_investment(
    investment: _schemas.InvestmentCreate,
    id_event: int,
    id_investor: int,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    return _services.create_investment(db=db, investment=investment, id_event=id_event, id_investor=id_investor)

@app.get("/investments/", response_model=List[_schemas.RiwayatCicilan])
def read_riwayat_cicilans(
    skip: int = 0,
    limit: int = 100,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    investments = _services.get_investments(db=db, skip=skip, limit=limit)
    return investments

#riwayat_cicilan
@app.get("/riwayat-cicilans/", response_model=List[_schemas.RiwayatCicilan])
def read_riwayat_cicilans(
    skip: int = 0,
    limit: int = 100,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    riwayat_cicilans = _services.get_riwayat_cicilans(db=db, skip=skip, limit=limit)
    return riwayat_cicilans


@app.get("/riwayat-cicilans/{riwayat_cicilan_id}", response_model=_schemas.RiwayatCicilan)
def read_riwayat_cicilan(
    riwayat_cicilan_id: int,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    riwayat_cicilan = _services.get_riwayat_cicilan(db=db, riwayat_cicilan_id=riwayat_cicilan_id)
    if riwayat_cicilan is None:
        raise _fastapi.HTTPException(status_code=404, detail="Riwayat cicilan not found")
    return riwayat_cicilan


@app.post("/riwayat-cicilans/{id_investment}", response_model=_schemas.RiwayatCicilan)
def create_riwayat_cicilan(
    riwayat_cicilan: _schemas.RiwayatCicilanCreate,
    id_investment: int,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    return _services.create_riwayat_cicilan(db=db, riwayat_cicilan=riwayat_cicilan, id_investment=id_investment)

@app.put("/riwayat-cicilans/{riwayat_cicilan_id}", response_model=_schemas.RiwayatCicilan)
def update_riwayat_cicilan(
    riwayat_cicilan_id: int,
    riwayat_cicilan: _schemas.RiwayatCicilanCreate,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    db_riwayat_cicilan = _services.update_riwayat_cicilan(db=db, riwayat_cicilan_id=riwayat_cicilan_id, riwayat_cicilan=riwayat_cicilan)
    if db_riwayat_cicilan is None:
        raise _fastapi.HTTPException(status_code=404, detail="Riwayat cicilan not found")
    return db_riwayat_cicilan

#riwayat_saldo
@app.get("/riwayatsaldos/", response_model=List[_schemas.RiwayatSaldo])
def read_riwayatsaldos(
    skip: int = 0,
    limit: int = 100,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    riwaysatsaldos = _services.get_riwayat_saldos(db=db, skip=skip, limit=limit)
    return riwaysatsaldos


@app.get("/riwayatsaldos/{riwayatsaldo_id}", response_model=_schemas.RiwayatSaldo)
def read_riwayatsaldo(
    riwayatsaldo_id: int,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    riwayatsaldo = _services.get_riwayat_saldo(db=db, riwayatsaldo_id=riwayatsaldo_id)
    if riwayatsaldo is None:
        raise _fastapi.HTTPException(status_code=404, detail="Riwayat saldo not found")
    return riwayatsaldo

@app.post("/users/{user_id}/riwayatsaldos", response_model=_schemas.RiwayatSaldo)
def create_riwayatsaldo(
    riwayatsaldo: _schemas.RiwayatSaldoCreate,
    user_id: int,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    return _services.create_riwayat_saldo(db=db, riwayat_saldo=riwayatsaldo, user_id=user_id)

@app.put("/riwayatsaldos/{riwayatsaldo_id}", response_model=_schemas.RiwayatSaldo)
def update_riwayatsaldo(
    riwayatsaldo_id: int,
    riwayatsaldo: _schemas.RiwayatSaldoCreate,
    db: _orm.Session = _fastapi.Depends(_services.get_db),
):
    db_riwayatsaldo = _services.update_riwayatsaldo(db=db, riwayatsaldo_id=riwayatsaldo_id, riwayatsaldo=riwayatsaldo)
    if db_riwayatsaldo is None:
        raise _fastapi.HTTPException(status_code=404, detail="Riwayat saldo not found")
    return db_riwayatsaldo


@app.get("/users/{user_id}/riwayatsaldos", response_model=List[_schemas.RiwayatSaldo])
def read_riwayatsaldos_by_user_id(user_id: int, db: _orm.Session = _fastapi.Depends(_services.get_db)):
    riwayatsaldos = _services.get_riwayat_saldos_by_user_id(db=db, user_id=user_id)
    return riwayatsaldos


@app.get("/umkms/{umkm_id}/total-monthly-installment")
def get_total_monthly_installment_for_umkm_endpoint(umkm_id: int, db: _orm.Session = _fastapi.Depends(_services.get_db)):
    total_monthly_installment = _services.get_total_monthly_installment_for_umkm(db, umkm_id)
    return {"total": total_monthly_installment}

# main.py

# ...

@app.put("/events/{event_id}", response_model=_schemas.Event)
def update_event_by_id_endpoint(event_id: int, event_data: _schemas.EventCreate, db: _orm.Session = _fastapi.Depends(_services.get_db)):
    event = _services.update_event_by_id(db=db, event_id=event_id, event_data=event_data)
    if event is None:
        raise _fastapi.HTTPException(status_code=404, detail="Event not found")
    return event


@app.post("/umkms/{umkm_id}/distribute-profits")
def distribute_event_profits_endpoint(umkm_id: int, db: _orm.Session = _fastapi.Depends(_services.get_db)):
    _services.distribute_event_profits(db=db, umkm_id=umkm_id)
    return {"message": "Profits distributed successfully"}

@app.get("/events/{umkm_id}/{status}")
def get_events_by_status_endpoint(umkm_id: int, status: str, db: _orm.Session = _fastapi.Depends(_services.get_db)):
    events = _services.get_events_by_status(db=db, umkm_id=umkm_id, status=status)
    return events