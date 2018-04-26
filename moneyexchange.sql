CREATE DATABASE `moneyexchange` /*!40100 DEFAULT CHARACTER SET utf8 */;

CREATE TABLE `agent` (
  `agentcode` char(12) NOT NULL,
  `agentfirstname` varchar(30) DEFAULT NULL,
  `agentlastname` varchar(25) DEFAULT NULL,
  `agentaddress1` varchar(45) DEFAULT NULL,
  `agentaddress2` varchar(45) DEFAULT NULL,
  `agentcity` varchar(25) DEFAULT NULL,
  `agentcountry` varchar(25) DEFAULT NULL,
  `agentidentitytype` varchar(45) DEFAULT NULL,
  `agentidentitynumber` varchar(45) DEFAULT NULL,
  `isactive` char(1) DEFAULT NULL,
  `verifiedagent` char(1) DEFAULT NULL,
  `supervisiorid` char(10) DEFAULT NULL,
  `contact` char(13) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `createdby` varchar(45) DEFAULT NULL,
  `modifiedby` varchar(45) DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  `agentype` int(11) DEFAULT NULL,
  `limitid` int(11) DEFAULT NULL,
  PRIMARY KEY (`agentcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `agentcommision_master` (
  `commissionrate` varchar(45) NOT NULL,
  `isactive` varchar(45) NOT NULL,
  `agentcode` varchar(45) NOT NULL,
  `fromdate` datetime DEFAULT NULL,
  `todate` datetime DEFAULT NULL,
  `createdby` char(10) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  PRIMARY KEY (`agentcode`,`isactive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `agenttransactionlimit` (
  `limitid` int(11) NOT NULL,
  `limitfrequency` varchar(10) DEFAULT NULL,
  `limitamount` decimal(18,2) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `createdby` char(10) DEFAULT NULL,
  `isactive` char(1) DEFAULT NULL,
  PRIMARY KEY (`limitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `beneficiary` (
  `beneficiaryid` char(12) NOT NULL,
  `customerid` char(12) NOT NULL,
  `beneficiaryfirstname` varchar(35) DEFAULT NULL,
  `beneficiarylastname` varchar(25) DEFAULT NULL,
  `beneficiarycontact` varchar(13) DEFAULT NULL,
  `beneficiaryaddress1` varchar(45) DEFAULT NULL,
  `beneficiaryaddress2` varchar(45) DEFAULT NULL,
  `beneficiarycity` varchar(30) DEFAULT NULL,
  `beneficiarycountry` varchar(30) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `createdby` char(12) DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  `modifiedby` char(12) DEFAULT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `currencyconversionmaster` (
  `fromcurrency` varchar(3) NOT NULL,
  `tocurrency` varchar(3) NOT NULL,
  `conversionvalue` decimal(18,2) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `modifiedby` varchar(45) DEFAULT NULL,
  `createdby` varchar(45) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  PRIMARY KEY (`fromcurrency`,`tocurrency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `currencymaster` (
  `currencyname` varchar(45) DEFAULT NULL,
  `currencycode` varchar(45) NOT NULL,
  PRIMARY KEY (`currencycode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `customer` (
  `customerid` char(12) NOT NULL,
  `customerfirstname` varchar(35) DEFAULT NULL,
  `customerlastname` varchar(25) DEFAULT NULL,
  `customercontact` varchar(13) DEFAULT NULL,
  `customeraddress1` varchar(45) DEFAULT NULL,
  `customeraddress2` varchar(45) DEFAULT NULL,
  `customercity` varchar(30) DEFAULT NULL,
  `isregistered` char(1) DEFAULT NULL,
  `customerloyaltypoints` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `createdby` char(12) DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  `modifiedby` char(12) DEFAULT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `deliverydetails` (
  `deliverydetailsid` char(10) NOT NULL,
  `transactionid` varchar(45) DEFAULT NULL,
  `deliverystatus` varchar(45) DEFAULT NULL,
  `deliverystatuscomment` varchar(45) DEFAULT NULL,
  `couriername` varchar(45) DEFAULT NULL,
  `couriercontact` varchar(45) DEFAULT NULL,
  `couriertrackingnumber` varchar(45) DEFAULT NULL,
  `courieracknowledgement` varchar(45) DEFAULT NULL,
  `customeracknowledgement` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`deliverydetailsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `deliveryoption_master` (
  `deliveryoptionid` bigint(64) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `createdby` varchar(45) DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  `modifiedby` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`deliveryoptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `supervisor` (
  `supervisorid` char(12) NOT NULL,
  `agentcode` char(12) NOT NULL,
  `supervisorfirstname` varchar(35) DEFAULT NULL,
  `supervisorlastname` varchar(25) DEFAULT NULL,
  `supervisorcontact` varchar(13) DEFAULT NULL,
  `supervisoraddress1` varchar(45) DEFAULT NULL,
  `supervisoraddress2` varchar(45) DEFAULT NULL,
  `supervisorcity` varchar(30) DEFAULT NULL,
  `supervisorcountry` varchar(30) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `createdby` char(12) DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  `modifiedby` char(12) DEFAULT NULL,
  PRIMARY KEY (`supervisorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `transaction` (
  `transactionid` int(11) NOT NULL,
  `sendingagent` char(12) DEFAULT NULL,
  `receivingagent` char(12) DEFAULT NULL,
  `payincurrency` char(3) DEFAULT NULL,
  `payoutcurrency` char(3) DEFAULT NULL,
  `transactionamount` decimal(18,2) DEFAULT NULL,
  `servicetax` decimal(18,2) DEFAULT NULL,
  `customerid` char(12) DEFAULT NULL,
  `beneficiaryid` char(12) DEFAULT NULL,
  `status` bigint(64) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `deliveryoption` int(11) DEFAULT NULL,
  `customeridentitytype` varchar(20) DEFAULT NULL,
  `customeridentitynumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`transactionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `transactionstatus_master` (
  `idtransactionstatusid` bigint(64) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `createdby` varchar(45) DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  `modifiedby` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtransactionstatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
