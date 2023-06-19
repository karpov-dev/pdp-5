CREATE VIEW v_total
AS
SELECT T.FirstName, T.LastName, JP.JobPositionName, F.FackultetName, L.StreetAddress, L.Country, L.Region
FROM pdp.Teacher as T
JOIN pdp.Facultet as F ON F.FackultetId = T.FackultetId
JOIN pdp.Location as L ON L.LocationId = F.LocationId
JOIN pdp.JobPosition as JP ON JP.JobPositionId = T.JobPositionId;