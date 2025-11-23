-- Fabric notebook source

-- METADATA ********************

-- META {
-- META   "kernel_info": {
-- META     "name": "sqldatawarehouse"
-- META   },
-- META   "dependencies": {
-- META     "warehouse": {
-- META       "default_warehouse": "7c673a14-f430-adcb-4bd3-c437072a3e0a",
-- META       "known_warehouses": [
-- META         {
-- META           "id": "7c673a14-f430-adcb-4bd3-c437072a3e0a",
-- META           "type": "Datawarehouse"
-- META         }
-- META       ]
-- META     }
-- META   }
-- META }

-- CELL ********************

-- Welcome to your new notebook
-- Type here in the cell editor to add code!


-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

SELECT TOP (100) [CustomerKey],
			[WWICustomerID],
			[Customer],
			[BillToCustomer],
			[Category],
			[BuyingGroup],
			[PrimaryContact],
			[PostalCode],
			[ValidFrom],
			[ValidTo],
			[LineageKey]
FROM [MyDW].[dbo].[dimension_customer]

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }
