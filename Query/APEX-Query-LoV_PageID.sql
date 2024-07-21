SELECT
   SYS_CONNECT_BY_PATH(name, ' -> ') "displayValue",
   tag "returnValue"
FROM
   hr_gb_custommenu START WITH id in (
      select
         id
      from
         HR_GB_CUSTOMMENU
      where 1=1
         and pid is null
   ) CONNECT BY PRIOR id = pid
ORDER BY
   "returnValue",
   "displayValue";