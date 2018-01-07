select
PassengerId,
Survived,
CASE WHEN Pclass=1 THEN 1 ELSE 0 END AS is_first_class,
CASE WHEN Pclass=2 THEN 1 ELSE 0 END AS is_second_class,
CASE WHEN Name like '%(%' THEN 1 ELSE 0 END AS has_parenthese_in_name,
TRIM(SUBSTR(Name,1,instr(Name,',')-1)) AS last_name,

CASE WHEN LOWER(SUBSTR(Sex,1,1)) = 'f' THEN 1 ELSE 0 END AS is_female,
CASE WHEN Age < 5 THEN 1 ELSE 0 END AS is_toddler,
CASE WHEN Age >= 5 and Age < 19 THEN 1 ELSE 0 END AS is_child,
CASE WHEN (Age >= 19 and Age < 36) or Age is null THEN 1 ELSE 0 END AS is_young_adult,
CASE WHEN Age >= 36 and Age < 51 THEN 1 ELSE 0 END AS is_adult,
CASE WHEN Parch >= 1 THEN 1 ELSE 0 END AS has_parent_or_child,
CASE WHEN SibSp >= 1 THEN 1 ELSE 0 END AS has_a_sibling,
has_letter_in_ticket,
MAX(MIN(IFNULL(fare,0),100),0) AS fare,
CASE WHEN Cabin like '%A%' or Cabin like '%B%' THEN 1 ELSE 0 END AS cabin_like_A_or_B,
CASE WHEN Cabin like '%C%' or Cabin like '%D%' THEN 1 ELSE 0 END AS cabin_like_C_or_D,
CASE WHEN Cabin like '%E%' or Cabin like '%F%' or Cabin like '%G%' or Cabin like '%T%' THEN 1 ELSE 0 END AS cabin_like_E_F_G_or_T,
CASE WHEN Embarked = 'C' THEN 1 ELSE 0 END AS from_cherbourg,
CASE WHEN Embarked = 'S' THEN 1 ELSE 0 END AS from_southampton
from table1 AS fact
