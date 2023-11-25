  CREATE TABLE "HCM_NN_EOD_STOCK" 
   (	"SYMBOL" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"EXCHANGE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"STOCKDATE" TIMESTAMP (6) NOT NULL ENABLE, 
	"OPEN" NUMBER(3,6), 
	"HIGH" NUMBER(3,6), 
	"LOW" NUMBER(3,6), 
	"CLOSE" NUMBER(3,6), 
	"VOLUME" NUMBER(1,16), 
	"DIVIDEND" NUMBER(3,6), 
	 CONSTRAINT "HCM_NN_EOD_STOCK_PK" PRIMARY KEY ("SYMBOL", "EXCHANGE")
  USING INDEX  ENABLE
   ) ;

   COMMENT ON COLUMN "HCM_NN_EOD_STOCK"."SYMBOL" IS 'Returns the stock ticker symbol of the current data object.';
   COMMENT ON COLUMN "HCM_NN_EOD_STOCK"."EXCHANGE" IS 'Returns the exchange MIC identification associated with the current data object.';
   COMMENT ON COLUMN "HCM_NN_EOD_STOCK"."STOCKDATE" IS 'Returns the exact UTC date/time the given data was collected in ISO-8601 format.';
   COMMENT ON COLUMN "HCM_NN_EOD_STOCK"."OPEN" IS 'Returns the raw opening price of the given stock ticker.';
   COMMENT ON COLUMN "HCM_NN_EOD_STOCK"."HIGH" IS 'Returns the raw high price of the given stock ticker.';
   COMMENT ON COLUMN "HCM_NN_EOD_STOCK"."LOW" IS 'Returns the raw low price of the given stock ticker.';
   COMMENT ON COLUMN "HCM_NN_EOD_STOCK"."CLOSE" IS 'Returns the raw closing price of the given stock ticker.';
   COMMENT ON COLUMN "HCM_NN_EOD_STOCK"."VOLUME" IS 'Returns the raw volume of the given stock ticker.';
   COMMENT ON COLUMN "HCM_NN_EOD_STOCK"."DIVIDEND" IS 'Returns the dividend, which are the distribution of earnings to shareholders';
   COMMENT ON TABLE "HCM_NN_EOD_STOCK"  IS 'Table to store End-of-Day Data Stock Ticker';