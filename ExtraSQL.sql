--SQL USED IN APP

--F15F6 RFE REPORT
select "RFE_ID", 
(Select name from F15F6_emp e where e.emp_id = (select F15F6_emp_id from F15F6_RFE)) as Requestor,
(select rfe_status from F15F6_Status s where s.status_id = (select F15F6_status_id from F15F6_RFE)) as Status,
"EXPLANATION",
"ALT_PROTECTIONS",
"APPROVAL_REVIEW_DATE"
from "#OWNER#"."F15F6_RFE_VIEW" 
 where F15F6_EMP_ID = :P1_LAB_EMP  or :P1_LAB_EMP in (Select F15F6_EMP_EMP_ID from F15F6_Contacts where F15F6_EMP_EMP_ID = :P1_LAB_EMP) or (select F15F6_auth_id from F15F6_emp where emp_id = :P1_LAB_EMP) <> 3 or :P1_LAB_EMP in (Select F15F6_EMP_EMP_ID from F15F6_Contacts where F15F6_EMP_EMP_ID = :P1_LAB_EMP);
  


--F15F6_HISTORY REPORT
select HIST_ID,
       (select rfe_status from F15F6_Status s where s.status_id = (select F15F6_status_id from F15F6_RFE where RFE_id = :P17_SELECT_RFE)) as Status,
       EFFECTIVE_DATE,
       (select name from F15F6_emp e where e.emp_id = (select F15F6_emp_id from F15F6_RFE where RFE_id = :P17_SELECT_RFE)) as Entered_By
  from F15F6_HISTORY
  
  
