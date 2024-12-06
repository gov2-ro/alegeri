WITH aggregated AS (
    SELECT 
        timestamp || ' Europe/Bucharest' AS timestamp,
        alegeri,
        diaspora,
        Judet,
        Mediu,
        SUM(M_1824) AS M_1824,
        SUM(M_2534) AS M_2534,
        SUM(M_3544) AS M_3544,
        SUM(M_4564) AS M_4564,
        SUM("M_65+") AS M_65plus,
        SUM(F_1824) AS F_1824,
        SUM(F_2534) AS F_2534,
        SUM(F_3544) AS F_3544,
        SUM(F_4564) AS F_4564,
        SUM("F_65+") AS F_65plus
    FROM prezenta_sv_diff
    GROUP BY 
        timestamp, 
        alegeri, 
        diaspora, 
        Judet, 
        Mediu
)
SELECT timestamp || ' Europe/Bucharest' AS timestamp, alegeri, diaspora, Judet, Mediu, 'M' AS MF, 'v1824' AS Age, M_1824 AS Total FROM aggregated
UNION ALL
SELECT timestamp || ' Europe/Bucharest' AS timestamp, alegeri, diaspora, Judet, Mediu, 'M', 'v2534', M_2534 FROM aggregated
UNION ALL
SELECT timestamp || ' Europe/Bucharest' AS timestamp, alegeri, diaspora, Judet, Mediu, 'M', 'v3544', M_3544 FROM aggregated
UNION ALL
SELECT timestamp || ' Europe/Bucharest' AS timestamp, alegeri, diaspora, Judet, Mediu, 'M', 'v4564', M_4564 FROM aggregated
UNION ALL
SELECT timestamp || ' Europe/Bucharest' AS timestamp, alegeri, diaspora, Judet, Mediu, 'M', 'v65+', M_65plus FROM aggregated
UNION ALL
SELECT timestamp || ' Europe/Bucharest' AS timestamp, alegeri, diaspora, Judet, Mediu, 'F', 'v1824', F_1824 FROM aggregated
UNION ALL
SELECT timestamp || ' Europe/Bucharest' AS timestamp, alegeri, diaspora, Judet, Mediu, 'F', 'v2534', F_2534 FROM aggregated
UNION ALL
SELECT timestamp || ' Europe/Bucharest' AS timestamp, alegeri, diaspora, Judet, Mediu, 'F', 'v3544', F_3544 FROM aggregated
UNION ALL
SELECT timestamp || ' Europe/Bucharest' AS timestamp, alegeri, diaspora, Judet, Mediu, 'F', 'v4564', F_4564 FROM aggregated
UNION ALL
SELECT timestamp || ' Europe/Bucharest' AS timestamp, alegeri, diaspora, Judet, Mediu, 'F', 'v65+', F_65plus FROM aggregated
