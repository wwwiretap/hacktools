DNS FOOTPRINTING

[root@localbox] dig 1-grid.com => 41.185.120.102
[root@localbox] whois -h whois.cymru.com -- '-v 41.185.120.102'

AS      | IP               | BGP Prefix          | CC | Registry | Allocated  | AS Name
36943   | 41.185.120.102   | 41.185.0.0/16       | ZA | afrinic  | 2008-10-21 | ZA-1-Grid, ZA

[root@localbox] whois -h whois.radb.net 41.185.120.102
