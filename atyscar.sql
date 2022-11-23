#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: CLIENT
#------------------------------------------------------------

CREATE TABLE CLIENT(
        NumC           Varchar (25) NOT NULL ,
        NomC           Varchar (25) NOT NULL ,
        PrenomC        Varchar (25) NOT NULL ,
        DatNaisC       Date NOT NULL ,
        LieuNaisC      Varchar (25) NOT NULL ,
        NationaliteC   Varchar (25) NOT NULL ,
        AdrVilC        Varchar (25) NOT NULL ,
        AdrRueC        Varchar (25) NOT NULL ,
        CodPosC        Varchar (25) NOT NULL ,
        TelC           Varchar (25) NOT NULL ,
        NumPasC        Varchar (25) NOT NULL ,
        DatDelPasC     Date NOT NULL ,
        LieuDelPasC    Varchar (25) NOT NULL ,
        PaysDelPasC    Varchar (25) NOT NULL ,
        NumPermisC     Varchar (25) NOT NULL ,
        DatDelPermiC   Date NOT NULL ,
        LieuDelPermisC Varchar (25) NOT NULL ,
        AutreAdr       Varchar (25) ,
        Remarques      Varchar (25) ,
        CodTypC        Int NOT NULL ,
        PRIMARY KEY (NumC )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: VEHICULE
#------------------------------------------------------------

CREATE TABLE VEHICULE(
        MatV     Varchar (25) NOT NULL ,
        ImmatV   Varchar (25) NOT NULL ,
        TypeV    Varchar (25) NOT NULL ,
        MarV     Varchar (25) NOT NULL ,
        ModV     Varchar (25) NOT NULL ,
        CatV     Varchar (25) NOT NULL ,
        PuisV    Int NOT NULL ,
        CarbV    Varchar (25) NOT NULL ,
        CoulV    Varchar (25) NOT NULL ,
        NbPlV    Int NOT NULL ,
        AnnV     Int NOT NULL ,
        KilDernE Int NOT NULL ,
        KilProE  Int NOT NULL ,
        PRIMARY KEY (MatV )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CONTRAT
#------------------------------------------------------------

CREATE TABLE CONTRAT(
        NumCont     Varchar (25) NOT NULL ,
        DatDebCont  Date NOT NULL ,
        HeurDepCont Datetime ,
        DatRetCont  Date NOT NULL ,
        HeurRetCont Datetime NOT NULL ,
        VilDepCont  Varchar (25) NOT NULL ,
        VilRetCont  Varchar (25) NOT NULL ,
        NumC        Varchar (25) ,
        MatV        Varchar (25) NOT NULL ,
        CodTypTarif Int ,
        PRIMARY KEY (NumCont )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: TYPE_CLIENT
#------------------------------------------------------------

CREATE TABLE TYPE_CLIENT(
        CodTypC int (11) Auto_increment  NOT NULL ,
        LibTypC Varchar (25) NOT NULL ,
        RemTypC Float NOT NULL ,
        PRIMARY KEY (CodTypC )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PERIODE
#------------------------------------------------------------

CREATE TABLE PERIODE(
        CodPerT Varchar (25) NOT NULL ,
        LibPerT Varchar (25) NOT NULL ,
        PRIMARY KEY (CodPerT )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: OPERATION_ENTRETIEN
#------------------------------------------------------------

CREATE TABLE OPERATION_ENTRETIEN(
        CodeOpE Varchar (25) NOT NULL ,
        DescOpE Varchar (25) NOT NULL ,
        PRIMARY KEY (CodeOpE )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: DATE_ENTRETIEN
#------------------------------------------------------------

CREATE TABLE DATE_ENTRETIEN(
        Date_Ent Date NOT NULL ,
        PRIMARY KEY (Date_Ent )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: TYPE_CONTRAT
#------------------------------------------------------------

CREATE TABLE TYPE_CONTRAT(
        CodTypTarif int (11) Auto_increment  NOT NULL ,
        LibTypTarif Varchar (25) ,
        PRIMARY KEY (CodTypTarif )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: TARIFER
#------------------------------------------------------------

CREATE TABLE TARIFER(
        tarif       DECIMAL (15,3)  ,
        CodTypC     Int NOT NULL ,
        CodPerT     Varchar (25) NOT NULL ,
        CodTypTarif Int NOT NULL ,
        PRIMARY KEY (CodTypC ,CodPerT ,CodTypTarif )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ENTRETENIR
#------------------------------------------------------------

CREATE TABLE ENTRETENIR(
        KilomE   Int ,
        CodeOpE  Varchar (25) NOT NULL ,
        MatV     Varchar (25) NOT NULL ,
        Date_Ent Date NOT NULL ,
        PRIMARY KEY (CodeOpE ,MatV ,Date_Ent )
)ENGINE=InnoDB;

ALTER TABLE CLIENT ADD CONSTRAINT FK_CLIENT_CodTypC FOREIGN KEY (CodTypC) REFERENCES TYPE_CLIENT(CodTypC);
ALTER TABLE CONTRAT ADD CONSTRAINT FK_CONTRAT_NumC FOREIGN KEY (NumC) REFERENCES CLIENT(NumC);
ALTER TABLE CONTRAT ADD CONSTRAINT FK_CONTRAT_MatV FOREIGN KEY (MatV) REFERENCES VEHICULE(MatV);
ALTER TABLE CONTRAT ADD CONSTRAINT FK_CONTRAT_CodTypTarif FOREIGN KEY (CodTypTarif) REFERENCES TYPE_CONTRAT(CodTypTarif);
ALTER TABLE TARIFER ADD CONSTRAINT FK_TARIFER_CodTypC FOREIGN KEY (CodTypC) REFERENCES TYPE_CLIENT(CodTypC);
ALTER TABLE TARIFER ADD CONSTRAINT FK_TARIFER_CodPerT FOREIGN KEY (CodPerT) REFERENCES PERIODE(CodPerT);
ALTER TABLE TARIFER ADD CONSTRAINT FK_TARIFER_CodTypTarif FOREIGN KEY (CodTypTarif) REFERENCES TYPE_CONTRAT(CodTypTarif);
ALTER TABLE ENTRETENIR ADD CONSTRAINT FK_ENTRETENIR_CodeOpE FOREIGN KEY (CodeOpE) REFERENCES OPERATION_ENTRETIEN(CodeOpE);
ALTER TABLE ENTRETENIR ADD CONSTRAINT FK_ENTRETENIR_MatV FOREIGN KEY (MatV) REFERENCES VEHICULE(MatV);
ALTER TABLE ENTRETENIR ADD CONSTRAINT FK_ENTRETENIR_Date_Ent FOREIGN KEY (Date_Ent) REFERENCES DATE_ENTRETIEN(Date_Ent);
