SELECT alegeri,
    diaspora,
    Mediu,
    Judet,
    datetime(timestamp) as timestamp,
    SUM(inscrisi_L_permanente) AS inscrisi_L_permanente,
    SUM(inscrisi_L_complementare) AS inscrisi_L_complementare,
    SUM(LP) AS LP,
    SUM(LS) AS LS,
    SUM(UM) AS UM,
    -- SUM(LT) AS LT,
    SUM([M_1824]) + SUM([M_2534])  + SUM([M_3544]) + SUM([M_4564]) + SUM([M_65+]) as M,
    SUM([F_1824]) + SUM([F_2534])  + SUM([F_3544]) + SUM([F_4564]) + SUM([F_65+]) as F
    
FROM prezenta_sv_diff
WHERE LT > 0
GROUP BY alegeri,
    timestamp,
    diaspora,
    Mediu,
    Judet
ORDER by alegeri,
    diaspora,
    timestamp
 
