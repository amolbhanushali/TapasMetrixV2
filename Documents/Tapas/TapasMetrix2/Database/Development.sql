select * from mst_user_tbl where userName='10603876';
/*update mst_user_tbl set userWorkLocation='onsite', userRole='admin' where userName='10603876';
*/

select * from mst_activity_tbl;

INSERT INTO `mst_activity_tbl` (activityID,activityName, activityDesc,parentActivity,isActive) VALUES ('48','FOTA create via Jenkins','FOTA create via Jenkins','0',1);

Select * from mst_role_tbl;