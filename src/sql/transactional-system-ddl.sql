DROP TABLE IF EXISTS FF$TX_CHANGE_LOGS;
CREATE TABLE FF$TX_CHANGE_LOGS(
	OBJ_OID BIGINT NOT NULL,
	OBJ_ATTR varchar(255) NOT NULL,
	TX_NUMBER int(11),
        INDEX (TX_NUMBER)
) TYPE=InnoDB;

DROP TABLE IF EXISTS FF$LAST_TX_PROCESSED;
CREATE TABLE FF$LAST_TX_PROCESSED(
        SERVER varchar(255) NOT NULL,
	LAST_TX int(11) NOT NULL,
	LAST_UPDATE timestamp
) TYPE=InnoDB;

DROP TABLE IF EXISTS `FF$TRANSACTION_STATISTICS`;
CREATE TABLE `FF$TRANSACTION_STATISTICS` (
  `SERVER` varchar(255) NOT NULL default '',
  `NUM_REPORT` int(11) NOT NULL,
  `NUM_READS` int(11) NOT NULL,
  `NUM_WRITES` int(11) NOT NULL,
  `NUM_ABORTS` int(11) NOT NULL,
  `NUM_CONFLICTS` int(11) NOT NULL,
  `SECONDS` int(11) NOT NULL,
  `STATS_WHEN` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `READ_ONLY_READS_MIN` int(11),
  `READ_ONLY_READS_MAX` int(11),
  `READ_ONLY_READS_SUM` BIGINT,
  `READ_WRITE_READS_MIN` int(11),
  `READ_WRITE_READS_MAX` int(11),
  `READ_WRITE_READS_SUM` BIGINT,
  `READ_WRITE_WRITES_MIN` int(11),
  `READ_WRITE_WRITES_MAX` int(11),
  `READ_WRITE_WRITES_SUM` BIGINT
) TYPE=InnoDB;

DROP TABLE IF EXISTS FF$SERVICE_LOG;
CREATE TABLE FF$SERVICE_LOG (
	INVOCATION_DATE timestamp NOT NULL,
	INVOKER_USERNAME varchar(10) default NULL,
	SERVICE_NAME varchar(255) NOT NULL,
	SERVICE_ARGUMENTS text default NULL
) TYPE=InnoDB;

DROP TABLE IF EXISTS FF$DOMAIN_CLASS_INFO;
CREATE TABLE FF$DOMAIN_CLASS_INFO (
    DOMAIN_CLASS_NAME varchar(255) not null,
    DOMAIN_CLASS_ID int(11) not null,
    UNIQUE KEY U1 (DOMAIN_CLASS_NAME),
    UNIQUE KEY U2 (DOMAIN_CLASS_ID)
) Type=InnoDB;

DROP TABLE IF EXISTS FF$PERSISTENT_ROOT;
CREATE TABLE `FF$PERSISTENT_ROOT` (
  `ID_INTERNAL` int(11) NOT NULL AUTO_INCREMENT,
  `OID` bigint(20) DEFAULT NULL,
  `OID_NEXT` bigint(20) DEFAULT NULL,
  `OID_PREVIOUS` bigint(20) DEFAULT NULL,
  `OID_ROOT_OBJECT` bigint(20) DEFAULT NULL,
  `ROOT_KEY` longtext,
  PRIMARY KEY (`ID_INTERNAL`),
  KEY `OID` (`OID`)
) TYPE=InnoDB;

INSERT INTO FF$PERSISTENT_ROOT VALUES (1, 1, null, null, null, null);
