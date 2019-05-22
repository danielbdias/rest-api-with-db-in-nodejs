-- Table Addresses

CREATE SEQUENCE "public"."sq_addresses_id"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE TABLE "public"."Addresses" (
  "id" INTEGER NOT NULL DEFAULT NEXTVAL('sq_addresses_id'::regclass),
  "name" VARCHAR(2044) NOT NULL,
  "number" INTEGER,
  "complement" VARCHAR(2044),
  "zipCode" VARCHAR(2044) NOT NULL,
  "city" VARCHAR(2044) NOT NULL,
  "state" VARCHAR(2044) NOT NULL,
  "kind" VARCHAR(2044) NOT NULL,
  "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL,
  "updatedAt" TIMESTAMP WITH TIME ZONE,
  CONSTRAINT "PK_Addresses_id" PRIMARY KEY("id")
);

ALTER SEQUENCE "public"."sq_addresses_id" OWNED BY "public"."Addresses"."id";

-- Table GPS

CREATE SEQUENCE "public"."sq_gps_id"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE TABLE "public"."GPS" (
  "id" INTEGER NOT NULL DEFAULT NEXTVAL('sq_gps_id'::regclass),
  "type" VARCHAR(2044) NOT NULL,
  "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL,
  "updatedAt" TIMESTAMP WITH TIME ZONE,
  CONSTRAINT "PK_GPS_id" PRIMARY KEY("id")
);

ALTER SEQUENCE "public"."sq_gps_id" OWNED BY "public"."GPS"."id";

-- Table Users

CREATE SEQUENCE "public"."sq_users_id"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE TABLE "public"."Users" (
  "id" INTEGER NOT NULL DEFAULT NEXTVAL('sq_users_id'::regclass),
  "name" VARCHAR(2044) NOT NULL,
  "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL,
  "updatedAt" TIMESTAMP WITH TIME ZONE,
  CONSTRAINT "PK_Users_id" PRIMARY KEY("id")
);

ALTER SEQUENCE "public"."sq_users_id" OWNED BY "public"."Users"."id";

-- Table SearchHistories

CREATE SEQUENCE "public"."sq_searchhistories_id"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE TABLE "public"."SearchHistories" (
  "id" INTEGER NOT NULL DEFAULT NEXTVAL('sq_searchhistories_id'::regclass),
  "originAddressId" INTEGER NOT NULL,
  "destinationAddressId" INTEGER NOT NULL,
  "userId" INTEGER NOT NULL,
  "gpsId" INTEGER NOT NULL,
  "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL,
  CONSTRAINT "PK_SearchHistories_id" PRIMARY KEY("id")
);

ALTER SEQUENCE "public"."sq_searchhistories_id" OWNED BY "public"."SearchHistories"."id";

ALTER TABLE "public"."SearchHistories"
  ADD CONSTRAINT "FK_SearchHistories_Addresses_OriginAddress" FOREIGN KEY ("originAddressId")
    REFERENCES "public"."Addresses"("id");

ALTER TABLE "public"."SearchHistories"
  ADD CONSTRAINT "FK_SearchHistories_Addresses_DestinationAddress" FOREIGN KEY ("destinationAddressId")
    REFERENCES "public"."Addresses"("id");

ALTER TABLE "public"."SearchHistories"
  ADD CONSTRAINT "FK_SearchHistories_Users" FOREIGN KEY ("userId")
    REFERENCES "public"."Users"("id");

ALTER TABLE "public"."SearchHistories"
  ADD CONSTRAINT "FK_SearchHistories_GPS" FOREIGN KEY ("gpsId")
    REFERENCES "public"."GPS"("id");
