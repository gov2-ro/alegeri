SELECT alegeri,
    diaspora,
    Mediu,
    datetime(timestamp) as timestamp,
    SUM(inscrisi_L_permanente) AS inscrisi_L_permanente,
    SUM(inscrisi_L_complementare) AS inscrisi_L_complementare,
    SUM(LP) AS LP,
    SUM(LS) AS LS,
    SUM(LSC) AS LSC,
    SUM(UM) AS UM,
    SUM(LT) AS LT,
    SUM([M_1824]) as "M_1824",
    SUM([M_2534]) as "M_2534",
    SUM([M_3544]) as "M_3544",
    SUM([M_4564]) as "M_4564",
    SUM([M_65+]) as "M_65+",
    SUM([F_1824]) as "F_1824",
    SUM([F_2534]) as "F_2534",
    SUM([F_3544]) as "F_3544",
    SUM([F_4564]) as "F_4564",
    SUM([F_65+]) as "F_65+"
FROM prezenta_sv_diff
WHERE LT > 0
GROUP BY alegeri,
    timestamp,
    diaspora,
    Mediu
ORDER by alegeri,
    diaspora,
    timestamp
 
