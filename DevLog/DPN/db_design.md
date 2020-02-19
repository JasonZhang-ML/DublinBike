# This file describe the structure of the tables we used in this project.
The name of database is "dbike".
## Table "station"
This table contains the data related to the occupancy of each bike station in dublin which includes the latitude, the longitude of
 the station, available stands, available bikes, the opening status of the station.  
 
name|type|desc
---|:--:|---:
sid|int(11)|
stationid|int(11)|
lat|float(5,2)|
lng|float(5,2)|
stands|int(11)|
bikes|int(11)|
status|ENUM('OPEN','CLOSED')|
update|timestamp|
modify_time|timestamp| 


## Table "station_weather"
